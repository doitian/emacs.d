(defvar recoll-error-regexp-alist-alist
  '((recoll "\\[file://\\(.*?\\)\\]" 1)))
(defvar recoll-error-regexp-alist '(recoll))
(eval-when-compile (require 'compile))

(define-compilation-mode recoll-mode "recoll" "recoll search" nil)
(define-key recoll-mode-map "n" 'compilation-next-error)
(define-key recoll-mode-map "p" 'compilation-previous-error)

(defun recoll-parse-results ()
  "Count the matches printed by `recoll' in the current buffer."
  (save-excursion
    (goto-char (point-min))
    (if (re-search-forward "^\\(.*\\) results$" (point-max) t)
        (string-to-number (match-string 1))
      0)))

(defun recoll-sentinel (proc result)
  (when (eq (process-status proc) 'exit)
    (with-current-buffer (process-buffer proc)
      (let ((c (recoll-parse-results)))
        (when (= c 0)
          (kill-buffer (current-buffer)))
        (message "recoll finished with %d result%s" c (if (eq c 1) "" "s"))))))

(defun recoll-filter (proc output)
  (let ((buffer (process-buffer proc))
        (inhibit-read-only t)
        beg)
    (if (buffer-live-p buffer)
      (with-current-buffer buffer
        (save-excursion
          (goto-char (setq beg (point-max)))
          (insert output)
          ;; Error properties are done by font-lock.
          (font-lock-fontify-region beg (point-max))))
      (when (processp recoll-process)
        (delete-process recoll-process)))))

(defvar recoll-history nil)
(defvar recoll-process nil)
(defconst recoll-buffer-name "*recoll*")

;;;###autoload
(defun recoll (query)
  (interactive (list
                (read-string "recoll: " nil 'recoll-history)))
  (when query
    (let ((buffer (get-buffer-create recoll-buffer-name))
          (inhibit-read-only t))
      (setq next-error-last-buffer buffer)
      (with-current-buffer buffer
        (erase-buffer)
        (recoll-mode)
        (setq buffer-read-only t)
        (font-lock-fontify-buffer)
        (display-buffer (current-buffer)))
      (setq recoll-process
            (start-process "recoll" buffer "recoll" "-t" "-q" query))
      (set-process-sentinel recoll-process 'recoll-sentinel)
      (set-process-query-on-exit-flag recoll-process nil)
      (set-process-filter recoll-process 'recoll-filter))))

(provide 'recoll)
