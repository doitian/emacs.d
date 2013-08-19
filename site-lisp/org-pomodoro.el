;;; org-pomodoro --- Pomodoro based on org

(defvar org-pomodoro-minutes 25)
(defvar org-pomodoro-cancelling nil)
(defvar org-pomodoro-process nil)
(defvar org-pomodoro-command (locate-file "pomodoro" exec-path))

(defvar org-pomodoro-is-mac (eq system-type 'darwin))
(defvar org-pomodoro-start-scpt (expand-file-name "~/Library/Scripts/Vitamin-R 2/Start.scpt"))
(defvar org-pomodoro-stop-scpt (expand-file-name "~/Library/Scripts/Vitamin-R 2/Stop.scpt"))

;;;###autoload
(defun org-pomodoro-on-org-load ()
  (push (cons "p" org-pomodoro-minutes) org-effort-durations)
  (push '("Effort_ALL" . "1p 2p 3p 4p 5p 6p 7p 8p") org-global-properties)
  (define-key org-mode-map "\C-c\C-x'" 'org-pomodoro-columns))

;;;###autoload
(defun org-pomodoro-on-org-agenda-load ()
  (define-key org-agenda-mode-map "\C-c\C-x'" 'org-pomodoro-agenda-columns))

(defadvice org-minutes-to-hh:mm-string (around org-pomodoro-minutes-to-pomodoros activate)
  (setq ad-return-value (format "%dp" (round (/ m (float org-pomodoro-minutes))))))
(defadvice org-columns-number-to-string (around org-pomodoro-minutes-to-pomodoros activate)
  (if (memq fmt '(add_times max_times min_times mean_times))
      (setq ad-return-value (format "%dp" (round (/ (* n 60) org-pomodoro-minutes))))
    ad-do-it))

(defun org-pomodoro-after-clock-in ()
  (when (not org-timer-current-timer)
    (if org-pomodoro-is-mac
        (progn
          (let (title tags keyword)
            (save-excursion
             (with-current-buffer (marker-buffer org-clock-marker)
               (goto-char org-clock-marker)
               (outline-previous-visible-heading 1)
               (setq keyword (org-get-todo-state))
               (setq title (substring-no-properties (org-get-heading t) (if keyword (1+ (length keyword)))))
               (mapc
                (lambda (tag)
                  (unless (string= "next" tag)
                    (add-to-list 'tags (substring-no-properties tag))))
                (org-get-tags-at))
               (setq tags (mapconcat 'identity (cons (org-get-category) tags) ","))
               (unless (equal "OK" (car (process-lines "osascript" org-pomodoro-start-scpt title tags)))
                 (org-clock-out))))))
      (when (and org-pomodoro-process
                 (eq 'run (process-status org-pomodoro-process)))
        (interrupt-process org-pomodoro-process))
      (when org-pomodoro-command
        (setq org-pomodoro-process
              (start-process "pomodoro" nil "pomodoro" "-l" (number-to-string org-pomodoro-minutes)))))
    (org-timer-set-timer org-pomodoro-minutes)))

(defun org-pomodoro-after-clock-out ()
  (org-pomodoro-stop-process)
  (unless org-pomodoro-cancelling
    (org-pomodoro-cancel-timer-safe)))

(defun org-pomodoro-stop-process ()
  (if org-pomodoro-is-mac
      (call-process "osascript" nil nil nil org-pomodoro-stop-scpt)
    (when (and org-pomodoro-process
               (eq 'run (process-status org-pomodoro-process)))
      (interrupt-process org-pomodoro-process)
      (setq org-pomodoro-process nil))))

(setq org-clock-out-remove-zero-time-clocks nil)
(defun org-pomodoro-is-indivisible! ()
  (let ((org-pomodoro-cancelling t)
        (buffer (current-buffer))
        (point (point)))
    (when (org-clock-is-active)
      (setq buffer (marker-buffer org-clock-marker)
            point (marker-position org-clock-marker))
      (org-clock-out))
    (save-excursion
      (with-current-buffer buffer
        (save-restriction
          (widen)
          (goto-char point)
          (beginning-of-line 1)
          (when (and (not remove)
                     (looking-at (concat "[ \t]*" org-keyword-time-regexp))
                     (equal (match-string 1) org-clock-string))
            (goto-char (match-end 0))
            (beginning-of-line 1)
            (delete-region (point) (point-at-eol))
            (and (looking-at "\n") (> (point-max) (1+ (point)))
                 (delete-char 1))
            (message "Pomodoro is cancelled")))))))

(defun org-pomodoro-done ()
  (when (org-clock-is-active)
    (org-clock-out)
    (unless org-pomodoro-is-mac
      (start-process-shell-command "pomodoro-ring" nil "mplayer ~/Dropbox/resources/audio/ring.mp3")
      (start-process-shell-command "pomodoro-osd" nil "echo Pomodoro Break | dzen2 -p 100 -geometry +0-0 -h 1080 -fn Sans-60 -ta l"))))

(defun org-pomodoro-cancel-timer-safe ()
  (when org-timer-current-timer (org-timer-cancel-timer)))

(add-hook 'org-timer-pause-hook 'org-pomodoro-cancel-timer-safe)
(add-hook 'org-timer-continue-hook 'org-pomodoro-cancel-timer-safe)
(add-hook 'org-timer-stop-hook 'org-pomodoro-cancel-timer-safe)
(add-hook 'org-timer-cancel-hook 'org-pomodoro-is-indivisible!)
(add-hook 'org-timer-done-hook 'org-pomodoro-done)
(add-hook 'org-clock-in-hook 'org-pomodoro-after-clock-in)
(add-hook 'org-clock-out-hook 'org-pomodoro-after-clock-out)

(defvar org-pomodoro-columns-format
  "%22SCHEDULED %CATEGORY %42ITEM %3Effort(E){:} %3CLOCKSUM_T(R) %POMODORO_INTERRUPTIONS(I){+}")

(defun org-pomodoro-columns ()
  (interactive)
  (org-columns org-pomodoro-columns-format))

(defun org-pomodoro-agenda-columns ()
  (interactive)
  (let ((org-agenda-overriding-columns-format org-pomodoro-columns-format))
   (org-agenda-columns)))

;;;###autoload
(defun org-pomodoro-record-interuptions (char)
  (interactive (list
                (if (string=
                     "internal"
                     (completing-read "type: " '("internal" "external") nil t nil nil "internal"))
                    ?' ?-)))
  (if (and org-clock-current-task org-clock-marker)
      (save-excursion
        (with-current-buffer (marker-buffer org-clock-marker)
          (goto-char org-clock-marker)
          (let ((value (concat (sort (cons char (string-to-list (org-entry-get nil "POMODORO_INTERUPTIONS"))) '<))))
            (org-entry-put nil "POMODORO_INTERUPTIONS" value)
            (org-entry-put nil "POMODORO_INTERUPTIONS_COUNT" (number-to-string (length value)))
            (message "Interuptions: %s" value))))
    (error "no active pomodoro")))

;;; org-pomodoro ends here
