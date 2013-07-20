;;; case-dwim.el --- case transformations functions

(require 'sequential-command)

(defvar case-dwim--last-command-is-case-transformation nil)

(defconst case-dwim--case-dwim-functions
  '(case-dwim-dash case-dwim-underscore case-dwim-downcase case-dwim-upcase case-dwim-capitalize))

(defun case-dwim--last-command-case-transformation-p ()
  (setq case-dwim--last-command-is-case-transformation
        (and case-dwim--last-command-is-case-transformation
             (memq last-command case-dwim--case-dwim-functions))))

(defun case-dwim--seq-count (arg)
  "Return count to repeat case transformation backword"
  (setq arg (if (zerop arg) 1 arg))
  (if (or (> seq-store-count 0) (not (eq this-command last-command)))
      arg
    (setq seq-store-count (- seq-store-count 2))))

(defun case-dwim--mc-active-p ()
  "Multiple cursors is active"
  (and (boundp 'multiple-cursors-mode) multiple-cursors-mode))

(defun case-dwim--funcall (func &rest body)
  "Call command and remember the command for mc if it is active"
  (apply func body)
    ;; (when (case-dwim--mc-active-p)
  ;;   )
  (when (case-dwim--mc-active-p)
    (setq mc--this-command `(lambda ()
                              (interactive)
                              (,func ,@body)
                              (setq this-command ',this-command)))))

(defun case-dwim--call-interactively (func)
  "Call command interactively"
  (call-interactively func)
  (when (case-dwim--mc-active-p)
    (setq mc--this-command `(lambda ()
                              (interactive)
                              (call-interactively ,func)
                              (setq this-command ',this-command)))))

(defun case-dwim--insert-or-case-transform (char case-word case-region arg)
  "Insert string unless prefix is negative or last command is a case transformation"
  (if (or (< arg 0)
          (region-active-p) 
          (case-dwim--last-command-case-transformation-p))
      (case-dwim--case-transform case-word case-region arg)
    (setq case-dwim--last-command-is-case-transformation nil)
    (setq seq-store-count 0)
    (case-dwim--funcall 'insert (make-string arg char))))

(defun case-dwim--case-transform (case-word case-region arg)
  "Negative arg activate backward case transformation, when it is enabled, repeat the command extend case transformation region one more word backword.
When region is active, apply case transformation on retion.
Otherwise do case transformation on following words.
"
  (setq case-dwim--last-command-is-case-transformation t)
  (seq-count)
  (cond
   ;; negative to start case transformation backward
   ((< arg 0)
    (setq seq-store-count arg)
    (case-dwim--funcall case-word arg))
   ((region-active-p)
    (case-dwim--call-interactively case-region))
   (t (case-dwim--funcall case-word
                          (case-dwim--seq-count arg)))))

(defun case-dwim--case-word-function (operation)
  "Get case-word function for string OPERATION, which can be upcase downcase or capitalize"
  (intern (if (and (boundp 'subword-mode) subword-mode)
              (concat "subword-" operation)
            (concat operation "-word"))))

;;;###autoload
(defun case-dwim-dash (arg)
  "Negative arg activate backward downcase, repeat to downcase more words bacward.
When region is action, downcase the region.
When last command is case transformation, continue case transformation.
Otherwise insert dash."
  (interactive "p")
  (case-dwim--insert-or-case-transform ?- (case-dwim--case-word-function "downcase") 'downcase-region arg))

;;;###autoload
(defun case-dwim-underscore (arg)
  "Negative arg activate backward upcase, repeat to upcase more words bacward.
When region is action, upcase the region.
When last command is case transformation, continue case transformation.
Otherwise insert undersocre."
  (interactive "p")
  (case-dwim--insert-or-case-transform ?_ (case-dwim--case-word-function "upcase") 'upcase-region arg))

;;;###autoload
(defun case-dwim-isearch-dash ()
  (interactive)
  (let ((last-command-event ?-)) (isearch-printing-char)))

;;;###autoload
(defun case-dwim-isearch-underscore ()
  (interactive)
  (let ((last-command-event ?_)) (isearch-printing-char)))

;;;###autoload
(defun case-dwim-downcase (arg)
  "Negative arg activate backward downcase, repeat to downcase more words bacward.
When region is action, downcase the region.
Otherwise downcase following words."
  (interactive "p")
  (case-dwim--case-transform (case-dwim--case-word-function "downcase") 'downcase-region arg))

;;;###autoload
(defun case-dwim-upcase (arg)
  "Negative arg activate backward upcase, repeat to upcase more words bacward.
When region is action, upcase the region.
Otherwise upcase following words."
  (interactive "p")
  (case-dwim--case-transform (case-dwim--case-word-function "upcase") 'upcase-region arg))

;;;###autoload
(defun case-dwim-capitalize (arg)
  "Negative arg activate backward capitalize, repeat to capitalize more words bacward.
When region is action, capitalize the region.
Otherwise capitalize following words."
  (interactive "p")
  (case-dwim--case-transform (case-dwim--case-word-function "capitalize") 'capitalize-region arg))

;;; case-dwim.el ends here
