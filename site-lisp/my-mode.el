;;; my-mode.el --- Customizations

(defvar my-minor-mode-map (make-sparse-keymap)
  "keymap for `my-minor-mode'")

(defvar my-keymap (make-sparse-keymap)
  "keymap binded to `my-keymap-prefix'")

(defconst my--original-exec-path exec-path
  "Remember `exec-path'")

(defconst my--original-env-path (getenv "PATH")
  "Remember env variable PATH")


(defun my--set-default-as-directory (sym val)
  "Nomalize directory variable, ensure trailing slash"
  (set-default sym (file-name-as-directory (expand-file-name val))))

(defun my--set-exec-path (sym val)
  "Set `my-exec-path' to VAL"
  (let ((paths (mapcar 'expand-file-name (and val (split-string val ":")))))
    (set sym val)
    (setq exec-path (append paths my--original-exec-path))
    (setenv "PATH" (mapconcat 'identity (append paths (list my--original-env-path)) path-separator))))

(defun my--set-keymap-prefix (sym val)
  "Set `my-keymap-prefix' to VAL"
  (when (and (boundp 'my-keymap-prefix) my-keymap-prefix)
    ;; unregister old prefix
    (define-key my-minor-mode-map (read-kbd-macro my-keymap-prefix) nil))
  (setq sym val)
  (define-key my-minor-mode-map (read-kbd-macro val) my-keymap))



(defgroup my-config nil "Customizations for init.el" :group 'emacs)

(defcustom my-frame-font "Monospace:pixelsize=21"
  "Default font"
  :type 'string
  :group 'my-config
  :set (lambda (symbol value)
         (set-default symbol value)
         (set-frame-font value)))

(defcustom my-frame-font-chinese "Monospace:pixelsize=22"
  "Chinese font"
  :type 'string
  :group 'my-config
  :set (lambda (symbol value)
         (set-default symbol value)
         (set-fontset-font "fontset-default" 'chinese-gbk value)))

(defcustom my-custom-readonly-file (expand-file-name "custom.readonly.el" user-emacs-directory)
  "Allow override customizations in `custom-file'"
  :type 'file
  :group 'my-config)

(defcustom my-secrets-file (expand-file-name "secrets.el" user-emacs-directory)
  "extra file to load, which may include secrets and should not be tracked in SCM"
  :type 'file
  :group 'my-config)

(defcustom my-codebase-dir (expand-file-name "~/codebase/")
  "Root directory of projects source"
  :group 'my-config
  :type 'directory
  :set 'my--set-default-as-directory)

(defcustom my-dropbox-dir (expand-file-name "~/Dropbox/")
  "Dropbox root directory"
  :group 'my-config
  :type 'directory
  :set 'my--set-default-as-directory)

(defcustom my-exec-path
  (mapcar 'expand-file-name nil)
  "My path for executable files searching"
  :group 'my-config
  :type 'string
  :set 'my--set-exec-path)

(defcustom my-keymap-prefix "M-s"
  "Prefix for my keybindings"
  :group 'my-config
  :type 'string
  :set 'my--set-keymap-prefix)



;;;###autoload
(define-minor-mode my-minor-mode
  "Define a minor mode for `my-keymap'"
  t "" my-minor-mode-map
  :global t)

(define-key my-keymap (kbd "C-g") 'keyboard-quit)

(provide 'my-mode)

;;; my-mode.el ends here
