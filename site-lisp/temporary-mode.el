;;; temporary-mode --- A mode bind keymap on overriding-local-map

(defvar temporary-mode-current nil
  "Current temporary mode name")

;;;###autoload
(defun temporary-mode-start (mode-name keymap)
  (setq temporary-mode-current mode-name)
  (setq overriding-local-map
        (let ((map (copy-keymap keymap)))
          (define-key map [t] 'temporary-mode-pass-through)
          (map-keymap
           (lambda (key binding)
             (when (keymapp binding)
               (define-key binding [t] 'temporary-mode-pass-through)))
           map)
          map)))

;;;###autoload
(defun temporary-mode-define-keys (keymap mode-name &optional temporary-keymap)
  (if temporary-keymap
      (set (intern (format "%s-map" mode-name)) temporary-keymap)
    (setq temporary-keymap (symbol-value (intern (format "%s-map" mode-name)))))
  (temporary-mode-define-keys--internal keymap mode-name temporary-keymap))

(defun temporary-mode-define-keys--internal (keymap mode-name temporary-keymap)
  (map-keymap
   (lambda (key binding)
     (if (keymapp binding)
         (let ((map (or (cdr (assoc key (cdr keymap)))
                        (make-sparse-keymap))))
           (temporary-mode-define-keys--internal map mode-name binding)
           (setcdr keymap (cons (cons key map) (cdr keymap))))
       (setcdr keymap (cons
                       (cons key `(lambda ()
                                    (interactive)
                                    (call-interactively ',binding)
                                    (temporary-mode-start ',mode-name ,(intern (format "%s-map" mode-name)))))
                       (cdr keymap)))))
   temporary-keymap))

(defun temporary-mode-done ()
  (setq overriding-local-map nil)
  (when temporary-mode-current
    (run-hooks (intern (format "%s-done-hook" (symbol-name temporary-mode-current)))))
  (setq temporary-mode-current nil))

(defun temporary-mode-pass-through ()
  (interactive)
  (temporary-mode-done)
  (let* ((keys (progn
                 (setq unread-command-events
                       (append (this-single-command-raw-keys)
                               unread-command-events))
                 (read-key-sequence-vector "")))
         (command (and keys (key-binding keys))))
    (when (commandp command)
      (setq this-command command
            this-original-command command)
      (when (and (boundp 'multiple-cursors-mode) multiple-cursors-mode)
        (setq mc--this-command command))
      (call-interactively command))))

(provide 'temporary-mode)

;;; temporary-mode.el ends here
