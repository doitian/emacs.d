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
<li><a href="#sec-3">3. Dependencies</a></li>
<li><a href="#sec-4">4. Theme</a></li>
<li><a href="#sec-5">5. My Config</a>
<ul>
<li><a href="#sec-5-1">5.1. Custom/secrets files</a></li>
<li><a href="#sec-5-2">5.2. Basic</a></li>
<li><a href="#sec-5-3">5.3. File system</a></li>
<li><a href="#sec-5-4">5.4. Clipboard</a></li>
<li><a href="#sec-5-5">5.5. Encoding</a></li>
<li><a href="#sec-5-6">5.6. Enable Commands</a></li>
<li><a href="#sec-5-7">5.7. Safe Variables</a></li>
<li><a href="#sec-5-8">5.8. Aliases</a></li>
</ul>
</li>
<li><a href="#sec-6">6. ELPA</a></li>
<li><a href="#sec-7">7. Modules</a>
<ul>
<li><a href="#sec-7-1">7.1. delete-keys-hacks</a></li>
<li><a href="#sec-7-2">7.2. char-motion</a></li>
<li><a href="#sec-7-3">7.3. ido</a></li>
<li><a href="#sec-7-4">7.4. magit</a></li>
<li><a href="#sec-7-5">7.5. org</a></li>
<li><a href="#sec-7-6">7.6. case-dwim</a></li>
<li><a href="#sec-7-7">7.7. server</a></li>
<li><a href="#sec-7-8">7.8. backup</a></li>
</ul>
</li>
</ul>
</div>
</div>
<a name="sec-1"></a>
# Usage

<a name="sec-1-1"></a>
## Generate init.el

Use `make` or eval following lisp code. Move to the end of the expression, and press <kbd>Ctrl-X Ctrl-E</kbd>.

    (progn
      (let* ((dir (concat (file-name-directory (buffer-file-name))))
             (outfile (concat dir "init.el"))
             (generated-autoload-file (concat dir "site-lisp/my-loaddefs.el")))
        (update-directory-autoloads (concat dir "site-lisp"))
        (org-babel-tangle-file (buffer-file-name) outfile)
        (byte-compile-file outfile)))

<a name="sec-1-2"></a>
## vendor

Some packages are large, and are not stable to install from ELPA. Install them using `make vendor`.

    make vendor

<a name="sec-2"></a>
# Startup

Remove annoying UI

    (menu-bar-mode -1)
    (tool-bar-mode -1)
    (scroll-bar-mode -1)
    (setq inhibit-splash-screen t)

<a name="sec-3"></a>
# Dependencies

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

<a name="sec-4"></a>
# Theme

    (setq custom-theme-directory (expand-file-name "themes" user-emacs-directory))
    (load (concat custom-theme-directory "/zenburn-theme"))
    (set-frame-font my-frame-font)
    (set-fontset-font "fontset-default" 'chinese-gbk my-frame-font-chinese)
    
    (setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))
    
    ;; prefer fringe
    (setq next-error-highlight 'fringe-arrow)
    
    (add-to-list
     'default-frame-alist
     (cons 'font my-frame-font))
    
    (defvar after-make-console-frame-hooks '()
      "Hooks to run after creating a new TTY frame")
    (defvar after-make-window-system-frame-hooks '()
      "Hooks to run after creating a new window-system frame")
    
    (defun run-after-make-frame-hooks (frame)
      "Selectively run either `after-make-console-frame-hooks' or
    `after-make-window-system-frame-hooks'"
      (select-frame frame)
      (run-hooks (if window-system
                     'after-make-window-system-frame-hooks
                   'after-make-console-frame-hooks)))
    
    (add-hook 'after-make-frame-functions 'run-after-make-frame-hooks)
    
    (custom-set-variables
     '(blink-cursor-mode t)
     '(blink-cursor-delay 2)
     '(blink-cursor-interval 0.5)
     '(indicate-empty-lines nil)
     '(indicate-buffer-boundaries 'right)
     '(inhibit-startup-echo-area-message t)
     '(inhibit-startup-screen t)
     '(show-paren-mode t)
     '(tool-bar-mode nil)
     '(visible-bell t)
     '(menu-bar-mode nil)
     '(scroll-bar-mode nil)
     '(use-file-dialog nil)
     '(use-dialog-box nil))
    
    (global-hl-line-mode)

<a name="sec-5"></a>
# My Config

<a name="sec-5-1"></a>
## Custom/secrets files

    (setq custom-file (expand-file-name "custom.el" user-emacs-directory))
    (load custom-file t)
    (load my-custom-readonly-file t)
    (load my-secrets-file t)

<a name="sec-5-2"></a>
## Basic

    (custom-set-variables
     '(default-major-mode (quote text-mode) t)
    
     '(enable-recursive-minibuffers t)
     '(minibuffer-depth-indicate-mode t)
    
     '(tab-width 2)
     '(indent-tabs-mode nil)
     '(show-paren-mode t)
     '(fill-column 78)
    
     ;; '(delete-active-region 'kill)
     ;; '(delete-selection-mode t)
    
     '(set-mark-command-repeat-pop t))

<a name="sec-5-3"></a>
## File system

    (custom-set-variables
     '(delete-by-moving-to-trash t)
     '(tramp-default-method-alist (quote (("\\`localhost\\'" "\\`root\\'" "sudo")))))

<a name="sec-5-4"></a>
## Clipboard

    (custom-set-variables
     '(mouse-yank-at-point t)
     '(x-select-enable-clipboard t))

<a name="sec-5-5"></a>
## Encoding

    (custom-set-variables
     '(current-language-environment "UTF-8")
     '(locale-coding-system 'utf-8))
    
    (set-terminal-coding-system 'utf-8)
    (set-keyboard-coding-system 'utf-8)
    (set-selection-coding-system 'utf-8)
    (prefer-coding-system 'utf-8)

<a name="sec-5-6"></a>
## Enable Commands

    (put 'narrow-to-region 'disabled nil)
    (put 'set-goal-column 'disabled nil)
    (put 'scroll-left 'disabled nil)
    (put 'scroll-right 'disabled nil)
    (put 'downcase-region 'disabled nil)
    (put 'upcase-region 'disabled nil)

<a name="sec-5-7"></a>
## Safe Variables

    (custom-set-variables
     '(safe-local-variable-values '((encoding . utf-8)
                                    (outline-minor-mode . t))))

<a name="sec-5-8"></a>
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

<a name="sec-6"></a>
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
          '(("melpa" . "http://melpa.milkbox.net/packages/")
            ("gnu" . "http://elpa.gnu.org/packages/")))

<a name="sec-7"></a>
# Modules

Disable module by adding it to `module-black-list`.

    ;; Example
    ;; (custom-set-variables
    ;;   '(module-black-list '(tex r delete-keys-hacks)))

<a name="sec-7-1"></a>
## delete-keys-hacks

Use <kbd>M-r</kbd> to delete word backward, <kbd>C-h</kbd> to delete char backword.

To get help, use <kbd>C-H</kbd> or <kbd>F1</kbd> instead.

This is an opinioned config, disable it by adding it to `module-black-list`.

    (define-module delete-keys-hacks
      "Translate C-h and M-r to delete char and word backward"
      (define-key key-translation-map [?\C-h] [?\C-?])
      (define-key key-translation-map [?\M-r] [?\C-\M-?]))

<a name="sec-7-2"></a>
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

<a name="sec-7-3"></a>
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

<a name="sec-7-4"></a>
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

<a name="sec-7-5"></a>
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

<a name="sec-7-6"></a>
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

<a name="sec-7-7"></a>
## server

Start emacs server.

    (define-module server
    
      (defcustom server-delete-frame-functions
        '(anything-c-adaptive-save-history
          bookmark-exit-hook-internal
          ac-comphist-save
          ido-kill-emacs-hook
          org-clock-save
          org-id-locations-save
          org-babel-remove-temporary-directory
          recentf-save-list
          semanticdb-kill-emacs-hook
          session-save-session
          w3m-arrived-shutdown
          w3m-cookie-shutdown
          tramp-dump-connection-properties)
      "List of functions that should be called when a OS window is closed"
      :group 'server
      :type '(repeat symbol))
    
      (defun server--last-frontend-frame-p ()
        (and (server-running-p)
             (= 2 (length (frame-list)))))
    
      (defun server--run-delete-frame-functions (frame)
        (when (server--last-frontend-frame-p)
          (run-hooks 'server-delete-frame-functions)))
    
      ;; Buggy to run the functions in MacOS X
      (unless (eq system-type 'darwin)
        (add-hook 'delete-frame-functions 'server--run-delete-frame-functions))
    
      (server-start))

<a name="sec-7-8"></a>
## backup

See commands in `site-lisp/pick-backup.el` to diff or restore a backup.

    (define-module backup
      ;; Place all backup files into this directory
      (make-directory (expand-file-name "backup" user-emacs-directory) t)
    
      (custom-set-variables
       '(auto-save-interval 300)
       '(auto-save-timeout 10)
       '(backup-directory-alist (list (cons "." (expand-file-name "backup" user-emacs-directory))))
       '(backup-by-copying t)
       '(delete-old-versions t)
       '(kept-new-versions 20)
       '(kept-old-versions 2)
       '(vc-make-backup-files t)
       '(version-control t))
    
      (defun init--force-backup ()
        "Reset backed up flag."
        (setq buffer-backed-up nil))
    
      ;; Make a backup after save whenever the file
      ;; is auto saved. Otherwise Emacs only make one backup after opening the file.
      (add-hook 'auto-save-hook 'init--force-backup))
