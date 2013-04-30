;;; win-resize --- windows resize commands

(defun win-resize-top-or-bot ()
  "Figure out if the current window is on top, bottom or in the
middle"
  (let* ((win-edges (window-edges))
         (this-window-y-min (nth 1 win-edges))
         (this-window-y-max (nth 3 win-edges))
         (fr-height (frame-height)))
    (cond
     ((eq 0 this-window-y-min) "top")
     ((eq (- fr-height 1) this-window-y-max) "bot")
     (t "mid"))))

(defun win-resize-left-or-right ()
  "Figure out if the current window is to the left, right or in the
middle"
  (let* ((win-edges (window-edges))
         (this-window-x-min (nth 0 win-edges))
         (this-window-x-max (nth 2 win-edges))
         (fr-width (frame-width)))
    (cond
     ((eq 0 this-window-x-min) "left")
     ((<= fr-width this-window-x-max) "right")
     (t "mid"))))

;;;###autoload
(defun win-resize-enlarge-horiz (arg)
  (interactive "p")
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window (- arg)))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window arg))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window (- arg)))
   (t (message "nil"))))

;;;###autoload
(defun win-resize-minimize-horiz (arg)
  (interactive "p")
  (cond
   ((equal "top" (win-resize-top-or-bot)) (enlarge-window arg))
   ((equal "bot" (win-resize-top-or-bot)) (enlarge-window (- arg)))
   ((equal "mid" (win-resize-top-or-bot)) (enlarge-window arg))
   (t (message "nil"))))

;;;###autoload
(defun win-resize-enlarge-vert (arg)
  (interactive "p")
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally (- arg)))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally arg))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally (- arg)))))

;;;###autoload
(defun win-resize-minimize-vert (arg)
  (interactive "p")
  (cond
   ((equal "left" (win-resize-left-or-right)) (enlarge-window-horizontally arg))
   ((equal "right" (win-resize-left-or-right)) (enlarge-window-horizontally (- arg)))
   ((equal "mid" (win-resize-left-or-right)) (enlarge-window-horizontally (arg)))))

(global-set-key [S-up] 'win-resize-enlarge-horiz)
(global-set-key [S-down] 'win-resize-minimize-horiz)
(global-set-key [S-left] 'win-resize-enlarge-vert)
(global-set-key [S-right] 'win-resize-minimize-vert)

(provide 'win-resize)

;;; win-resize.el ends here
