;;; my-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (case-dwim-capitalize case-dwim-upcase case-dwim-downcase
;;;;;;  case-dwim-isearch-underscore case-dwim-isearch-dash case-dwim-underscore
;;;;;;  case-dwim-dash) "case-dwim" "case-dwim.el" (20851 59415 749852
;;;;;;  491000))
;;; Generated autoloads from case-dwim.el

(autoload 'case-dwim-dash "case-dwim" "\
Negative arg activate backward downcase, repeat to downcase more words bacward.
When region is action, downcase the region.
When last command is case transformation, continue case transformation.
Otherwise insert dash.

\(fn ARG)" t nil)

(autoload 'case-dwim-underscore "case-dwim" "\
Negative arg activate backward upcase, repeat to upcase more words bacward.
When region is action, upcase the region.
When last command is case transformation, continue case transformation.
Otherwise insert undersocre.

\(fn ARG)" t nil)

(autoload 'case-dwim-isearch-dash "case-dwim" "\


\(fn)" t nil)

(autoload 'case-dwim-isearch-underscore "case-dwim" "\


\(fn)" t nil)

(autoload 'case-dwim-downcase "case-dwim" "\
Negative arg activate backward downcase, repeat to downcase more words bacward.
When region is action, downcase the region.
Otherwise downcase following words.

\(fn ARG)" t nil)

(autoload 'case-dwim-upcase "case-dwim" "\
Negative arg activate backward upcase, repeat to upcase more words bacward.
When region is action, upcase the region.
Otherwise upcase following words.

\(fn ARG)" t nil)

(autoload 'case-dwim-capitalize "case-dwim" "\
Negative arg activate backward capitalize, repeat to capitalize more words bacward.
When region is action, capitalize the region.
Otherwise capitalize following words.

\(fn ARG)" t nil)

;;;***

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

;;;### (autoloads (my-minor-mode) "my-mode" "my-mode.el" (20851 55240
;;;;;;  306473 712000))
;;; Generated autoloads from my-mode.el

(autoload 'my-minor-mode "my-mode" "\
Define a minor mode for `my-keymap'

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("dash.el" "sequential-command.el") (20851
;;;;;;  59418 857480 184000))

;;;***

(provide 'my-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; my-loaddefs.el ends here
