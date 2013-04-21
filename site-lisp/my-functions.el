;;; my-functions.el --- My functions

;;;###autoload
(defun mf-next-line-and-open-it-if-not-empty ()
  "Go to next line. Open it unless the line is empty"
  (interactive)
  (forward-line)
  (unless (looking-at "[  ]*$")
    (open-line 1))
  (indent-according-to-mode))

(defvar mf-new-line-delimeter ";")
(make-variable-buffer-local 'mf-new-line-delimeter)

;;;###autoload
(defun mf-append-line-delimter-then-next-line-and-open-it-if-not-empty ()
  "Append new line delimeter at the end of current line and go to next line.
Open next line if it is not empty."
  (interactive)
  (move-end-of-line 1)
  (unless (looking-back mf-new-line-delimeter)
    (insert mf-new-line-delimeter))
  (mf-next-line-and-open-it-if-not-empty))

;;;###autoload
(defun mf-shrink-whitespaces ()
  "Remove white spaces around cursor to just one or none.
If current line does not contain non-white space chars, then remove blank lines to just one.
If current line contains non-white space chars, then shrink any whitespace char surrounding cursor to just one space.
If current line is a single space, remove that space.

Calling this command 3 times will always result in no whitespaces around cursor."
  (interactive)
  (let (
        cursor-point
        line-has-meat-p  ; current line contains non-white space chars
        spaceTabNeighbor-p
        whitespace-begin whitespace-end
        space-or-tab-begin space-or-tab-end
        line-begin-pos line-end-pos
        )
    (save-excursion
      ;; todo: might consider whitespace as defined by syntax table, and also consider whitespace chars in unicode if syntax table doesn't already considered it.
      (setq cursor-point (point))

      (setq spaceTabNeighbor-p (if (or (looking-at " \\|\t") (looking-back " \\|\t")) t nil) )
      (move-beginning-of-line 1) (setq line-begin-pos (point) )
      (move-end-of-line 1) (setq line-end-pos (point) )
      ;;       (re-search-backward "\n$") (setq line-begin-pos (point) )
      ;;       (re-search-forward "\n$") (setq line-end-pos (point) )
      (setq line-has-meat-p (if (< 0 (count-matches "[[:graph:]]" line-begin-pos line-end-pos)) t nil) )
      (goto-char cursor-point)

      (skip-chars-backward "\t ")
      (setq space-or-tab-begin (point))

      (skip-chars-backward "\t \n")
      (setq whitespace-begin (point))

      (goto-char cursor-point)      (skip-chars-forward "\t ")
      (setq space-or-tab-end (point))
      (skip-chars-forward "\t \n")
      (setq whitespace-end (point))
      )

    (if line-has-meat-p
        (let (deleted-text)
          (when spaceTabNeighbor-p
            ;; remove all whitespaces in the range
            (setq deleted-text (delete-and-extract-region space-or-tab-begin space-or-tab-end))
            ;; insert a whitespace only if we have removed something
            ;; different that a simple whitespace
            (if (not (string= deleted-text " "))
                (insert " ") ) ) )

      (progn
        ;; (delete-region whitespace-begin whitespace-end)
        ;; (insert "\n")
        (delete-blank-lines)
        )
      ;; todo: possibly code my own delete-blank-lines here for better efficiency, because delete-blank-lines seems complex.
      )
    )
  )

;;http://emacsredux.com/blog/2013/04/09/kill-whole-line/
;;;###autoload
(defun mf-smart-kill-whole-line (&optional arg)
  "A simple wrapper around `kill-whole-line' that respects indentation."
  (interactive "p")
  (kill-whole-line arg)
  (back-to-indentation))

;; http://www.emacswiki.org/emacs/IndirectBuffers
(defvar mf-indirect-mode-name nil
  "Mode to set for indirect buffers.")
(make-variable-buffer-local 'mf-indirect-mode-name)

;;;###autoload
(defun mf-indirect-region (start end)
  "Edit the current region in another buffer.
    If the buffer-local variable `mf-indirect-mode-name' is not set, prompt
    for mode name to choose for the indirect buffer interactively.
    Otherwise, use the value of said variable as argument to a funcall."
  (interactive "r")
  (let ((buffer-name (generate-new-buffer-name "*indirect*"))
        (mode
         (if (not mf-indirect-mode-name)
             (setq mf-indirect-mode-name
                   (intern
                    (completing-read 
                     "Mode: "
                     (mapcar (lambda (e) 
                               (list (symbol-name e)))
                             (apropos-internal "-mode$" 'commandp))
                     nil t)))
           mf-indirect-mode-name)))
    (pop-to-buffer (make-indirect-buffer (current-buffer) buffer-name))
    (funcall mode)
    (narrow-to-region start end)
    (goto-char (point-min))
    (shrink-window-if-larger-than-buffer)))

;;;###autoload
(defun mf-switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))

;;;###autoload
(defun mf-rename-current-buffer-file ()
  "Renames current buffer and file it is visiting."
  (interactive)
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (let ((new-name (read-file-name "New name: "
                                      (file-name-directory filename)
                                      nil nil
                                      (file-name-nondirectory filename))))
        (if (get-buffer new-name)
            (error "A buffer named '%s' already exists!" new-name)
          (rename-file filename new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil)
          (message "File '%s' successfully renamed to '%s'"
                   name (file-name-nondirectory new-name)))))))

(put 'mf-rename-current-buffer-file 'ido 'ignore)

;;;###autoload
(defun mf-xsteve-save-current-directory ()
  "Save the current directory to the file ~/.emacs.d/data/pwd"
  (interactive)
  (let ((dir default-directory))
    (with-current-buffer (find-file-noselect "~/.emacs.d/data/pwd")
      (delete-region (point-min) (point-max))
      (insert (concat dir "\n"))
      (save-buffer)
      (kill-buffer (current-buffer)))))

;;;###autoload
(defun mf-find-alternative-file-with-sudo ()
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
             buffer-file-name))))

;;;###autoload
(defun mf-insert-user ()
  (interactive)
  (insert (user-full-name)))

;;;###autoload
(defun mf-insert-time ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d %H:%M:%S")))

;;;###autoload
(defun mf-insert-timestamp ()
  (interactive)
  (insert (format-time-string "%s")))

;;;###autoload
(defun mf-insert-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

;;;###autoload
(defun mf-insert-file-name ()
  (interactive)
  (insert (file-name-nondirectory
           (buffer-file-name
            (if (minibufferp)
                (window-buffer (minibuffer-selected-window))
              (current-buffer))))))

;; http://curiousprogrammer.wordpress.com/2009/05/14/inserting-buffer-filename/
(defun mf-jared/get-files-and-buffers ()
  (let ((res '()))
    (dolist (buffer (buffer-list) res)
      (let ((buffername (buffer-name buffer))
            (filename (buffer-file-name buffer)))
        (unless (string-match "^ *\\*.*\\*$" buffername)
          (push buffername res))
        (when filename (push filename res))))))


;;;###autoload
(defun mf-jared/insert-file-or-buffer-name (&optional initial)
  (interactive)
  (let ((name (ido-completing-read "File/Buffer Name: "
                                   (mf-jared/get-files-and-buffers)
                                   nil nil initial)))
    (when (and (stringp name) (> (length name) 0))
      (insert name))))
;;}}}

(provide 'my-functions)
;;; my-functions.el ends here
