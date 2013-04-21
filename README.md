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
<li><a href="#sec-7-1">7.1. s</a></li>
<li><a href="#sec-7-2">7.2. delete-keys-hacks</a></li>
<li><a href="#sec-7-3">7.3. my-basic-keybindings</a></li>
<li><a href="#sec-7-4">7.4. char-motion</a></li>
<li><a href="#sec-7-5">7.5. ido</a></li>
<li><a href="#sec-7-6">7.6. magit</a></li>
<li><a href="#sec-7-7">7.7. org</a></li>
<li><a href="#sec-7-8">7.8. case-dwim</a></li>
<li><a href="#sec-7-9">7.9. server</a></li>
<li><a href="#sec-7-10">7.10. backup</a></li>
<li><a href="#sec-7-11">7.11. multiple-cursors</a></li>
<li><a href="#sec-7-12">7.12. dired</a></li>
<li><a href="#sec-7-13">7.13. buffer-explore</a></li>
<li><a href="#sec-7-14">7.14. window-nav</a></li>
<li><a href="#sec-7-15">7.15. window-manager</a></li>
<li><a href="#sec-7-16">7.16. vc</a></li>
<li><a href="#sec-7-17">7.17. isearch</a></li>
<li><a href="#sec-7-18">7.18. revert</a></li>
<li><a href="#sec-7-19">7.19. eshell</a></li>
<li><a href="#sec-7-20">7.20. eproject</a></li>
<li><a href="#sec-7-21">7.21. helm</a></li>
<li><a href="#sec-7-22">7.22. octave-mode</a></li>
<li><a href="#sec-7-23">7.23. compile-and-run</a></li>
<li><a href="#sec-7-24">7.24. editing</a></li>
<li><a href="#sec-7-25">7.25. kill-ring</a></li>
<li><a href="#sec-7-26">7.26. recentf</a></li>
<li><a href="#sec-7-27">7.27. desktop</a></li>
<li><a href="#sec-7-28">7.28. mark</a></li>
<li><a href="#sec-7-29">7.29. whitespace</a></li>
</ul>
</li>
<li><a href="#sec-8">8. Backlog</a></li>
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
      (progn (require 'cl)
             (require 'dash)
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
## s

    (define-module s
      (require-package 's)
      (require 's nil t))

<a name="sec-7-2"></a>
## delete-keys-hacks

Use <kbd>M-r</kbd> to delete word backward, <kbd>C-h</kbd> to delete char backword.

To get help, use <kbd>C-H</kbd> or <kbd>F1</kbd> instead.

This is an opinioned config, disable it by adding it to `module-black-list`.

    (define-module delete-keys-hacks
      "Translate C-h and M-r to delete char and word backward"
      (define-key key-translation-map [?\C-h] [?\C-?])
      (define-key key-translation-map [?\M-r] [?\C-\M-?]))

<a name="sec-7-3"></a>
## my-basic-keybindings

-   Use <kbd>C-,</kbd> as rectangle commands prefix (<kbd>C-x r)

-   Use <kbd>C-'</kbd> and <kbd>M-'</kbd> as negative argument.

    (define-module my-basic-keybindings
      (define-key my-minor-mode-map (kbd "C-,") ctl-x-r-map)
      (define-key my-minor-mode-map (kbd "C-'") 'negative-argument)
      (define-key my-minor-mode-map (kbd "M-'") 'negative-argument))

<a name="sec-7-4"></a>
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
      (autoload 'zap-up-to-char "misc" "kill up to but not including char" t)
    
      (defun zap-back-to-char (arg char)
        (interactive "p\ncZap back to char: ")
        (zap-to-char (- arg) char))
    
      (defun zap-back-up-to-char (arg char)
        (interactive "p\ncZap back up to char: ")
        (zap-up-to-char (- arg) char))
    
      (global-set-key "\C-z" 'iy-go-to-char)
      (global-set-key (kbd "M-m") 'iy-go-to-char)
      (global-set-key (kbd "M-S-m") 'iy-go-to-char-backward)
      (global-set-key (kbd "C-S-z") 'iy-go-to-char-backward)
    
      (global-set-key (kbd "M-S-z") 'zap-back-up-to-char)
    
      (define-key my-keymap "d" 'zap-up-to-char)
      (define-key my-keymap "D" 'zap-back-up-to-char)
      (define-key my-keymap (kbd ";") 'iy-go-to-char-continue)
      (define-key my-keymap (kbd ":") 'iy-go-to-char-continue-backward)
    
      (global-set-key "\C-a" 'back-to-indentation-or-beginning))

<a name="sec-7-5"></a>
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

<a name="sec-7-6"></a>
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
        (define-key magit-mode-map (kbd "W") 'magit-toggle-whitespace)
        (local-set-key [f12] 'magit-quit-window))
    
      (defun init--magit-log-edit-mode ()
        (flyspell-mode 1)
        (auto-fill-mode t)
        (setq fill-column 72))
    
      (add-hook 'magit-mode-hook 'init--magit-mode)
      (add-hook 'magit-log-edit-mode-hook 'init--magit-log-edit-mode)
    
      (global-set-key [f12] 'magit-status))

<a name="sec-7-7"></a>
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

<a name="sec-7-8"></a>
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

<a name="sec-7-9"></a>
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
    
      (defun init--server-visit ()
        (local-set-key (kbd "C-c C-c") 'server-edit))
    
      (add-hook 'server-visit-hook 'init--server-visit)
    
      (server-start))

<a name="sec-7-10"></a>
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

<a name="sec-7-11"></a>
## multiple-cursors

    (define-module multiple-cursors
      (require-package 'multiple-cursors)
    
      (define-key ctl-x-r-map (kbd "C-r") 'mc/edit-lines)
      (define-key ctl-x-r-map (kbd ",") 'mc/edit-lines)
      (define-key ctl-x-r-map (kbd "C-,") 'mc/edit-lines)
      (define-key ctl-x-r-map (kbd "a") 'mc/mark-all-like-this)
      (define-key ctl-x-r-map (kbd "C-n") 'mc/mark-next-like-this)
      (define-key ctl-x-r-map (kbd "M-f") 'mc/mark-next-word-like-this)
      (define-key ctl-x-r-map (kbd "M-F") 'mc/mark-next-symbol-like-this)
      (define-key ctl-x-r-map (kbd "C-p") 'mc/mark-previous-like-this)
      (define-key ctl-x-r-map (kbd "M-b") 'mc/mark-previous-word-like-this)
      (define-key ctl-x-r-map (kbd "M-B") 'mc/mark-previous-symbol-like-this)
      (define-key ctl-x-r-map (kbd "C-a") 'mc/edit-beginnings-of-lines)
      (define-key ctl-x-r-map (kbd "C-e") 'mc/edit-ends-of-lines)
      (define-key ctl-x-r-map (kbd "C-SPC") 'mc/mark-all-in-region)
      (define-key ctl-x-r-map (kbd "C-f") 'mc/mark-sgml-tag-pair)
    
      (global-unset-key (kbd "C-<down-mouse-1>"))
      (global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)
    
      (global-set-key (kbd "C-3") 'mc/mark-all-like-this)
      (define-key ctl-x-r-map [return] 'set-rectangular-region-anchor))

<a name="sec-7-12"></a>
## dired

    (define-module dired
      (custom-set-variables
       '(dired-omit-verbose nil)
       '(dired-dwim-target t)
       '(dired-recursive-copies (quote top))
       '(dired-recursive-deletes (quote top))
    
       '(dired-omit-files (rx (or (seq bol "#")
                                  (seq bol ".")
                                  (seq "~" eol)
                                  (seq bol "svn" eol)
                                  (seq bol "_region_")
                                  (seq bol "prv" (* anything) ".log" eol)
                                  (seq bol "cscope.files" eol)
                                  (seq bol "GPATH" eol)
                                  (seq bol "GRTAGS" eol)
                                  (seq bol "GSYMS" eol)
                                  (seq bol "GTAGS" eol)
                                  ))))
    
      (defvar dired-user-omit-extensions nil)
      (setq dired-user-omit-extensions
            '(".auxbbl.make" ".auxdvi.make" ".aux.make" ".fls" ".ilg" ".ind" ".out" ".out.make" ".prv"
              ".temp" ".toc.make" ".gpi.log" ".ps.log" ".pdf.log" ".bak" ".mp.log" ".mp.make" ".mpx"
              ".sdb" ".nav" ".snm" ".fdb_latexmk"))
    
      (setq dired-guess-shell-alist-user
            '(("\\.pdf\\'" "zathura" "evince")
              ))
    
      (require-package 'dired+)
      (require-package 'dired-details)
      (require-package 'dired-details+)
    
      (autoload 'wdired-change-to-wdired-mode "wdired")
    
      (defun dired-open ()
        (interactive)
        (dired-do-shell-command
         "open" nil
         (dired-get-marked-files t current-prefix-arg)))
    
      (defun init--dired-load ()
        (require 'dired-x)
        (require 'dired-details)
        (require 'dired-details+)
        (require 'dired+)
    
        (dired-details-install)
    
        (setq dired-omit-extensions
              (append dired-user-omit-extensions    
                      dired-omit-extensions))
    
        (define-key dired-mode-map "E" 'wdired-change-to-wdired-mode)
        (define-key dired-mode-map (kbd "`") 'dired-clean-directory)
        (define-key dired-mode-map (kbd ".") 'dired-omit-mode)
        (define-key dired-mode-map "(" 'dired-details-toggle)
        (define-key dired-mode-map ")" 'dired-details-toggle)
        (define-key dired-mode-map (kbd "/") 'diredp-omit-marked)
        (define-key dired-mode-map (kbd "M-<return>") 'dired-open))
    
      (defun init--dired-mode ()
        (dired-omit-mode +1))
    
      (global-set-key (kbd "C-x C-j") 'dired-jump)
      (add-hook 'dired-load-hook 'init--dired-load)
      (add-hook 'dired-mode-hook 'init--dired-mode)
    )

<a name="sec-7-13"></a>
## buffer-explore

<a name="sec-7-14"></a>
## window-nav

    (define-module window-nav
      (define-key my-minor-mode-map (kbd "M-o") 'other-window)
      (define-key my-minor-mode-map (kbd "M-O") 'other-frame)
      )

<a name="sec-7-15"></a>
## window-manager

<a name="sec-7-16"></a>
## vc

Version Control backends.

`git-emacs` can be install using `make vendor` or `make git-emacs`. See list
of commands using <kbd>C-x g C-h</kbd>. My favrite one is <kbd>C-x g i</kbd>,
add changes interactively using `ediff`.

    (define-module vc
      (custom-set-variables
       '(git-state-modeline-decoration (quote git-state-decoration-large-dot))
       '(vc-follow-symlinks t))
    
      (setq revert-without-query
            (append 
             '("COMMIT_EDITMSG\\'" "git-rebase-todo")
             revert-without-query))
    
      (let ((git-emacs-dir (concat my-vendor-dir "git-emacs")))
        (when (file-exists-p (concat git-emacs-dir "/git-emacs.el"))
          (setq load-path (cons git-emacs-dir load-path))
          (require 'git-emacs)))
    
      (add-to-list 'auto-mode-alist '("\\.gitconfig\\'" . conf-mode))
      (add-to-list 'auto-mode-alist '("\\.git/config\\'" . conf-mode))
    
      (defadvice vc-mode-line (after colorize-vc-mode-line activate)
        (when vc-mode
          (put-text-property 1 (length vc-mode) 'face 'font-lock-string-face vc-mode))))

<a name="sec-7-17"></a>
## isearch

    (define-module isearch
      ;; Activate occur easily inside isearch
      (define-key isearch-mode-map (kbd "C-o") 'isearch-occur)
    
      ;; http://www.emacswiki.org/emacs/ZapToISearch
      (defun isearch-exit-other-end (rbeg rend)
        "Exit isearch, but at the other end of the search string.
    This is useful when followed by an immediate kill."
        (interactive "r")
        (isearch-exit)
        (goto-char isearch-other-end))
    
      (define-key isearch-mode-map [(control return)] 'isearch-exit-other-end)
    
      (defvar isearch-initial-string nil)
    
      (defun isearch-set-initial-string ()
        (remove-hook 'isearch-mode-hook 'isearch-set-initial-string)
        (setq isearch-string isearch-initial-string)
        (isearch-search-and-update))
    
      (defun isearch-forward-at-point (&optional regexp-p no-recursive-edit)
        "Interactive search forward for the symbol at point."
        (interactive "P\np")
        (if regexp-p (isearch-forward regexp-p no-recursive-edit)
          (let* ((end (progn (skip-syntax-forward "w_") (point)))
                 (begin (progn (skip-syntax-backward "w_") (point))))
            (if (eq begin end)
                (isearch-forward regexp-p no-recursive-edit)
              (setq isearch-initial-string (buffer-substring begin end))
              (add-hook 'isearch-mode-hook 'isearch-set-initial-string)
              (isearch-forward regexp-p no-recursive-edit)))))
    
      (define-key my-keymap "*" 'isearch-forward-at-point)
      (define-key my-keymap "8" 'isearch-forward-at-point))

<a name="sec-7-18"></a>
## revert

Auto revert, and helper functions to revert without confirmation.

    (define-module revert
      (defun revert-buffer-no-confirm ()
        "Revert buffer without confirmation."
        (interactive) (flet ((yes-or-no-p (prompt) t)) (revert-buffer)))
    
      ;; Auto refresh buffers
      ; (global-auto-revert-mode -1)
    
      ;; Also auto refresh dired, but be quiet about it
      ; (setq global-auto-revert-non-file-buffers t)
      (setq auto-revert-verbose nil))

<a name="sec-7-19"></a>
## eshell

    (define-module eshell
      (defun eshell-named (&optional name)
        "Get or create eshell buffer with specified name"
        (let ((eshell-buffer-name (or name eshell-buffer-name)))
          (save-window-excursion (eshell))))
    
      (defun eshell-toggle (&optional name)
        "Toggle eshell buffer with the name.
    hide -> show -> full screen -> hide
    inactive -> switch -> full screen -> hide
    "
        (interactive)
        (let* ((eshell-buffer (eshell-named name)))
          (if (eq (current-buffer) eshell-buffer)
              (if (eq (length (window-list)) 1)
                  ;; full screen
                  (switch-to-buffer (other-buffer))
                ;; active, go to full screen
                (delete-other-windows))
            ;; activate the eshell buffer
            (switch-to-buffer-other-window eshell-buffer))))
    
      (defun eshell-here (&optional name)
        "Get or create eshell in current directory."
        (interactive)
        (let ((dir default-directory)
              (eshell-buffer (eshell-named name)))
          (unless (eq (current-buffer) eshell-buffer)
            (switch-to-buffer-other-window eshell-buffer)
            (goto-char (point-max))
            (insert (format "cd '%s'" dir))
            (eshell-send-input))))
    
      (define-key my-keymap (kbd "e") 'eshell-toggle)
      (define-key my-keymap (kbd "E") 'eshell-here))

<a name="sec-7-20"></a>
## eproject

    (define-module eproject
      (require-module eshell)
      (require-package 'eproject)
      (require 'eproject-plus)
      (define-key my-keymap "p" eproject-plus-keymap))

<a name="sec-7-21"></a>
## helm

    (define-module helm
      (require-module eproject)
      (require-package 'helm)
    
      (defvar helm-source-eproject-projects nil)
      (defvar helm-source-eproject-files-in-project nil)
    
      (setq helm-source-eproject-projects
            '((name . "Projects")
              (candidates . (lambda ()
                              (mapcar 'cdr (eproject-projects))))
              (real-to-display . (lambda (e)
                                   (file-name-nondirectory (directory-file-name e))))
              (type . file)))
    
      (setq helm-source-eproject-files-in-project
            '((name . "Project Files")
              ;; (delayed)
              (candidate-number-limit . 9999)
              (requires-pattern . 3)
              (real-to-display . (lambda (e)
                                   (with-helm-current-buffer
                                     (file-relative-name e (eproject-root-safe)))))
              (candidates . (lambda ()
                              (with-helm-current-buffer
                                (eproject-plus-list-project-files-with-cache (eproject-root-safe)))))
              (type . file)))
    
      (defun helm-eproject-projects ()
        (interactive)
        (helm-other-buffer 'helm-source-eproject-projects "*helm projects*"))
    
      (defun helm-eproject-files-in-project ()
        (interactive)
        (helm-other-buffer 'helm-source-eproject-files-in-project "*helm files in project*"))
    
      (defun helm-insert-buffer-base-name ()
        "Insert buffer name stub."
        (interactive)
        (helm-insert-string
         (with-current-buffer helm-current-buffer
           (buffer-stub-name))))
    
      (custom-set-variables
       '(helm-command-prefix-key "M-S")
       '(helm-input-idle-delay 0)
       '(helm-idle-delay 0.3)
       '(helm-quick-update t)
       '(helm-c-use-standard-keys t)
       '(helm-quick-update nil)
       '(helm-enable-shortcuts 'prefix))
    
      (eval-after-load 'helm
        '(progn
           (require 'helm-mode)
           (require 'helm-config)
           (require 'helm-match-plugin)
           (require 'helm-buffers)
           (require 'helm-files)
           (require 'helm-locate)
           (require 'helm-w3m)
    
           ;;; Shortcuts
           (define-key helm-map (kbd "M-s") 'helm-select-with-prefix-shortcut)
    
           (define-key helm-command-map (kbd "g") 'helm-do-grep)
           (define-key helm-command-map (kbd "o") 'helm-occur)
           (define-key helm-command-map (kbd "r") 'helm-register)
           (define-key helm-command-map (kbd "R") 'helm-regexp)
           (define-key helm-command-map (kbd "b") 'helm-c-pp-bookmarks)
           (define-key helm-command-map (kbd "p") 'helm-c-eproject-projects)
           (define-key helm-command-map (kbd "f") 'helm-c-eproject-files-in-project)
           (define-key helm-command-map (kbd "<SPC>") 'helm-all-mark-rings)))
    
      ;;; Sources
      (defvar my-helm-sources nil)
      (setq my-helm-sources
            '(helm-source-files-in-current-dir
              helm-source-eproject-files-in-project
              helm-source-eproject-projects
              helm-source-buffers-list
              helm-source-file-cache
              helm-source-recentf
              helm-source-file-name-history
              helm-source-bookmarks
              helm-source-w3m-bookmarks))
    
      (defun my-helm-go ()
        "Preconfigured `helm' to fidn fiels"
        (interactive)
        (helm-other-buffer my-helm-sources "*helm go*"))
    
      (autoload 'helm-command-prefix "helm-config" nil nil 'keymap)
    
      (global-set-key (kbd "M-X") 'my-helm-go)
      (define-key my-keymap (kbd "M-s") 'my-helm-go)
      (define-key my-keymap (kbd "s") 'helm-command-prefix)
    
      ;; 1. Quote the string
      ;; 2. If we didn't input any typically regexp characters, convert spaces to .*,
      ;;    however, it is still order related.
      (defun helm-pattern-to-regexp (string)
        (prin1-to-string
         (if (string-match-p "[][*+$^]" string) string
           (let ((parts (split-string string "[ \t]+" t)))
             (if (eq 2 (length parts))
                 ;; for two parts a,b we make a.*b\|b.*a
                 (concat
                  (mapconcat 'regexp-quote parts ".*")
                  "\\|"
                  (mapconcat 'regexp-quote (reverse parts) ".*"))
               ;; only 1 part or more than 2 parts, fine, just combine them using .*,
               ;; thus it will slow down locate a lot. This means you have to type in order
               (mapconcat 'regexp-quote parts ".*"))))))
    
      ;; Hack
      ;; Convert helm pattern to regexp for locate
      (defadvice helm-c-locate-init (around helm-pattern-to-regexp () activate)
        (let ((helm-pattern (helm-pattern-to-regexp helm-pattern)))
          ad-do-it))
      )

<a name="sec-7-22"></a>
## octave-mode

    (define-module octave-mode
      (add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode)))

<a name="sec-7-23"></a>
## compile-and-run

    (define-module compile-and-run
      (custom-set-variables
       '(compilation-window-height 11)
       '(compilation-auto-jump-to-first-error nil)
       '(compilation-context-lines 5)
       '(compilation-scroll-output (quote first-error)))
    
      (eval-after-load 'compile
        '(progn
           (add-to-list 'compilation-error-regexp-alist-alist
                        '(maven "^\\[\\w+\\] \\(.*\\):\\[\\([0-9]+\\),\\([0-9]+\\)\\] \\(.*\\)$" 1 2 3 (4)))
           (add-to-list 'compilation-error-regexp-alist 'maven)))
    
      (require 'ansi-color)
      (defun colorize-compilation-buffer ()
        (toggle-read-only)
        (ansi-color-apply-on-region (point-min) (point-max))
        (toggle-read-only))
      (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
    
      (defun compilation-notify-result (buffer message)
        (with-current-buffer buffer
          (notify mode-name message)))
    
      (when (fboundp 'notify)
        (add-hook 'compilation-finish-functions 'compilation-notify-result))
    
      (autoload 'smart-compile "smart-compile+" nil t)
      (autoload 'smart-run "smart-compile+" nil t)
      (autoload 'smart-compile-replace "smart-compile+" nil t)
    
      (eval-after-load 'smart-compile+
        '(progn
           (setq smart-run-alist
                 (append
                  (list
                   (cons "_spec\\.rb\\'" '(compile (concat "cd " (eproject-root) "; rr rspec --no-color " (file-relative-name (buffer-file-name) (eproject-root)))))
                   (cons "\\.rb\\'" "rr ruby %F")
                   (cons "\\.go\\'" "go run %F")
                   (cons "\\.py\\'" "python %F"))
                  smart-run-alist))
           (setq smart-compile-alist
                 (append
                  (list
                   (cons "\\.coffee$" "coffee -c %f"))
                  smart-compile-alist))
           (setq smart-executable-alist
                 (append '("%n.rb" "%n.go" "%n.py") smart-executable-alist))))
    
      (defvar run-this--hist nil "History for `run-this'")
    
      (defun run-this (command &optional remember)
        (interactive (list (if (minibufferp)
                               (buffer-substring (minibuffer-prompt-end) (point-max))
                             (read-from-minibuffer "Shell command: "
                                                   (car run-this--hist) nil nil
                                                   '(run-this--hist . 1)))
                           current-prefix-arg))
        (if (minibufferp)
            (progn
              (delete-minibuffer-contents)
              (goto-char (minibuffer-prompt-end))
              (insert (with-current-buffer (window-buffer (minibuffer-selected-window))
                        (smart-compile-replace command))))
          (setq command (smart-compile-replace command))
          (when remember
            (let ((map (make-sparse-keymap))
                  (dir default-directory))
              (define-key map (kbd "r") (eval `(lambda () (interactive)
                                                 (iy-go-compile ,command ,dir))))
              (global-set-key (kbd "M-s v") map)))
          (compile command)))
    
      (global-set-key [f5] 'compile)
      (define-key my-keymap (kbd "M-c") 'recompile)
    
      (define-key my-keymap (kbd "c") 'smart-compile)
      (define-key my-keymap (kbd "x") 'smart-run)
      (global-set-key (kbd "C-1") 'run-this)
      (define-key my-keymap (kbd "1") 'run-this)
      (global-set-key (kbd "C-`") 'next-error)
      (global-set-key (kbd "C-~") 'previous-error))

<a name="sec-7-24"></a>
## editing

Misc editing config

    (define-module editing
      (custom-set-variables
       '(kill-whole-line t))
    
      (require-package 'whole-line-or-region)
      (whole-line-or-region-mode +1)
    
      (global-set-key (kbd "C-S-k") 'mf-smart-kill-whole-line)
    
      (define-key my-keymap (kbd "q u") 'mf-insert-user)
      (define-key my-keymap (kbd "q t") 'mf-insert-time)
      (define-key my-keymap (kbd "q s") 'mf-insert-timestamp)
      (define-key my-keymap (kbd "q d") 'mf-insert-date)
      (define-key my-keymap (kbd "q f") 'mf-insert-file-name)
      (define-key my-keymap (kbd "q b") 'mf-jared/insert-file-or-buffer-name)
    
      (define-key global-map "\C-j" 'newline)
      (define-key global-map "\C-m" 'newline-and-indent)
      (global-set-key (kbd "M-<return>") 'mf-next-line-and-open-it-if-not-empty)
      (global-set-key (kbd "M-S-<return>") 'mf-append-line-delimter-then-next-line-and-open-it-if-not-empty)
      (global-set-key (kbd "s-<return>") 'mf-next-line-and-open-it-if-not-empty)
      (global-set-key (kbd "C-x C-o") 'shrink-whitespaces)
      (global-set-key (kbd "C-8") 'pop-tag-mark))

<a name="sec-7-25"></a>
## kill-ring

    (define-module kill-ring
      (custom-set-variables
       '(kill-ring-max 500))
    
      (require-package 'browse-kill-ring)
      (require-package 'kill-ring-search)
    
      (global-set-key (kbd "C-M-y") 'browse-kill-ring)
    
      (defadvice yank-pop (around kill-ring-search-maybe (arg) activate)
        "If last action was not a yank, run `kill-ring-search' instead."
        (interactive "p")
        (if (not (eq last-command 'yank))
            (kill-ring-search)
          (barf-if-buffer-read-only)
          ad-do-it)))

<a name="sec-7-26"></a>
## recentf

    (define-module recentf
      (custom-set-variables
       '(recentf-arrange-rules (quote (("Elisp files (%d)" ".\\.el\\'") ("Java files (%d)" ".\\.java\\'") ("C/C++ files (%d)" ".\\.c\\(pp\\)?\\'" ".\\.h\\(pp\\)?\\'") ("Org files (%d)" ".\\.org\\'"))))
       '(recentf-exclude (quote ("semantic\\.cache" "COMMIT_EDITMSG" "git-emacs-tmp.*" "\\.breadcrumb" "\\.ido\\.last" "\\.projects.ede" "/g/org/")))
       '(recentf-menu-filter (quote recentf-arrange-by-rule))
       '(recentf-max-saved-items 200))
    
      (recentf-mode +1)
    
      (global-set-key [f2] 'recentf-open-files))

<a name="sec-7-27"></a>
## desktop

    (define-module desktop
      (custom-set-variables
       '(desktop-base-file-name ".emacs.desktop")
       '(desktop-path (list "." user-emacs-directory))
       '(desktop-restore-eager 14)
       '(desktop-save (quote ask-if-new))
       '(desktop-load-locked-desktop t)
       '(desktop-clear-preserve-buffers (list "\\*scratch\\*" "\\*Messages\\*" "\\*server\\*" "\\*tramp/.+\\*" "\\*Warnings\\*"
                                              "\\*Org Agenda\\*" ".*\\.org"))
       ;; Quietly load safe variables, otherwise it hang up Emacs when starting as daemon.
       '(enable-local-variables :safe))
    
      (desktop-save-mode +1)
      (setq history-length 250)
      (add-to-list 'desktop-globals-to-save 'file-name-history)
      (add-to-list 'desktop-modes-not-to-save 'Info-mode)
      (add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
      (add-to-list 'desktop-modes-not-to-save 'fundamental-mode))

<a name="sec-7-28"></a>
## mark

    (define-module mark
      (require-package 'expand-region)
    
      (global-set-key (kbd "M-SPC") 'thing-actions-mark-thing)
      (global-set-key (kbd "C-2") 'er/expand-region)
      (global-set-key [(meta ?@)] 'mark-word)
      (global-set-key [(control meta ? )] 'mark-sexp)
      (global-set-key [(control meta shift ?u)] 'mark-enclosing-sexp)
    
      ;; diactivate mark after narrow
      (defadvice narrow-to-region (after deactivate-mark (start end) activate)
        (deactivate-mark)))

<a name="sec-7-29"></a>
## whitespace

    (define-module whitespace
      (custom-set-variables
       '(whitespace-action '(cleanup))
       '(whitespace-global-modes
         '(emacs-lisp-mode ruby-mode coffee-mode sass-mode
                           css-mode haml-mode python-mode
                           go-mode))
       '(whitespace-line-column fill-column)
       '(whitespace-style (quote (face tabs trailing newline indentation space-before-tab tab-mark newline-mark)))
       '(coffee-cleanup-whitespace nil))
    
      (global-whitespace-mode +1))

<a name="sec-8"></a>
# TODO Backlog
