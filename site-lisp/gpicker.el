(require 'ido)

(defgroup gpicker nil "gpicker file finder" :group 'files)

(defcustom gpicker-cmd (executable-find "gpicker")
  "gpicker executable"
  :type 'file
  :group 'gpicker)

;;;###autoload
(defun gpicker-find-file (dir)
  (interactive
   (list
    (or (and current-prefix-arg (ido-read-directory-name "gpicker: " nil nil t))
        (and (boundp 'eproject-root) eproject-root)
        (and (not current-prefix-arg) (ido-read-directory-name "gpicker: " nil nil t))
        (if dired-directory (expand-file-name dired-directory) default-directory))))
  (when dir
    (with-temp-buffer
      (call-process gpicker-cmd nil (list (current-buffer) nil) nil
                    "-t" "guess" "-m" dir)
      (cd dir)
      (dolist (file (split-string (buffer-string) "\0"))
        (unless (string-equal file "")
          (find-file file))))))

(provide 'gpicker)
