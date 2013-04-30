;;; module.el --- Wrap module in function

;; Copyright (C) 2011 Ian Yang

;; Author: Ian Yang <doit dot ian (at) gmail dot com>
;; Keywords: module
;; Filename: module.el
;; Description: Single file module management
;; Created: 2013-04-22 23:56:00
;; Version: 1.0
;; Last-Updated: 2013-04-23 02:59:00
;; URL: https://raw.github.com/doitian/emacs.d/master/site-lisp/module.el
;; Compatibility: GNU Emacs 24.3.1

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
;;
;; Module is defined as function, and is only loaded when:
;;
;; -   `module-white-list' is empty, or it is in `module-white-list'.
;; -   and it is not in `module-black-list'.

;; `module-white-list', and `module-black-list' also can include group names
;; defined in `module-group-alist'. If so, the group name is expanded recursively
;; to all the modules belong to it.

;; `module-white-list' and `module-black-list' also can be set through
;; environment variable EMACS_MODULE, which is a comma separated list of module
;; or group names. Name starting with ! are added to black list, and others are
;; added to white list.
;;
;; To define a module, use macro `define-module'
;;
;;     (define-module ido
;;        "Doc string for init function module-ido-init"
;;        (require 'ido)
;;        (ido-mode +1))
;;
;; By default all modules are auto loaded unless `module-auto-initialize' is
;; set to `nil'. Module can be loaded manually using `module-load'. To load a
;; module in black list or not in white list, clear the lists first using
;; `module-clear-lists'.

;;; Examples:
;;
;;     # Start emacs without loading any module.
;;     # Because white list is not empty, and there is no module with name "none"
;;     EMACS_MODULE=none emacs
;;
;;     # Do not load org related modules. ! must be quoted in SHELL
;;     EMACS_MODULE="!org" emacs
;;

(defvar module-list nil
  "List of of defined modules")

(defgroup module nil "Customize modules" :group 'emacs)

(defvar module-group-alist nil
  "A list of cons (GROUP . NAMES).

GROUP is a group name as symbol.

NAMES is a list of symbols of module or group names belong to GROUP.

A group name occur in `module-black-list', `module-white-list',
are expanded recursively to the modules belong to it.
")

(defcustom module-black-list nil
  "List of modules should not be loaded"
  :group 'module
  :type '(repeat symbol))

(defcustom module-white-list nil
  "List of modules to be loaded."
  :group 'module
  :type '(repeat symbol))

(defcustom module-auto-initialize t
  "Run `module-initialize' after init"
  :group 'module
  :type '(repeat symbol))

(defun module--expand-name (name)
  "If the name is a GROUP name in `module-group-alist', expand it recursively and returns a list of modules belong to the group.
Otherwise return the name wrap in a list."
  (let ((group (assoc name module-group-alist)))
    (if group
        (apply 'append (mapcar 'module--expand-name (cdr group)))
      (list name))))

(defun module--expand-names (names)
  (apply 'append (mapcar 'module--expand-name names)))

(defun module--allowed ()
  "List of modules allowed to load"
  (let ((black-list (module--expand-names module-black-list))
        result)
    (mapc (lambda (module)
            (unless (memq module black-list)
              (setq result (cons module result))))
          (if module-white-list
              (module--expand-names module-white-list)
            module-list))
    ;; module-list is already reversed, no need to reverse it again
    (if module-white-list (nreverse result) result)))

(defun module--loadable ()
  "List of modules allowed to load but not loaded yet"
  (let (result)
    (mapc (lambda (module)
            (let ((flag (intern (concat "module-" (symbol-name module) "-loaded"))))
              (unless (and (boundp flag) (symbol-value flag))
                (setq result (cons module result)))))
          (module--allowed))
    (nreverse result)))

(defmacro define-module (name &optional docstring &rest body)
  "Define a module with `name' and `body' is evaluated when the module
  is required using `require-module'. `reload' flag can be used in `body' to handle module reload."
  (let ((flag (intern (concat "module-" (symbol-name name) "-loaded")))
        (init (intern (concat "module-" (symbol-name name) "-init"))))
    `(progn
       (setq module-list (cons ',name module-list))
       (defvar ,flag nil
         ,(format "Whether module `module-%s-init' has been loaded" (symbol-name name)))
       (defun ,init (&optional reload)
         ,(if (stringp docstring) docstring (concat "Init module " (symbol-name name)))
         (when (or reload (not ,flag))
           ,(unless (stringp docstring) docstring)
           ,@body)
         (setq ,flag t)))))

(defmacro require-module (name &optional reload)
  "Load a module by name."
  (let ((init (intern (concat "module-" (symbol-name name) "-init"))))
    `(funcall ',init ,reload)))

(defmacro require-module-maybe (name &optional reload)
  "Load a module by name.
Skip module in black list or not in white list when it is not blank."
  (let ((init (intern (concat "module-" (symbol-name name) "-init"))))
    `(unless (memq ',name (module--expand-names module-black-list))
       (funcall ',init ,reload))))

(defvar module-load-history nil)

;;;###autoload
(defun module-load (name &optional reload)
  "Load a module by name.
With \\[universal-argument] to force reload the module.
With \\[universal-argument] \\[universal-argument] to also include not allowed module."
  (interactive (list
                (intern
                 (completing-read "Module: "
                                  (mapcar (lambda (module) (cons module module))
                                          (if current-prefix-arg
                                              (if (and (listp current-prefix-arg) (car current-prefix-arg) (= 16 (car current-prefix-arg)))
                                                  module-list
                                                (module--allowed))
                                            (module--loadable)))
                                  nil t nil
                                  'module-load-history))
                current-prefix-arg))
  (let ((init (intern (format "module-%s-init" (symbol-name name)))))
    (when (fboundp init)
      (funcall init reload))))

(unless (fboundp 'load-module)
  (defalias 'load-module 'module-load))

(defun module--parse-env ()
  "Parse white and black list from $EMACS_MODULE"
  (let (white-list black-list)
    (mapc
     (lambda (name)
       (if (string= "!" (substring name 0 1))
           (setq black-list (cons (intern (substring name 1)) black-list))
         (setq white-list (cons (intern name) white-list))))
     (split-string (or (getenv "EMACS_MODULE") "") "," t))
    (setq module-white-list (append module-white-list (nreverse white-list)))
    (setq module-black-list (append module-black-list (nreverse black-list)))))

;;;###autoload
(defun module-clear-lists ()
  (interactive)
  (setq module-black-list nil)
  (setq module-white-list nil))

;;;###autoload
(defun module-initialize (&optional reload)
  "Load all defined modules in `module-list' except ones in `module-black-list'"
  (module--parse-env)
  (mapc (lambda (module)
          (module-load module reload))
        (module--allowed)))

(defun module--maybe-initialize ()
  (when module-auto-initialize
    (module-initialize)))

(add-hook 'after-init-hook 'module--maybe-initialize)



(provide 'module)

;;; --- module.el ends here
