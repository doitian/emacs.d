;;; my-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (module-initialize module-load) "module" "module.el"
;;;;;;  (20851 45946 509705 888000))
;;; Generated autoloads from module.el

(autoload 'module-load "module" "\
Load a module by name. Prefix argument force reload the module

\(fn NAME &optional RELOAD)" t nil)

(autoload 'module-initialize "module" "\
Load all defined modules in `module-list' except ones in `module-black-list'

\(fn &optional RELOAD)" nil nil)

;;;***

;;;### (autoloads (my-minor-mode) "my-mode" "my-mode.el" (20851 28058
;;;;;;  70319 668000))
;;; Generated autoloads from my-mode.el

(autoload 'my-minor-mode "my-mode" "\
Define a minor mode for `my-keymap'

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("autoloads.el") (20851 45964 917720 416000))

;;;***

(provide 'my-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; my-autoloads.el ends here
