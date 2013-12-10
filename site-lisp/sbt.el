;;; sbt.el --- Run sbt as in compilation comint mode

;; Copyright (C) 2013  Ian Yang

;; Author: Ian Yang <me@iany.me>
;; Keywords: processes

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; Run sbt in compilation comint mode.
;;
;; Flag `compilation-auto-jump-to-next' is turned on to  "~ test" or "~ compile"

;;; Code:

(require 'compile)

(defgroup sbt nil "sbt compilation shell mode" :group 'processes)

(defcustom sbt-project-function 'projectile-project-p
  "Function to determine project root directory.

It should be a function which returns directory name or nil.
"
  :group 'sbt
  :type 'function
  :options '(eproject-root-safe projectile-project-p))

(defcustom sbt-exec-file (locate-file "sbt" exec-path)
  "Path of sbt executable."
  :group 'sbt
  :type 'file)

(defvar sbt-command-history nil "History of sbt command")

;;;###autoload
(defun sbt (command &optional dir)
  "Run COMMAND in DIR as compilation shell mode."
  (interactive (list (read-from-minibuffer
                      "sbt "
                      nil nil nil 'sbt-command-history)))
  (let ((default-directory (or dir
                               (funcall sbt-project-function)
                               default-directory))
        (compilation-buffer-name-function
         (lambda (ignore) "*sbt*")))
    (with-current-buffer (get-buffer-create "*sbt*")
      (compile (concat (or sbt-exec-file "sbt") " " command) t))))

(provide 'sbt)
;;; sbt.el ends here
