<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Usage</a>
<ul>
<li><a href="#sec-1-1">1.1. Generate init.el</a></li>
<li><a href="#sec-1-2">1.2. vendor</a></li>
</ul>
</li>
<li><a href="#sec-2">2. Startup</a></li>
<li><a href="#sec-3">3. My Config</a>
<ul>
<li><a href="#sec-3-1">3.1. Dependencies</a></li>
<li><a href="#sec-3-2">3.2. Custom/secrets files</a></li>
<li><a href="#sec-3-3">3.3. Basic</a></li>
<li><a href="#sec-3-4">3.4. File system</a></li>
<li><a href="#sec-3-5">3.5. Clipboard</a></li>
<li><a href="#sec-3-6">3.6. Encoding</a></li>
<li><a href="#sec-3-7">3.7. Enable Commands</a></li>
<li><a href="#sec-3-8">3.8. Safe Variables</a></li>
<li><a href="#sec-3-9">3.9. Aliases</a></li>
</ul>
</li>
<li><a href="#sec-4">4. ELPA</a></li>
<li><a href="#sec-5">5. Modules</a>
<ul>
<li><a href="#sec-5-1">5.1. delete-keys-hacks</a></li>
<li><a href="#sec-5-2">5.2. char-motion</a></li>
<li><a href="#sec-5-3">5.3. ido</a></li>
<li><a href="#sec-5-4">5.4. magit</a></li>
<li><a href="#sec-5-5">5.5. org</a></li>
<li><a href="#sec-5-6">5.6. case-dwim</a></li>
</ul>
</li>
</ul>
</div>
</div>
# Usage

## Generate init.el

Use `make` or eval following lisp code. Move to the end of the expression, and press <kbd>Ctrl-X Ctrl-E</kbd>.

    (progn
      (let* ((dir (concat (file-name-directory (buffer-file-name))))
             (outfile (concat dir "init.el"))
             (generated-autoload-file (concat dir "site-lisp/my-loaddefs.el")))
        (update-directory-autoloads (concat dir "site-lisp"))
        (org-babel-tangle-file (buffer-file-name) outfile)
        (byte-compile-file outfile)))

## vendor

Some packages are large, and are not stable to install from ELPA. Install them using `make vendor`.

    make vendor

# Startup

Remove annoying UI

    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    (setq inhibit-splash-screen t)

# My Config

## Dependencies

    (defvar my-site-lisp-dir (expand-file-name "site-lisp/" user-emacs-directory)
      ".emacs.d/site-lisp")
    (defvar my-vendor-dir (expand-file-name "vendor/" user-emacs-directory)
      ".emacs.d/vendor")
    
    (setq load-path (cons my-site-lisp-dir load-path))
    
    ;; load loaddefs if generated, otherwise load all files in site-lisp
    (let ((loaddefs (concat my-site-lisp-dir "my-loaddefs.el")))
      (if (file-exists-p loaddefs)
          (progn
            (require 'dash)
            (require 'my-mode)
            (require 'module)
            (require 'my-loaddefs))
        (mapc (lambda (file)
                (require (intern (file-name-sans-extension
                                  (file-name-nondirectory it)))))
              (file-expand-wildcards (concat my-site-lisp-dir "*.el")))))
    
    ;; Require Macros for byte compile
    (eval-when-compile
      (progn (require 'dash)
             (require 'module)))

## Custom/secrets files

    (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
    (load custom-file t)
    (load my-custom-readonly-file t)
    (load my-secrets-file t)

## Basic

    (custom-set-variables
     '(default-major-mode (quote text-mode) t)
    
     '(enable-recursive-minibuffers t)
     '(minibuffer-depth-indicate-mode t))

## File system

    (custom-set-variables
     '(delete-by-moving-to-trash t)
     '(tramp-default-method-alist (quote (("\\`localhost\\'" "\\`root\\'" "sudo")))))

## Clipboard

    (custom-set-variables
     '(mouse-yank-at-point t)
     '(x-select-enable-clipboard t))

## Encoding

    (custom-set-variables
     '(current-language-environment "UTF-8")
     '(locale-coding-system 'utf-8))
    
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8)
    (set-selection-coding-system 'utf-8)
    (prefer-coding-system 'utf-8)

## Enable Commands

    (put 'narrow-to-region 'disabled nil)
    (put 'set-goal-column 'disabled nil)
    (put 'scroll-left 'disabled nil)
    (put 'scroll-right 'disabled nil)
    (put 'downcase-region 'disabled nil)
    (put 'upcase-region 'disabled nil)

## Safe Variables

    (custom-set-variables
     '(safe-local-variable-values '((encoding . utf-8)
                                    (outline-minor-mode . t))))

## Aliases

    (fset 'yes-or-no-p 'y-or-n-p)
    (fset 'man 'woman)
    (defalias 'save-pwd 'xsteve-save-current-directory)
    (defalias 'qrr 'query-replace-regexp)
    (defalias 'rr 'replace-regexp)
    (defalias 'rb 'revert-buffer-no-confirm)
    (defalias 'occ 'occur)
    (defalias 'mocc 'multi-occur)
    (defalias 'moccr 'multi-occur-in-matching-buffers)
    (defalias 'aa 'anything-apropos)
    (defalias 'wc 'whitespace-cleanup)
    (defalias 'flb 'add-file-local-variable)
    (defalias 'fll 'add-file-local-variable-prop-line)
    (defalias 'fl 'add-file-local-variable-prop-line)
    (defalias 'dl 'add-dir-local-variable)
    (defalias 'ack 'agap)
    (defalias 'sudo 'find-alternative-file-with-sudo)
    (defalias 'af 'auto-fill-mode)

# ELPA

Load package on demand

    ;; @purcell https://github.com/purcell/emacs.d/blob/master/init-elpa.el
    (defun require-package (package &optional min-version no-refresh)
      "Install given PACKAGE, optionally requiring MIN-VERSION.
    If NO-REFRESH is non-nil, the available package lists will not be
    re-downloaded in order to locate PACKAGE."
      (if (package-installed-p package min-version)
          t
        (if (or (assoc package package-archive-contents) no-refresh)
            (package-install package)
          (progn
            (package-refresh-contents)
            (require-package package min-version t)))))
    
    (package-initialize)
    
    (setq package-archives
          '(("melpa" . "http://melpa.milkbox.net/packages/")))

# Modules

Disable module by adding it to `module-black-list`.

    ;; Example
    ;; (custom-set-variables
    ;;   '(module-black-list '(tex r delete-keys-hacks)))

## delete-keys-hacks

Use <kbd>M-r</kbd> to delete word backward, <kbd>C-h</kbd> to delete char backword.

To get help, use <kbd>C-H</kbd> or <kbd>F1</kbd> instead.

This is an opinioned config, disable it by adding it to `module-black-list`.

    (define-module delete-keys-hacks
      "Translate C-h and M-r to delete char and word backward"
      (define-key key-translation-map [?\C-h] [?\C-?])
      (define-key key-translation-map [?\M-r] [?\C-\M-?]))

## char-motion

    (define-module char-motion
      "Move by char"
    
      (custom-set-variables
       '(iy-go-to-char-key-backward ?:))
    
      ;; Save binding M-m for iy-go-to-char
      (defun back-to-indentation-or-beginning ()
        (interactive)
        (if (= (point) (save-excursion (back-to-indentation) (point)))
            (beginning-of-line)
          (back-to-indentation)))
    
      (require-package 'iy-go-to-char)
    
      (defun zap-back-to-char (arg char)
        (interactive "p\ncZap back to char: ")
        (zap-to-char (- arg) char))
    
      (defun zap-back-up-to-char (arg char)
        (interactive "p\ncZap back up to char: ")
        (zap-up-to-char (- arg) char))
    
      (global-set-key "\C-z" 'iy-go-to-char)
      (global-set-key (kbd "M-m") 'iy-go-to-char)
      (global-set-key (kbd "M-M") 'iy-go-to-char-backward)
      (global-set-key "\C-Z" 'iy-go-to-char-backward)
    
      (global-set-key (kbd "M-Z") 'zap-back-up-to-char)
    
      (define-key my-keymap "d" 'zap-up-to-char)
      (define-key my-keymap "D" 'zap-back-up-to-char)
    
      (global-set-key "\C-a" 'back-to-indentation-or-beginning))

## ido

    (define-module ido
      "Enable ido globally, and use it everywhere"
    
      (custom-set-variables
       '(ido-enable-regexp nil)
       '(ido-enable-flex-matching t)
       '(ido-everywhere t)
       '(ido-read-file-name-as-directory-commands nil)
       '(ido-use-filename-at-point nil))
    
      (require-package 'ido-hacks)
      (require-package 'ido-complete-space-or-hyphen)
    
      (ido-mode +1)
      (ido-load-history)
    
      (ido-complete-space-or-hyphen-enable)
      (require 'ido-hacks)
      (ido-hacks-mode +1)
    
      (defun init--ido-setup ()
        (define-key ido-completion-map (kbd "M-m") 'ido-merge-work-directories)
        (define-key ido-completion-map "\C-c" 'ido-toggle-case))
    
      (add-hook 'ido-setup-hook 'init--ido-setup))

## magit

    (define-module magit
      "Git GUI for Emacs"
    
      (custom-set-variables
       '(magit-process-popup-time 60)
       '(magit-repo-dirs (list my-codebase-dir))
       '(magit-repo-dirs-depth 1))
    
      (require-package 'magit)
    
      (defun magit-toggle-whitespace ()
        (interactive)
        (if (member "-w" magit-diff-options)
            (magit-observe-whitespace)
          (magit-ignore-whitespace)))
    
      (defun magit-ignore-whitespace ()
        (interactive)
        (add-to-list 'magit-diff-options "-w")
        (magit-refresh))
    
      (defun magit-observe-whitespace ()
        (interactive)
        (setq magit-diff-options (remove "-w" magit-diff-options))
        (magit-refresh))
    
      (defun init--magit-mode ()
        (define-key magit-mode-map (kbd "W") 'magit-toggle-whitespace))
    
      (defun init--magit-log-edit-mode ()
        (flyspell-mode 1)
        (auto-fill-mode t)
        (setq fill-column 72))
    
      (add-hook 'magit-mode-hook 'init--magit-mode)
      (add-hook 'magit-log-edit-mode-hook 'init--magit-log-edit-mode)
    
      (global-set-key [f12] 'magit-status))

## org

Install latest org by running `make org`. Othewise system bundled version is used.

    (define-module org
      "Basic orgmode setup"
    
      (custom-set-variables
       '(org-export-backends '(md html icalendar latex beamer)))
    
      (let ((org-load-path
             (car (nreverse (file-expand-wildcards (concat my-vendor-dir "org-*"))))))
        (when org-load-path
          ;; remove system org
          (setq load-path
                (--remove (string= "org" (file-name-nondirectory it)) load-path))
          (setq load-path (cons (concat org-load-path "/lisp") load-path))
          (or (require 'org-loaddefs nil t) (require 'org nil t)))))

## case-dwim

Ease inserting dash `-` and undersocre `_`.

To downcase, upcase, capitalize words backword, start with nagative
prefix, and then repeat. For example, upcase 3 words before point:
<kbd>M&#x2013; M-u M-u M-u</kbd>

If the last command is case transformation (if region is action or
using <kbd>M-U</kbd>, <kbd>M-L</kbd>, <kbd>M-C</kbd>), dash or
underscore will not be inserted, and these commands will do case
transformations.

These commands are also `multiple-cursors` compatible.

    (define-module case-dwim
      (global-set-key (kbd "M-l") 'case-dwim-dash)
      (global-set-key (kbd "M-u") 'case-dwim-underscore)
      (global-set-key (kbd "M-L") 'case-dwim-downcase)
      (global-set-key (kbd "M-U") 'case-dwim-upcase)
      (global-set-key (kbd "M-c") 'case-dwim-capitalize)
      (global-set-key (kbd "M-C") 'case-dwim-capitalize)
    
      (define-key isearch-mode-map (kbd "M-l") 'case-dwim-isearch-dash)
      (define-key isearch-mode-map (kbd "M-u") 'case-dwim-isearch-underscore))
