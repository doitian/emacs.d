;; https://github.com/benbooth5/screensend.el/blob/master/screensend.el

(require 'eshell)

(defvar tmux-session nil "Current selected tmux session")
(defvar tmux-last-command nil "Last sent command")
(defvar tmux-send-hist nil)
(defvar tmux-send-next-compile-command nil "Whether next compile command should be send to tmux")

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


(defun tmux-send-command (command &optional skip-store-last-command)
  "Send COMMAND to selected `tmux-session'."
  (interactive)
  (or tmux-session (call-interactively 'tmux-select))
  (unless tmux-session
    (error "Must select a tmux session first."))

  (let ((tmpfile (make-temp-file "tmux-send.")))
    (with-temp-file tmpfile
      (insert command))
    (call-process "tmux" nil nil nil
                  "load-buffer" tmpfile ";"
                  "paste-buffer" "-t" tmux-session ";")
    (delete-file tmpfile))
  (message "tmux (%s): %s" tmux-session
           (if (eq ?\n (car (last (string-to-list command))))
               (substring command 0 -1)
             command))
  (unless skip-store-last-command
    (setq tmux-last-command command)))

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
                      (read-from-minibuffer "Command: " nil nil nil 'tmux-send-hist))))
      (when (region-active-p)
        (add-to-history 'tmux-send-hist selected))
      (tmux-send-command (if no-new-line
                             selected
                           (concat selected "\n")))
      (deactivate-mark))))

;;;###autoload
(defun tmux-toggle-send-next-compile-command ()
  "Send next compile command to selected tmux session."
  (interactive)
  ;; should select a session first
  (or tmux-session (call-interactively 'tmux-select))
  (unless tmux-session
    (error "Must select a tmux session first."))
  (setq tmux-send-next-compile-command (not tmux-send-next-compile-command))
  (if tmux-send-next-compile-command
      (message "Send next compile command to tmux: %s" tmux-session)
    (message "Cancel sending next compile command to tmux")))

;;;###autoload
(defun tmux-cd ()
  "Send command to tmux to cd to `default-directory'."
  (interactive)
  (tmux-send-command (format "cd %s\n" (eshell-quote-argument default-directory)) 'skip-store-last-command))

;;;###autoload
(defun tmux-repeat ()
  "Resend last command to tmux."
  (interactive)
  (tmux-send-command tmux-last-command 'skip-store-last-command))

(defadvice compile (around send-compile-command-to-tmux (command &optional comint) activate)
  (if tmux-send-next-compile-command
      (progn
        (tmux-send-command (format "cd %s; %s\n" (eshell-quote-argument default-directory) command))
        (setq tmux-send-next-compile-command nil))
    ad-do-it))

(provide 'tmux-session)
