;;; my-loaddefs.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads nil "alternative-files" "alternative-files.el"
;;;;;;  (21559 56845 0 0))
;;; Generated autoloads from alternative-files.el

(defvar alternative-files-rules nil)

(make-variable-buffer-local 'alternative-files-rules)

(put 'alternative-files-rules 'safe-local-variable 'listp)

(autoload 'alternative-files-existing "alternative-files" "\
List of existing alternative files

\(fn &optional FORCE)" nil nil)

(autoload 'alternative-files-missing "alternative-files" "\
List of missing alternative files.

\(fn &optional FORCE)" nil nil)

(autoload 'alternative-files-find-file "alternative-files" "\
Find alternative files.

With a \\[universal-argument] prefix argument P to open in other window, \\[universal-argument] \\[universal-argument] to reload alternative file list

\(fn &optional P)" t nil)

(autoload 'alternative-files-create-file "alternative-files" "\
Create non-existed alternative files.

With a \\[universal-argument] prefix argument P to open in other window, \\[universal-argument] \\[universal-argument] to reload alternative file list.

\(fn &optional P)" t nil)

;;;***

;;;### (autoloads nil "tmux-send" "tmux-send.el" (21560 3208 0 0))
;;; Generated autoloads from tmux-send.el

(autoload 'tmux-select "tmux-send" "\
Select a tmux session.

\(fn SESSION)" t nil)

(autoload 'tmux-send "tmux-send" "\
Send selected region or currently-surrounding blank line-separated block of text to the selected tmux session.

\(fn &optional NO-NEW-LINE)" t nil)

(autoload 'tmux-toggle-send-next-compile-command "tmux-send" "\
Send next compile command to selected tmux session.

\(fn)" t nil)

(autoload 'tmux-cd "tmux-send" "\
Send command to tmux to cd to `default-directory'.

\(fn)" t nil)

(autoload 'tmux-repeat "tmux-send" "\
Resend last command to tmux.

\(fn)" t nil)

;;;***

(provide 'my-loaddefs)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; my-loaddefs.el ends here
