;; https://github.com/benbooth5/screensend.el/blob/master/screensend.el

(defvar tmux-session nil "Current selected tmux session")
(defvar tmux-send-hist nil)

(defun tmux-list ()
  "Get list of active tmux sessions."
  (let ((output (with-output-to-string
                  (with-current-buffer standard-output
                    (call-process "tmux" nil '(t nil) nil "list-sessions"))))
        (re "^\\([^:]*\\):")
        (sessions '()))
    (when (string-match re output)
      (push (match-string 1 output) sessions))
    (while (string-match re output (match-end 1))
      (push (match-string 1 output) sessions))
    sessions))

;;;###autoload
(defun tmux-select (session)
  "Select a tmux session."
  (interactive
   (list (concat
          (completing-read "Select a tmux session: " (tmux-list))
          (let ((window (read-from-minibuffer "Select a window (current): ")))
            (if (and window (> (length window) 0))
                (concat ":" window)
              "")))))
  (setq tmux-session session))

;;;###autoload
(defun tmux-send (&optional no-new-line)
  "Send selected region or currently-surrounding blank line-separated \
block of text to the selected tmux session."
  (interactive "P")
  ;; prompt at least once
  (unless (and tmux-session (region-active-p) (not (y-or-n-p (format "Send region to %s?" tmux-session))))
    (when (not tmux-session)
      (call-interactively 'tmux-select))
    (let ((selected (if (region-active-p)
                        (buffer-substring-no-properties (region-beginning) (region-end))
                      (read-from-minibuffer "Command: " nil nil nil 'tmux-send-hist)))
          (tmpfile (make-temp-file "tmux-send.")))
      (when (region-active-p)
        (add-to-history 'tmux-send-hist selected))
      (with-temp-file tmpfile
        (insert selected)
        (unless no-new-line (insert "\n")))
      (call-process "tmux" nil nil nil
                    "load-buffer" tmpfile ";"
                    "paste-buffer" "-t" tmux-session ";")
      (delete-file tmpfile)
      (deactivate-mark))))

(provide 'tmux-session)
