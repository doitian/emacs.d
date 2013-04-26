;;; alternative-files.el --- Go to alternative file

;; Copyright (C) 2011 Ian Yang

;; Author: Ian Yang <doit dot ian (at) gmail dot com>
;; Keywords: navigation
;; Filename: alternative-files.el
;; Description: Go to alternative file
;; Created: 2011-06-11 22:39:00
;; Version: 1.0
;; Last-Updated: 2011-06-11 22:39:00
;; URL: http://www.emacswiki.org/emacs/download/alternative-files.el
;; Compatibility: GNU Emacs 23.1.1

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

;; See README.md

;;; Code:

;; Customization
(defgroup alternative-files nil "Find alternative files"
  :group 'files)

(defconst alternative-files-functions
  '(alternative-files-rails-finder
    alternative-files-rspec-finder
    alternative-files-objc-finder
    alternative-files-user-rules-finder)
  "Functions used to find alternative-files.")

(defcustom alternative-files-user-functions nil
  "User defined extra functions used to find alternative-files."
  :type 'hook
  :group 'alternative-files)

(defcustom alternative-files-completing-read
  'ido-completing-read
  "Function used to read string with completion."
  :type 'function
  :options '(ido-completing-read completing-read)
  :group 'alternative-files)

(defcustom alternative-files-root-dir-function
  'eproject-root
  "Function used to get root directory."
  :type 'function
  :group 'alternative-files)
(make-variable-buffer-local 'alternative-files-root-dir-function)
(put 'alternative-files-root-dir-function 'permanent-local t)

;;; Helper Functions:

(defun alternative-files--singularize-string (str)
  "Singularize STR.

Use `singularize-string' in `inflections.el' or just remove trailing s."
  (if (fboundp 'singularize-string)
      (singularize-string str)
    (substring str 0 (1- (length str)))))

(defun alternative-files--pluralize-string (str)
  "Pluralize STR.

Use `pluralize-string' in `inflections.el' or just append trailing s."
  (if (fboundp 'pluralize-string)
      (pluralize-string str)
    (concat str "s")))

(defun alternative-files--detect-file-name ()
  "Detect real file name."
  (cond ((and (boundp 'org-src-mode) org-src-mode
              (boundp 'org-edit-src-beg-marker) org-edit-src-beg-marker)
         (buffer-file-name (marker-buffer org-edit-src-beg-marker)))
        ((memq major-mode '(magit-mode term-mode)) (expand-file-name default-directory))
        (t (or (buffer-file-name) (and (eq major-mode 'dired-mode)
                                       (expand-file-name (if (consp dired-directory)
                                                             (car dired-directory)
                                                           dired-directory)))))))

(defun alternative-files--relative-name (filename &optional dir)
  "Get relative file name of FILENAME in DIR."
  (let ((dir (or dir default-directory))
        (n (length dir)))
    (if (string-equal dir (substring filename 0 n))
        (substring filename n)
      filename)))

;;; Code

(defun alternative-files-rails-finder (&optional file)
  "Find alternative files for FILE in Rails."
  (let ((file (or file (alternative-files--detect-file-name))))
    (cond
     ((string-match "^\\(.*\\)/app/\\(models\\|controllers\\|helpers\\)/\\(.+/\\)*\\([^/]+\\)\\.rb$" file)
      (let ((root (match-string 1 file))
            (type (match-string 2 file))
            (dir (match-string 3 file))
            (name (match-string 4 file)))
        (cond
         ((string-equal type "models")
          (let ((plural-name (alternative-files--pluralize-string name)))
            (list
             (concat root "/app/controllers/" dir plural-name "_controller.rb")
             (concat root "/app/controllers/" dir name "_controller.rb")
             (concat root "/app/helpers/" dir plural-name "_helper.rb")
             (concat root "/app/helpers/" dir name "_helper.rb")
             (concat root "/app/views/" dir plural-name "/")
             (concat root "/app/views/" dir name "/"))))

         ((string-equal type "controllers")
          (when (string-match "^\\(.*\\)_controller$" name)
            (setq name (match-string 1 name))
            (list
             (concat root "/app/models/" dir (alternative-files--singularize-string name) ".rb")
             (concat root "/app/models/" dir name ".rb")
             (concat root "/app/helpers/" dir name "_helper.rb")
             (concat root "/app/views/" dir name "/"))))

         ((string-equal type "helpers")
          (when (string-match "^\\(.*\\)_helper$" name)
            (setq name (match-string 1 name))
            (list
             (concat root "/app/models/" dir (alternative-files--singularize-string name) ".rb")
             (concat root "/app/models/" dir name ".rb")
             (concat root "/app/controllers/" dir name "_controller.rb")
             (concat root "/app/views/" dir name "/")))))))

     ((string-match "^\\(.*\\)/app/views/\\(.+\\)*\\([^/]+\\)/[^/]+$" file)
      (let ((root (match-string 1 file))
            (dir (match-string 2 file))
            (name (match-string 3 file)))
        (list
         (concat root "/app/models/" dir (alternative-files--singularize-string name) ".rb")
         (concat root "/app/models/" dir name ".rb")
         (concat root "/app/controllers/" dir name "_controller.rb")
         (concat root "/app/helpers/" dir name "_helper.rb"))))
     )))

(defun alternative-files-rspec-finder (&optional file)
  "Toggle between rspec and source code for FILE."
  (let ((file (or file (alternative-files--detect-file-name))))
    (cond
     ((string-match "^\\(.*\\)/app/\\(.+\\)\\.rb$" file)
      (let ((root (match-string 1 file))
            (name (match-string 2 file)))
        (list
         (concat root "/spec/" name "_spec.rb"))))

     ((string-match "^\\(.*\\)/spec/lib/\\(.+\\)_spec.rb$" file)
      (let ((root (match-string 1 file))
            (name (match-string 2 file)))
        (list
         (concat root "/lib/" name ".rb"))))

     ((string-match "^\\(.*\\)/spec/\\(models\\|controllers\\|helpers\\)/\\(.+\\)_spec.rb$" file)
      (let ((root (match-string 1 file))
            (type (match-string 2 file))
            (name (match-string 3 file)))
        (list
         (concat root "/app/" type "/" name ".rb"))))

     ((string-match "^\\(.*\\)/spec/\\(.+\\)_spec.rb$" file)
      (let ((root (match-string 1 file))
            (name (match-string 2 file)))
        (list
         (concat root "/lib/" name ".rb")
         (concat root "/app/" name ".rb"))))

     ((string-match "^\\(.*\\)/lib/\\(.+\\)\\.rb$" file)
      (let ((root (match-string 1 file))
            (name (match-string 2 file)))
        (list
         (concat root "/spec/lib/" name "_spec.rb")
         (concat root "/spec/" name "_spec.rb"))))

     )))

(defun alternative-files-objc-finder (&optional file)
  "Find alternative files in Object-C project for FILE."
  (let* ((file (or file (alternative-files--detect-file-name))))
    (cond
     ((string-match "^\\(.*?/\\)\\([^/]+/\\)?\\([^/]+\\)Test\\.m$" file)
      (let ((root (match-string 1 file))
            (dir (match-string 2 file))
            (name (match-string 3 file)))
        (list
         (concat root "Classes/" name ".m")
         (concat root "Classes/" name ".h")
         (concat root "Sources/" name ".m")
         (concat root "Sources/" name ".h")
         (concat root dir name ".m")
         (concat root dir name ".h"))))
     ((string-match "^\\(.*?/\\)\\([^/]+/\\)?\\([^/]+\\)\\.m$" file)
      (let ((root (match-string 1 file))
            (dir (match-string 2 file))
            (name (match-string 3 file)))
        (list
         (concat root dir name ".h")
         (concat root dir name "Test.m")
         (concat root "Test/" name "Test.m"))))
     ((string-match "^\\(.*?/\\)\\([^/]+/\\)?\\([^/]+\\)\\.h$" file)
      (let ((root (match-string 1 file))
            (dir (match-string 2 file))
            (name (match-string 3 file)))
        (list
         (concat root dir name ".m")
         (concat root dir name "Test.m")
         (concat root "Test/" name "Test.m")))))))

;;;###autoload
(defvar alternative-files-rules nil)
;;;###autoload
(make-variable-buffer-local 'alternative-files-rules)
;;;###autoload
(put 'alternative-files-rules 'safe-local-variable 'listp)

(defun alternative-files--apply-rule (file regexp &rest replacements)
  "Apply rule to FILE using REGEXP, return file names using each replacement string in REPLACEMENTS."
  (when (string-match-p regexp file)
    (mapcar (lambda (rep) (replace-regexp-in-string (concat "\\(?:" regexp "\\).*$") rep file)) replacements)))

(defun alternative-files-user-rules-finder (&optional file)
  "Find alternative files of FILE using user defined rules."
  (let ((file (or file (alternative-files--detect-file-name)))
        (rules (or alternative-files-rules
                   (and (fboundp 'eproject-attribute)
                        (eproject-attribute :alternative-files-rules)))))
    (apply
     'append
     (mapcar (lambda (rule) (apply 'alternative-files--apply-rule file rule)) rules))))

(defvar alternative-files nil
  "Cache for alternative files.")
(defvar alternative-files-cached nil
  "Cache for alternative files execution flag.")
(make-variable-buffer-local 'alternative-files)
(put 'alternative-files 'safe-local-variable 'listp)
(put 'alternative-files 'permanent-local t)
(make-variable-buffer-local 'alternative-files-cached)
(put 'alternative-files-cached 'permanent-local t)

(defun alternative-files (&optional force)
  "Find alternative files.
If FORCE is t, do not use the cache."
  (interactive "P")
  (when (or force (not alternative-files-cached))
    (setq alternative-files-cached t)
    (setq alternative-files (delete-dups
                             (apply
                              'append
                              (mapcar (lambda (f) (ignore-errors (funcall f)))
                                      (append alternative-files-functions
                                              alternative-files-user-functions))))))
  alternative-files)

;;;###autoload
(defun alternative-files-existing (&optional force)
  "List of existing alternative files"
  (apply
   'append
   (mapcar
    (lambda (f)
      (when (file-exists-p f)
        (if (file-directory-p f)
            (file-expand-wildcards (concat f "*") t)
          (list f))))
    (alternative-files force))))

;;;###autoload
(defun alternative-files-missing (&optional force)
  "List of missing alternative files."
  (delq nil (mapc (lambda (f) (when (file-exists-p f) f)) (alternative-files force))))

;;;###autoload
(defun alternative-files-find-file (&optional p)
  "Find alternative files.

With a \\[universal-argument] prefix argument P to open in other window, \\[universal-argument] \\[universal-argument] to reload alternative file list"
  (interactive "p")
  (let* ((root (ignore-errors (funcall alternative-files-root-dir-function)))
         (files (alternative-files-existing (= p 16)))
         (file-names (if root
                         (mapcar (lambda (f) (alternative-files--relative-name f root)) files)
                       files))
         (choice (if (> (length file-names) 1)
                     (ido-completing-read "Alternative: " file-names)
                   (car file-names))))
    (if choice
        (let ((default-directory (or root default-directory)))
          (if (= p 4)
              (find-file-other-window choice)
            (find-file choice)))
      (message "no alternative files"))))


;;;###autoload
(defun alternative-files-create-file (&optional p)
  "Create non-existed alternative files.

With a \\[universal-argument] prefix argument P to open in other window, \\[universal-argument] \\[universal-argument] to reload alternative file list."
  (interactive "p")
  (let* ((root (ignore-errors (funcall alternative-files-root-dir-function)))
         (files (alternative-files-missing (= p 16)))
         (file-names (if root
                         (mapcar (lambda (f) (alternative-files--relative-name f root)) files)
                       files))
         (choice (and file-names (ido-completing-read "Create: " file-names))))
    (if choice
        (let ((default-directory (or root default-directory)))
          (if (equal (file-name-directory choice) choice)
              (make-directory choice t)
            (make-directory (file-name-directory choice) t))
          (if (= p 4)
              (find-file choice)
            (find-file-other-window choice)))
      (message "no alternative files to create"))))

(provide 'alternative-files)

;;; alternative-files.el ends here
