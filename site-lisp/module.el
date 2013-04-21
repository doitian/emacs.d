;;; module.el --- Wrap module in function

(defvar module-list nil
  "List of of defined modules")

(defgroup module nil "Customize modules" :group 'emacs)

(defcustom module-black-list nil
  "List of modules should not be loaded"
  :group 'module
  :type '(repeat symbol))

(defcustom module-auto-initialize t
  "Run `module-initialize' after init"
  :group 'module
  :type '(repeat symbol))

(defmacro define-module (name &optional docstring &rest body)
  "Define a module with `name' and `body' is evaluated when the module
  is required using `require-module'. `reload' flag can be used in `body' to handle module reload."
  (let ((flag (intern (concat "module-" (symbol-name name) "-loaded")))
        (init (intern (concat "module-" (symbol-name name) "-init"))))
    `(progn
       (setq module-list (cons ',name module-list))
       (defvar ,flag nil
         ,(format "Whether module `module-%s-init' has been loaded" (symbol-name name)))
       (defun ,init (&optional reload)
         ,(if (stringp docstring) docstring (concat "Init module " (symbol-name name)))
         (when (or reload (not ,flag))
           ,(unless (stringp docstring) docstring)
           ,@body)
         (setq ,flag t)))))

(defmacro require-module (name &optional reload)
  "Load a module by name."
  (let ((init (intern (concat "module-" (symbol-name name) "-init"))))
    `(unless (memq ',name module-black-list)
       (funcall ',init ,reload))))

(defvar module-load-history nil)

;;;###autoload
(defun module-load (name &optional reload)
  "Load a module by name. Prefix argument force reload the module"
  (interactive (list
		(intern
		 (completing-read "Module: "
				  (mapcar (lambda (module) (cons module module))
					  module-list)
				  nil t nil
				  'module-load-history))
		current-prefix-arg))
  (funcall (intern (format "module-%s-init" (symbol-name name))) reload))

;;;###autoload
(defun module-initialize (&optional reload)
  "Load all defined modules in `module-list' except ones in `module-black-list'"
  (mapc (lambda (module)
	  (unless (memq module module-black-list)
	    (module-load module reload)))
	module-list))

(defun module--maybe-initialize ()
  (when module-auto-initialize
    (module-initialize)))

(add-hook 'after-init-hook 'module--maybe-initialize)



(provide 'module)

;;; --- module.el ends here
