;;; helm-projectile-files-candidates-in-buffer.el --- Put project files candidates in buffer.

;; Copyright © 2013-2013 Ian Yang <me@iany.me>

;; Author: Ian Yang <me@iany.me>
;; Keywords: project, convenience
;; Package-Requires: ((helm "1.4.0") (projectile "0.10.0"))

;; This file is NOT part of GNU Emacs.

;;; License:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;;
;; The faster way to search against a huge list in helm is using
;; `candidates-in-buffer'.  This library synchronized project files list in a
;; buffer which is used in `helm-source-project-files-candidates-in-buffer'.
;;
;;; Code:

;; (require 'projectile)
;; (require 'helm-config)
;; (require 'helm-locate)
;; (require 'helm-buffers)
;; (require 'helm-files)

(defvar helm-projectile-files-candidates-in-buffer-project-root)

(defalias 'helm-projectile-files-candidates-in-buffer-project-root-safe 'projectile-project-p)

(defun helm-projectile-files-candidates-in-buffer-candidates-transformer (candidates source)
  "Convert each of the CANDIDATES in SOURCE to cons of (disp . real)."
  (mapcar (lambda (i)
            (cons (propertize i 'face 'helm-ff-file)
                  (expand-file-name i helm-projectile-files-candidates-in-buffer-project-root)))
          candidates))

(defun helm-projectile-files-candidates-in-buffer-cache-buffer (root)
  "Get files list buffer for project ROOT."
  (get-buffer (format "*projectile cache[ %s ]*" root)))

(defun helm-projectile-files-candidates-in-buffer-cache-buffer-create (root)
  "Create files list buffer for project ROOT."
  (get-buffer-create (format "*projectile cache[ %s ]*" root)))

(defvar helm-projectile-files-candidates-in-buffer-disable-sync nil)
(defun helm-projectile-files-candidates-in-buffer-sync-files (root)
  "Create files list buffer for project ROOT."
  (let ((buffer (helm-projectile-files-candidates-in-buffer-cache-buffer-create root)))
   (with-current-buffer buffer
     (erase-buffer)
     (insert
      (mapconcat 'identity (let ((helm-projectile-files-candidates-in-buffer-disable-sync t))
                             (projectile-current-project-files)) "\n")))
   buffer))

(defadvice projectile-serialize-cache (after helm-projectile-files-candidates-in-buffer-sync-buffer activate)
  "If cache is enabled, sync the file list buffer whenever the cache is updated."
  (let ((root (helm-projectile-files-candidates-in-buffer-project-root-safe)))
    (when (and root projectile-enable-caching (not helm-projectile-files-candidates-in-buffer-disable-sync))
      (helm-projectile-files-candidates-in-buffer-sync-files root))))

(defvar helm-source-projectile-files-candidates-in-buffer-files-list
  `((name . "Projectile Files")
    (init . (lambda ()
              (setq helm-projectile-files-candidates-in-buffer-project-root
                    (with-helm-current-buffer (helm-projectile-files-candidates-in-buffer-project-root-safe)))
              (helm-candidate-buffer
               (or
                (and
                 helm-projectile-files-candidates-in-buffer-project-root
                 (or (and
                      (not projectile-enable-caching)  ; must sync files when cache is disabled
                      (helm-projectile-files-candidates-in-buffer-cache-buffer
                       helm-projectile-files-candidates-in-buffer-project-root))
                     (helm-projectile-files-candidates-in-buffer-sync-files
                      helm-projectile-files-candidates-in-buffer-project-root)))
                'local))))
    (candidates-in-buffer)
    (filtered-candidate-transformer . helm-projectile-files-candidates-in-buffer-candidates-transformer)
    (action . ,(cdr (helm-get-actions-from-type helm-source-locate)))))

(provide 'helm-projectile-files-candidates-in-buffer)

;;; helm-projectile-files-candidates-in-buffer.el ends here
