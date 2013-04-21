;;; thing-actions.el --- Fast mark and move by different things
;; Copyright (C) 2013 Ian Yang

;; Author: Ian Yang <doit dot ian (at) gmail dot com>
;; Keywords: navigation, mark
;; Filename: thing-actions.el
;; Description: Fast mark and move by different things
;; Created: 2013-04-09 05:50:00
;; Version: 0.1
;; Last-Updated: 2013-04-09 05:50:00
;; URL: https://github.com/doitian/thing-actions.el
;;
;; Features that might be required by this library:
;;
;;   `thing-cmds', `hide-comnt', `thingatpt', `thingatpt+'.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;; I always forget key bindings to mark or move around by defun, sexp or other
;; text entities ("things"). So I write `thing-actions', which defines uniform
;; way to mark and move by different text entities.
;;
;; To use, make sure this file and `thing-cmds.el` are on your `load-path' and
;; put the following in your .emacs file:
;;
;;     (require 'thing-actions)
;;
;; Then you can bind functions like:
;;
;;     (global-set-key (kbd "M-SPC") 'thing-actions-mark-thing)
;;
;; Now M-SPC will start `thing-actions' in mark mode. Use keys defined in
;; `thing-actions-alist' to mark different things. Following keys will toggle
;; `thing-actions' in different mode:
;;
;; M-SPC - mark thing, repeat the thing key to expand region.
;; M-s   - mark thing surround cursor
;; M-f   - move forward by thing
;; M-b   - move backward by thing
;; M-a   - move to the beginning of the thing surround cursor
;; M-e   - move to the end of the thing surround cursor
;;
;; Type any key other than keys listed above and ones in `things-actions-alist` quits things-actions.

;;; Example:

;; Suppose that `things-actions-mark-thing` is binded on "M-SPC".
;;
;; "M-SPC w w w" - mark three words, "M-3 M-SPC w" and "M-SPC M-3 w" also work.
;; "M-SPC M-f p" - move forward a paragraph.
;; "M-SPC M-a d" - move to the beginning of the defun around cursor.

;;; Code:

(require 'thing-cmds)

(defvar thing-actions--thing-cmd nil "Remember current thing command")
(defvar thing-actions--thing nil "Remember current thing")

(defvar thing-actions--overriding-local-map nil
  "Merge `thing-actions-map' and thing-actions-alist")

(defun thing-actions--update-map (&optional sym val)
  "Update thing-actions-map from thing-actions-alist"
  (when sym (set sym val))
  (when (boundp 'thing-actions-alist)
    (let ((map (copy-keymap thing-actions-map)))
      (mapc (lambda (key-thing-pair)
              (define-key
                map
                (read-kbd-macro (car key-thing-pair))
                (eval `(defun ,(intern (concat "thing-actions-apply-on-" (symbol-name (cdr key-thing-pair))))  ()
                         ,(format "Apply current active thing cmd on %s" (symbol-name (cdr key-thing-pair)))
                         (interactive)
                         (setq thing-actions--thing (quote ,(cdr key-thing-pair)))
                         (call-interactively 'thing-actions--command)))))
            thing-actions-alist)
      (define-key map [t] 'thing-actions--pass-through)
      (setq thing-actions--overriding-local-map map))))

(defgroup thing-actions nil "Actions to manipulate things")

(defcustom thing-actions-map
  (let ((map (make-sparse-keymap)))
    (define-key map (read-kbd-macro "M-SPC") 'thing-actions-mark-thing)
    (define-key map (read-kbd-macro "M-s") 'thing-actions-thing-region)
    (define-key map (read-kbd-macro "M-f") 'thing-actions-forward-thing)
    (define-key map (read-kbd-macro "M-b") 'thing-actions-backward-thing)
    (define-key map (read-kbd-macro "M-a") 'thing-actions-beginning-of-thing)
    (define-key map (read-kbd-macro "M-e") 'thing-actions-end-of-thing)
    (define-key map (read-kbd-macro "TAB") 'exchange-point-and-mark)
    (define-key map (read-kbd-macro "<tab>") 'exchange-point-and-mark)
    (define-key map "?" 'thing-actions--help)
    map)
  "User customized bindings"
  :group 'thing-actions
  :set 'thing-actions--update-map)

(defcustom thing-actions-alist
  '(("w" . word)
    ("W" . symbol)
    ("s" . sexp)
    ("d" . defun)
    ("l" . list)
    ("n" . line)
    ("." . sentence)
    ("p" . paragraph)
    ("P" . page)
    ("f" . filename)
    ("u" . url)
    ("c" . comment))
  "Map key to thing"
  :type '(alist (string :tag "Key binding")
                (symbol :tag "Thing"))
  :group 'thing-actions
  :set 'thing-actions--update-map)

(defun thing-actions--command (n)
  "Run thing cmd on thing"
  (interactive "p")
  (when (and thing-actions--thing-cmd
             thing-actions--thing)
    (if (get thing-actions--thing-cmd 'thing-actions--numeric-prefix)
        (funcall thing-actions--thing-cmd
                 thing-actions--thing n)
      (funcall thing-actions--thing-cmd
               thing-actions--thing))
    (setq this-command 'thing-actions--command)
    (when (and (boundp 'multiple-cursors-mode) multiple-cursors-mode)
      (setq mc--this-command 'thing-actions--command))))

(defun thing-actions--pass-through ()
  "Finish thing-actions and invoke the corresponding command"
  (interactive)
  (thing-actions--done)
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

(defun thing-actions--help ()
  (interactive)
  (message (mapconcat (lambda (pair)
                        (format "%s:%s" (read-kbd-macro (car pair)) (symbol-name (cdr pair))))
                      thing-actions-alist " ")))

(defun thing-actions--start (thing-cmd)
  (setq thing-actions--thing-cmd thing-cmd)
  (setq overriding-local-map thing-actions--overriding-local-map))

(defun thing-actions--done ()
  (interactive)
  (setq overriding-local-map nil))

(defun thing-actions--mark-thing-command (thing arg)
  (setq thgcmd-last-thing-type thing)
  (mark-thing thing arg t))

;;;###autoload
(defun thing-actions-mark-thing ()
  (interactive)
  (setq prefix-arg current-prefix-arg)
  (thing-actions--start 'thing-actions--mark-thing-command))

(put 'thing-actions--mark-thing-command 'thing-actions--numeric-prefix t)

(defun thing-actions--thing-region-command (thing)
  (thing-region (symbol-name thing)))

(defun thing-actions-thing-region ()
  (interactive)
  (setq prefix-arg current-prefix-arg)
  (thing-actions--start 'thing-actions--thing-region-command))

(defun thing-actions-forward-thing ()
  (interactive)
  (setq prefix-arg current-prefix-arg)
  (thing-actions--start 'forward-thing))
(put 'forward-thing 'thing-actions--numeric-prefix t)

(defun thing-actions--backward-thing-command (thing n)
  (interactive "p")
  (forward-thing thing (- n)))
(defun thing-actions-backward-thing ()
  (interactive)
  (setq prefix-arg current-prefix-arg)
  (thing-actions--start 'thing-actions--backward-thing-command))
(put 'thing-actions--backward-thing-command 'thing-actions--numeric-prefix t)

(defun thing-actions-beginning-of-thing ()
  (interactive)
  (setq prefix-arg current-prefix-arg)
  (thing-actions--start 'beginning-of-thing))

(defun thing-actions-end-of-thing ()
  (interactive)
  (setq prefix-arg current-prefix-arg)
  (thing-actions--start 'end-of-thing))



(provide 'thing-actions)

;;; thing-actions.el ends here
