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
<li><a href="#sec-7-4">7.4. movement-keybindings</a></li>
<li><a href="#sec-7-5">7.5. char-motion</a></li>
<li><a href="#sec-7-6">7.6. ido</a></li>
<li><a href="#sec-7-7">7.7. magit</a></li>
<li><a href="#sec-7-8">7.8. org</a></li>
<li><a href="#sec-7-9">7.9. org-files</a></li>
<li><a href="#sec-7-10">7.10. org-capture</a></li>
<li><a href="#sec-7-11">7.11. org-clock</a></li>
<li><a href="#sec-7-12">7.12. org-gtd</a></li>
<li><a href="#sec-7-13">7.13. org-agenda</a></li>
<li><a href="#sec-7-14">7.14. org-export</a></li>
<li><a href="#sec-7-15">7.15. org-speed</a></li>
<li><a href="#sec-7-16">7.16. org-pomodoro</a></li>
<li><a href="#sec-7-17">7.17. org-appt</a></li>
<li><a href="#sec-7-18">7.18. org-babel</a></li>
<li><a href="#sec-7-19">7.19. org-drill</a></li>
<li><a href="#sec-7-20">7.20. case-dwim</a></li>
<li><a href="#sec-7-21">7.21. server</a></li>
<li><a href="#sec-7-22">7.22. backup</a></li>
<li><a href="#sec-7-23">7.23. multiple-cursors</a></li>
<li><a href="#sec-7-24">7.24. dired</a></li>
<li><a href="#sec-7-25">7.25. buffer-explore</a></li>
<li><a href="#sec-7-26">7.26. window-nav</a></li>
<li><a href="#sec-7-27">7.27. window-manager</a></li>
<li><a href="#sec-7-28">7.28. vc</a></li>
<li><a href="#sec-7-29">7.29. isearch</a></li>
<li><a href="#sec-7-30">7.30. revert</a></li>
<li><a href="#sec-7-31">7.31. eshell</a></li>
<li><a href="#sec-7-32">7.32. eproject</a></li>
<li><a href="#sec-7-33">7.33. helm</a></li>
<li><a href="#sec-7-34">7.34. octave-mode</a></li>
<li><a href="#sec-7-35">7.35. compile-and-run</a></li>
<li><a href="#sec-7-36">7.36. editing</a></li>
<li><a href="#sec-7-37">7.37. kill-ring</a></li>
<li><a href="#sec-7-38">7.38. recentf</a></li>
<li><a href="#sec-7-39">7.39. desktop</a></li>
<li><a href="#sec-7-40">7.40. mark</a></li>
<li><a href="#sec-7-41">7.41. whitespace</a></li>
<li><a href="#sec-7-42">7.42. bookmark</a></li>
<li><a href="#sec-7-43">7.43. spell</a></li>
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

```cl
(progn
  (let* ((dir (concat (file-name-directory (buffer-file-name))))
         (outfile (concat dir "init.el"))
         (generated-autoload-file (concat dir "site-lisp/my-loaddefs.el")))
    (update-directory-autoloads (concat dir "site-lisp"))
    (org-babel-tangle-file (buffer-file-name) outfile)
    (byte-compile-file outfile)))

```

<a name="sec-1-2"></a>
## vendor

Some packages are large, and are not stable to install from ELPA. Install them using `make vendor`.

```cl
make vendor

```

<a name="sec-2"></a>
# Startup

Remove annoying UI

```cl
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

```

<a name="sec-3"></a>
# Dependencies

```cl
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

```

<a name="sec-4"></a>
# Theme

```cl
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

```

<a name="sec-5"></a>
# My Config

<a name="sec-5-1"></a>
## Custom/secrets files

```cl
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)
(load my-custom-readonly-file t)
(load my-secrets-file t)

```

<a name="sec-5-2"></a>
## Basic

```cl
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

```

<a name="sec-5-3"></a>
## File system

```cl
(custom-set-variables
 '(delete-by-moving-to-trash t)
 '(tramp-default-method-alist (quote (("\\`localhost\\'" "\\`root\\'" "sudo")))))

```

<a name="sec-5-4"></a>
## Clipboard

```cl
(custom-set-variables
 '(mouse-yank-at-point t)
 '(x-select-enable-clipboard t))

```

<a name="sec-5-5"></a>
## Encoding

```cl
(custom-set-variables
 '(current-language-environment "UTF-8")
 '(locale-coding-system 'utf-8))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

```

<a name="sec-5-6"></a>
## Enable Commands

```cl
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

```

<a name="sec-5-7"></a>
## Safe Variables

```cl
(custom-set-variables
 '(safe-local-variable-values '((encoding . utf-8)
                                (outline-minor-mode . t))))

```

<a name="sec-5-8"></a>
## Aliases

```cl
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

```

<a name="sec-6"></a>
# ELPA

Load package on demand

```cl
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

```

<a name="sec-7"></a>
# Modules

Disable module by adding it to `module-black-list`.

```cl
;; Example
;; (custom-set-variables
;;   '(module-black-list '(tex r delete-keys-hacks)))

```

<a name="sec-7-1"></a>
## s

```cl
(define-module s
  (require-package 's)
  (require 's nil t))

```

<a name="sec-7-2"></a>
## delete-keys-hacks

Use <kbd>M-r</kbd> to delete word backward, <kbd>C-h</kbd> to delete char backword.

To get help, use <kbd>C-H</kbd> or <kbd>F1</kbd> instead.

This is an opinioned config, disable it by adding it to `module-black-list`.

```cl
(define-module delete-keys-hacks
  "Translate C-h and M-r to delete char and word backward"
  (define-key key-translation-map [?\C-h] [?\C-?])
  (define-key key-translation-map [?\M-r] [?\C-\M-?]))

```

<a name="sec-7-3"></a>
## my-basic-keybindings

-   Disable global <kbd>M-s</kbd>

-   Use <kbd>C-,</kbd> as rectangle commands prefix (<kbd>C-x r)

-   Use <kbd>C-'</kbd> and <kbd>M-'</kbd> as negative argument.

```cl
(define-module my-basic-keybindings
  (global-set-key (kbd "M-s") nil)
  (define-key my-minor-mode-map (kbd "C-,") ctl-x-r-map)
  (define-key my-minor-mode-map (kbd "C-'") 'negative-argument)
  (define-key my-minor-mode-map (kbd "M-'") 'negative-argument))

```

<a name="sec-7-4"></a>
## movement-keybindings

```cl
(define-module move-keybindings
  (global-set-key (kbd "M-g") 'goto-line)
  (global-set-key (kbd "M-C-g") 'move-to-window-line-top-bottom)

  (global-set-key (kbd "M-F") 'forward-symbol)
  (global-set-key (kbd "M-B") (lambda (arg)
                                (interactive "p")
                                (forward-symbol (- arg))))

  (global-set-key (kbd "C->") 'scroll-left)
  (global-set-key (kbd "C-<") 'scroll-right)
  (global-set-key (kbd "C-x >") 'scroll-left)
  (global-set-key (kbd "C-x <") 'scroll-right)

  (global-set-key (kbd "C-<left>") 'scroll-right)
  (global-set-key (kbd "C-<right>") 'scroll-left)
  (global-set-key (kbd "C-<up>") 'scroll-down)
  (global-set-key (kbd "C-<down>") 'scroll-up))

```

<a name="sec-7-5"></a>
## char-motion

```cl
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

```

<a name="sec-7-6"></a>
## ido

```cl
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

```

<a name="sec-7-7"></a>
## magit

```cl
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

```

<a name="sec-7-8"></a>
## org

Install latest org by running `make org`. Othewise system bundled version is used.

```cl
(define-module org
  "Basic orgmode setup"

  (custom-set-variables
   '(org-modules '(org-bibtex org-bookmark org-expiry org-habit org-id org-info
                              org-inlinetask org-man org-w3m org-clock org-timer
                              org-protocol org-drill org-mu4e))
   '(org-global-properties '(("STYLE_ALL" . "habit")))
   '(org-read-date-prefer-future 'time)
   '(org-completion-use-ido t)
   '(org-refile-targets '((org-agenda-files :maxlevel . 3)
                          '(:maxlevel . 3)))
   '(org-refile-use-outline-path 'file)
   '(org-outline-path-complete-in-steps nil)
   '(org-clock-history-length 35)
   '(org-clock-idle-time 30)
   '(org-drawers '("PROPERTIES" "LOGBOOK" "CLOCK"))
   '(org-clock-into-drawer "CLOCK")
   '(org-clock-persist (quote history))
   '(org-agenda-todo-ignore-with-date t)
   '(org-agenda-skip-deadline-if-done t)
   '(org-agenda-skip-scheduled-if-done t)
   '(org-agenda-skip-timestamp-if-done t)
   '(org-agenda-span 7)
   '(org-tags-column -80)
   '(org-agenda-tags-column -80)
   '(org-enforce-todo-checkbox-dependencies t)
   '(org-enforce-todo-dependencies t)
   '(org-cycle-separator-lines 2)
   '(org-agenda-todo-list-sublevels t)
   '(org-show-following-heading t)
   '(org-show-hierarchy-above t)
   '(org-show-siblings nil)
   '(org-log-into-drawer t)
   '(org-special-ctrl-a/e t)
   '(org-special-ctrl-k t)
   '(org-yank-adjusted-subtrees nil)
   '(org-use-fast-todo-selection t)
   '(org-file-apps '((t . emacs)
                     (system . "open %s")))
   '(org-fontify-done-headline t))

  (let ((org-load-path
         (car (nreverse (file-expand-wildcards (concat my-vendor-dir "org-*"))))))
    (when org-load-path
      ;; remove system org
      (setq load-path
            (--remove (string= "org" (file-name-nondirectory it)) load-path))
      (setq load-path 
            (cons (concat org-load-path "/lisp")
                  (cons (concat org-load-path "/contrib/lisp")
                        load-path)))
      (or (require 'org-loaddefs nil t) (require 'org nil t))))

  (defun wl-org-column-view-uses-fixed-width-face ()
    ;; copy from org-faces.el
    (when (fboundp 'set-face-attribute)
      ;; Make sure that a fixed-width face is used when we have a column table.
      (set-face-attribute 'org-column nil
                          :height (face-attribute 'default :height)
                          :family (face-attribute 'default :family))))

  (defun init--org-mode ()
    (when (server-running-p) (wl-org-column-view-uses-fixed-width-face))
    (define-key org-mode-map (kbd "C-,") nil)
    (define-key org-mode-map (kbd "C-c ,") 'org-cycle-agenda-files)
    (flyspell-mode +1))

  (add-hook 'org-mode-hook 'init--org-mode)

  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c L") 'org-insert-link-global)
  (global-set-key (kbd "C-c o") 'org-open-at-point-global)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (define-key my-keymap (kbd "r") 'org-capture)
  (define-key my-keymap (kbd "M-r") 'org-capture)
  (autoload 'org-footnote-action "org-footnote" nil t)
  (define-key my-keymap (kbd "t") 'org-footnote-action)
  (define-key my-keymap (kbd "<return>") 'org-clock-goto))

```

<a name="sec-7-9"></a>
## org-files

Store org agenda files in dropbox directory

```cl
(define-module org-files
  (require-module org)
  (make-directory (concat my-dropbox-dir "g/org/projects") t)
  (setq org-directory (concat my-dropbox-dir "g/org"))
  (setq org-agenda-files (list (concat my-dropbox-dir "g/org") (concat my-dropbox-dir "g/org/projects")))
  (setq org-mobile-directory (concat my-dropbox-dir "MobileOrg"))
  (setq org-default-notes-file (concat org-directory "/inbox.org"))
  (setq org-mobile-inbox-for-pull (concat my-dropbox-dir "g/org/from_mobile.org"))

  (defun org ()
    (interactive)
    (ido-find-file-in-dir org-directory))
  (defun snippets ()
    (interactive)
    (ido-find-file-in-dir (concat my-dropbox-dir "g/snippets")))
  (defun dired-g (&rest arguments)
    (interactive)
    (dired (concat my-dropbox-dir "g")))
  (defun orgb ()
    (interactive)
    (ido-find-file-in-dir org-directory)))

```

<a name="sec-7-10"></a>
## org-capture

Capture template

```cl
(define-module org-capture
  (require-module org)
  (setq
   org-capture-templates
   '(("r" "Notes" entry (file+headline (concat org-directory "/inbox.org") "Notes")
      "* %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  %a\n  %i"
      :prepend t)
     ("t" "TODO" entry (file+headline (concat org-directory "/inbox.org") "Tasks")
      "* TODO %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  %a\n  %i")
     ("j" "Journal" plain (file+datetree (concat org-directory "/journal.org"))
      "\n%?\n" :empty-lines 1)
     ("p" "Pomodoro" plain (file+datetree (concat org-directory "/pomodoro.org"))
      "\n%?\n" :empty-lines 1)
     ("d" "Dump" plain (file+olp (concat org-directory "/inbox.org") "Quick Notes" "Plain")
      "\n--%U--------------------------------------------------\n%?\n" :empty-lines 1)
     ("l" "List" item (file+olp (concat org-directory "/inbox.org") "Quick Notes" "List") "%?\n" :empty-lines 1)
     ("s" "SOMEDAY" entry (file+headline (concat org-directory "/inbox.org") "Someday")
      "* SOMEDAY %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  %a\n  %i")
     ("x" "Clipboard" entry (file+headline (concat org-directory "/inbox.org") "Notes")
      "* %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  %x"
      :prepend t :empty-lines 1)
     ("i" "Idea" entry (file (concat org-directory "/spark.org") "")
      "* %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  %a\n  %i")

     ("c" "Code snippet" entry (file (concat my-dropbox-dir "g/snippets/inbox.org"))
      "* %^{title} %^g\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n\n#+BEGIN_SRC %^{lang}\n  %i%?\n#+END_SRC\n")

     ("b" "Default template" entry (file+headline "inbox.org" "Bookmarks")
      "* %:description\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  %c\n\n  %i"
      :prepend t :empty-lines 1 :immediate-finish t))))

```

<a name="sec-7-11"></a>
## org-clock

```cl
(define-module org-clock
  (defun my-org-clock-display (msg)
    (notify "Org Notification" msg :icon "appointment-reminder"))

  (defun org-gtd-clock-out-if-pause ()
    "Clock out when the task is marked PAUSE."
    (when (and (string= org-state "PAUSE")
               (not (string= org-last-state org-state))
               (org-clock-is-active))
      (org-clock-out t)))
  (defun org-gtd-clock-out-switch-to-pause-if-going (state)
    "Switch to PAUSE if clock out a task marked GOING"
    (if (string= state "GOING") "PAUSE" state))
  (defun org-gtd-clock-in-if-starting ()
    "Clock in when the task is marked GOING."
    (when (and (string= org-state "GOING")
               (not (string= org-last-state org-state))
               (not org-clock-current-task))
      (org-clock-in)))
  (add-hook 'org-after-todo-state-change-hook
            'org-gtd-clock-in-if-starting)
  (add-hook 'org-after-todo-state-change-hook
            'org-gtd-clock-out-if-pause)

  (custom-set-variables
   '(org-clock-in-resume nil)
   '(org-clock-in-switch-to-state "GOING")
   '(org-clock-out-switch-to-state
     (function org-gtd-clock-out-switch-to-pause-if-going))
   '(org-clock-out-when-done t))

  (when (fboundp 'notify)
    (setq org-show-notification-handler (function my-org-clock-display))))


```

<a name="sec-7-12"></a>
## org-gtd

Opinioned GTD config based on org

```cl
(define-module org-gtd
  (require-module org)

  (custom-set-variables
   '(org-extend-today-until 2)
   '(org-agenda-time-grid
     '((daily today require-timed remove-match)
       "----------------"
       (930 1000 1200 1400 1600 1800 2000 2200 2400 2500)))
   '(org-todo-keywords
     '((sequence "TODO(t)" "GOING(g)" "PAUSE(p)" "WAITING(w@)" "LATER(l)"
                 "|" "DONE(d!/@)" "SOMEDAY(s)" "CANCELED(c@)")))
   '(org-todo-keyword-faces
     '(("TODO" :foreground "coral3" :weight bold)
       ("GOING" :foreground "green" :weight bold)
       ("PAUSE" :foreground "yellow" :weight bold)))
   '(org-priority-faces
     '((?A :foreground "red" :weight bold)
       (?B :foreground "#94bff3" :weight bold)
       (?C :foreground "#6f6f6f")))
   '(org-tag-alist '((:startgroup . nil)
                     ("@home" . ?h)
                     ("@errands" . ?e)
                     ("@computer" . ?c)
                     ("@reading" . ?r)
                     ("@phone" . ?p)
                     ("@message" . ?m)
                     (:endgroup . nil)
                     ("project" . ?x)
                     ("event" . ?v)
                     ("idea" . ?i)
                     ("next" . ?n)))
   '(org-todo-state-tags-triggers
     '(("WAITING" ("next"))
       ("LATER" ("next"))
       ("DONE" ("next"))
       ("SOMEDAY" ("next"))
       ("CANCELED" ("next"))
       ("GOING" ("next" . t))))
   '(org-stuck-projects
     '("project/-DONE-CANCELED"
       ("GOING") ("next") ""))
   '(org-tags-exclude-from-inheritance '("project"))
   '(org-columns-default-format
     "%42ITEM %TODO %3Effort(E){:} %3CLOCKSUM_T(R) %SCHEDULED")))

```

<a name="sec-7-13"></a>
## org-agenda

```cl
(define-module org-agenda
  (require-module org)
  (require-module org-files)

  (defun sacha/org-agenda-done (&optional arg)
    "Mark current TODO as done.
This changes the line at point, all other lines in the agenda referring to
the same tree node, and the headline of the tree node in the Org-mode file."
    (interactive "P")
    (org-agenda-todo "DONE"))

  (defun sacha/org-agenda-mark-done-and-add-followup ()
    "Mark the current TODO as done and add another task after it.
Creates it at the same level as the previous task, so it's better to use
this with to-do items than with projects or headings."
    (interactive)
    (org-agenda-todo "DONE")
    (org-agenda-switch-to)
    (org-capture 0 "t"))

  (defun sacha/org-agenda-new ()
    "Create a new note or task at the current agenda item.
Creates it at the same level as the previous task, so it's better to use
this with to-do items than with projects or headings."
    (interactive)
    (org-agenda-switch-to)
    (org-capture 0))

  (defun org-agenda-3-days-view (&optional day-of-year)
    "Switch to 3-days (yesterday, today, tomorrow) view for agenda."
    (interactive "P")
    (org-agenda-check-type t 'agenda)
    (if (and (not day-of-year) (equal org-agenda-current-span 3))
        (error "Viewing span is already \"%s\"" 3))
    (let* ((sd (or day-of-year 
                   (org-get-at-bol 'day)
                   (time-to-days (current-time))))
           (sd (and sd (1- sd)))
           (org-agenda-overriding-arguments
            (or org-agenda-overriding-arguments
                (list (car (get-text-property (point) 'org-last-args)) sd 3 t))))
      (org-agenda-redo)
      (org-agenda-find-same-or-today-or-agenda))
    (org-agenda-set-mode-name)
    (message "Switched to %s view" 3))  

  (defun init--org-agenda-mode ()
    (define-key org-agenda-mode-map "D" 'org-agenda-3-days-view)
    (define-key org-agenda-mode-map "M" 'org-agenda-month-view)
    (define-key org-agenda-mode-map "x" 'sacha/org-agenda-done)
    (define-key org-agenda-mode-map "X" 'sacha/org-agenda-mark-done-and-add-followup)
    (define-key org-agenda-mode-map "N" 'sacha/org-agenda-new))
  (add-hook 'org-agenda-mode-hook 'init--org-agenda-mode)

  (setq org-agenda-custom-commands
        '(("l" . "Context List")
          ("lh" "Home"
           ((tags-todo "@home/GOING|PAUSE|TODO")))
          ("le" "Errands"
           ((tags-todo "@errands/GOING|PAUSE|TODO")))
          ("lc" "Computer"
           ((tags-todo "@computer/GOING|PAUSE|TODO")))
          ("lp" "Phone"
           ((tags-todo "@phone/GOING|PAUSE|TODO")))
          ("lm" "Message"
           ((tags-todo "@message/GOING|PAUSE|TODO")))
          ("lr" "Reading"
           ((tags-todo "@reading/GOING|PAUSE|TODO")))
          ("L" "Combined Context List"
           ((tags-todo "@home/GOING|PAUSE|TODO")
            (tags-todo "@errands/GOING|PAUSE|TODO")
            (tags-todo "@computer/GOING|PAUSE|TODO")
            (tags-todo "@phone/GOING|PAUSE|TODO")
            (tags-todo "@message/GOING|PAUSE|TODO")
            (tags-todo "@reading/GOING|PAUSE|TODO")))
          ("T" "TODO List"
           ((todo "GOING|PAUSE|TODO"))
           ((org-agenda-todo-ignore-with-date nil)))
          ("M" "Maybe"
           ((todo "WAITING|LATER")
            (todo "SOMEDAY"))
           ((org-agenda-todo-ignore-with-date nil)))
          ("i" "Inbox" tags "inbox-CONTAINER=\"true\"")

          ("d" "Daily Action List"
           ((agenda "" ((org-agenda-span 'day)
                        (org-agenda-sorting-strategy
                         (quote ((agenda time-up priority-down tag-up) )))
                        (org-deadline-warning-days 0)))
            (todo "GOING|PAUSE|TODO"))
           ((org-agenda-todo-ignore-with-date t)))

          ("r" "Review"
           ((agenda "" ((org-agenda-span 'day)
                        (org-agenda-sorting-strategy
                         (quote ((agenda time-up priority-down tag-up) )))
                        (org-deadline-warning-days 0)
                        (org-agenda-skip-deadline-if-done nil)
                        (org-agenda-skip-timestamp-if-done nil)
                        (org-agenda-skip-scheduled-if-done nil)))
            (todo "GOING|PAUSE|TODO")))

          ("p" "Projects" ((tags "project/-DONE-CANCELED") (stuck "")))

          ("x" "Archive tags search" tags "" 
           ((org-agenda-files (file-expand-wildcards (concat org-directory "/*.org_archive" )))))
          ("X" "Archive search" search ""
           ((org-agenda-files (file-expand-wildcards (concat org-directory "/*.org_archive" )))))

          ("c" "Code snippets tags search" tags ""
           ((org-agenda-files (append (file-expand-wildcards (concat my-dropbox-dir "g/snippets/*.org" ))
                                      (file-expand-wildcards (concat my-dropbox-dir "g/snippets/*/*.org"))))))
          ("C" "Code snippets search" search ""
           ((org-agenda-files (append (file-expand-wildcards (concat my-dropbox-dir "g/snippets/*.org" ))
                                      (file-expand-wildcards (concat my-dropbox-dir "g/snippets/*/*.org"))))))

          ("g" "open dropbox/g" dired-g)))
  )

```

<a name="sec-7-14"></a>
## org-export

```cl
(define-module org-export
  (custom-set-variables
   '(org-export-backends '(md html icalendar latex beamer))
   '(org-icalendar-use-scheduled '(todo-start event-if-todo))
   '(org-icalendar-store-UID t)
   '(org-combined-agenda-icalendar-file (concat my-dropbox-dir "g/ical/org.ics")))

  (defun iy-org-ical-verify (backend)
    "Select tasks by adding export tag."
    (when (eq backend 'icalendar)
      (org-map-entries
       (lambda ()
         (let ((tags (org-get-tags)))
           (if (and (member "@errands" tags) (not (member "noexport" tags)))
               (org-set-tags-to (append tags '("export")))
             (org-set-tags-to (append tags '("noexport")))))))))

  (add-hook 'org-export-before-parsing-hook 'iy-org-ical-verify))

```

<a name="sec-7-15"></a>
## org-speed

```cl
(define-module org-speed
  (setq org-speed-commands-user
        '(
          ("x" . org-speed-done)
          ("X" . org-speed-mark-done-and-add-followup)
          ("N" . org-speed-new)))
  (setq org-use-speed-commands t) ; press ? at beginning of header

  (defun org-speed-done (&optional arg)
    "Mark current TODO as done."
    (interactive "P")
    (org-todo "DONE"))

  (defun org-speed-mark-done-and-add-followup ()
    "Mark the current TODO as done and add another task after it.
Creates it at the same level as the previous task, so it's better to use
this with to-do items than with projects or headings."
    (interactive)
    (org-todo "DONE")
    (org-capture 0 "t"))

  (defun org-speed-new ()
    "Create a new note or task at the current agenda item.
Creates it at the same level as the previous task, so it's better to use
this with to-do items than with projects or headings."
    (interactive)
    (org-capture 0)))

```

<a name="sec-7-16"></a>
## org-pomodoro

```cl
(define-module org-pomodoro
  (require-module org)
  (define-key my-keymap (kbd "'") 'org-pomodoro-record-interuptions)
  (add-hook 'org-load-hook 'org-pomodoro-on-org-load)
  (add-hook 'org-agenda-mode-hook 'org-pomodoro-on-org-load))

```

<a name="sec-7-17"></a>
## org-appt

```cl
(define-module org-appt
  (require-module org)

  (appt-activate 1)
  (add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt)

  (defun my-appt-display (min-to-app new-time msg)
    (let ((title (format "Appointment in %d minute(s)" min-to-app)))
      (notify title msg :icon "appointment-reminder")))
  (when (fboundp 'notify)
    (setq appt-disp-window-function (function my-appt-display)))

  (custom-set-variables
   '(appt-display-format (quote window))
   '(appt-message-warning-time 10)
   '(calendar-week-start-day 1)
   '(diary-file (concat my-dropbox-dir "diary"))))

```

<a name="sec-7-18"></a>
## org-babel

Autoload babel languages.

```cl
(define-module org-babel
  (mapc
   (lambda (lang)
     (autoload
       (intern (concat "org-babel-execute:" lang))
       (concat "ob-" lang)
       (format "Execute %s src block" lang)))
   '("ruby" "sh" "R" "ditaa" "dot")))

```

<a name="sec-7-19"></a>
## org-drill

```cl
(define-module org-drill
  (defun init--org-drill-on-dired-load ()
    (define-key dired-mode-map (kbd "C-c SPC") 'my-dired-do-drill))

  (add-hook 'dired-load-hook 'init--org-drill-on-dired-load)

  (defun my-dired-do-drill (&optional arg)
    (interactive "P")
    (org-drill
     ;; This can move point if ARG is an integer.
     (mapcar
      'car
      (dired-map-over-marks (cons (dired-get-filename) (point)) arg)))))

```

<a name="sec-7-20"></a>
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

```cl
(define-module case-dwim
  (global-set-key (kbd "M-l") 'case-dwim-dash)
  (global-set-key (kbd "M-u") 'case-dwim-underscore)
  (global-set-key (kbd "M-L") 'case-dwim-downcase)
  (global-set-key (kbd "M-U") 'case-dwim-upcase)
  (global-set-key (kbd "M-c") 'case-dwim-capitalize)
  (global-set-key (kbd "M-C") 'case-dwim-capitalize)

  (define-key isearch-mode-map (kbd "M-l") 'case-dwim-isearch-dash)
  (define-key isearch-mode-map (kbd "M-u") 'case-dwim-isearch-underscore))

```

<a name="sec-7-21"></a>
## server

Start emacs server.

```cl
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

```

<a name="sec-7-22"></a>
## backup

See commands in `site-lisp/pick-backup.el` to diff or restore a backup.

```cl
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

```

<a name="sec-7-23"></a>
## multiple-cursors

```cl
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

```

<a name="sec-7-24"></a>
## dired

```cl
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

  (autoload 'dired-jump "dired-x" "Jump to dired buffer corresponding to current buffer." t)

  (global-set-key (kbd "C-x C-j") 'dired-jump)
  (add-hook 'dired-load-hook 'init--dired-load)
  (add-hook 'dired-mode-hook 'init--dired-mode)
)

```

<a name="sec-7-25"></a>
## buffer-explore

<a name="sec-7-26"></a>
## window-nav

```cl
(define-module window-nav
  (define-key my-minor-mode-map (kbd "M-o") 'other-window)
  (define-key my-minor-mode-map (kbd "M-O") 'other-frame)
  )

```

<a name="sec-7-27"></a>
## window-manager

<a name="sec-7-28"></a>
## vc

Version Control backends.

`git-emacs` can be install using `make vendor` or `make git-emacs`. See list
of commands using <kbd>C-x g C-h</kbd>. My favrite one is <kbd>C-x g i</kbd>,
add changes interactively using `ediff`.

```cl
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

```

<a name="sec-7-29"></a>
## isearch

```cl
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

```

<a name="sec-7-30"></a>
## revert

Auto revert, and helper functions to revert without confirmation.

```cl
(define-module revert
  (defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive) (flet ((yes-or-no-p (prompt) t)) (revert-buffer)))

  ;; Auto refresh buffers
  ; (global-auto-revert-mode -1)

  ;; Also auto refresh dired, but be quiet about it
  ; (setq global-auto-revert-non-file-buffers t)
  (setq auto-revert-verbose nil))

```

<a name="sec-7-31"></a>
## eshell

```cl
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

```

<a name="sec-7-32"></a>
## eproject

```cl
(define-module eproject
  (require-module eshell)
  (require-package 'eproject)
  (require 'eproject-plus)
  (define-key my-keymap "p" eproject-plus-keymap))

```

<a name="sec-7-33"></a>
## helm

```cl
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



```

<a name="sec-7-34"></a>
## octave-mode

```cl
(define-module octave-mode
  (add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode)))

```

<a name="sec-7-35"></a>
## compile-and-run

```cl
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
       (add-to-list 'compilation-error-regexp-alist 'maven)

       (define-key compilation-mode-map "l" 'compilation-restore-mode-line)))

  (require 'ansi-color)
  (defun colorize-compilation-buffer ()
    (toggle-read-only)
    (ansi-color-apply-on-region (point-min) (point-max))
    (toggle-read-only))
  (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

  (defcustom compilation-defualt-mode-line-background "#2b2b2b"
    "Default mode line background"
    :group 'compilation)
  (defcustom compilation-error-mode-line-background "#310602"
    "Error mode line background"
    :group 'compilation)

  (defun compilation-notify-result (buffer message)
    (setq message (s-trim message))
    (let ((pass (string= message "finished")))
      (notify mode-name message
              :icon (if pass "dialog-ok" "dialog-error"))
      (if pass
          (set-face-attribute 'mode-line nil :background compilation-defualt-mode-line-background)
        (set-face-attribute 'mode-line nil :background compilation-error-mode-line-background))))

  (defun compilation-restore-mode-line ()
    (interactive)
    (setq compilation-in-progress nil)
    (set-face-attribute 'mode-line nil :background compilation-defualt-mode-line-background))

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
                                             (let ((default-directory ,dir))
                                               (compile ,command)))))
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

```

<a name="sec-7-36"></a>
## editing

Misc editing config

```cl
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
  (global-set-key (kbd "C-x C-o") 'mf-shrink-whitespaces)
  (global-set-key (kbd "C-8") 'pop-tag-mark))

```

<a name="sec-7-37"></a>
## kill-ring

```cl
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

```

<a name="sec-7-38"></a>
## recentf

```cl
(define-module recentf
  (custom-set-variables
   '(recentf-arrange-rules (quote (("Elisp files (%d)" ".\\.el\\'") ("Java files (%d)" ".\\.java\\'") ("C/C++ files (%d)" ".\\.c\\(pp\\)?\\'" ".\\.h\\(pp\\)?\\'") ("Org files (%d)" ".\\.org\\'"))))
   '(recentf-exclude (quote ("semantic\\.cache" "COMMIT_EDITMSG" "git-emacs-tmp.*" "\\.breadcrumb" "\\.ido\\.last" "\\.projects.ede" "/g/org/")))
   '(recentf-menu-filter (quote recentf-arrange-by-rule))
   '(recentf-max-saved-items 200))

  (recentf-mode +1)

  (global-set-key [f2] 'recentf-open-files))

```

<a name="sec-7-39"></a>
## desktop

```cl
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

```

<a name="sec-7-40"></a>
## mark

```cl
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

```

<a name="sec-7-41"></a>
## whitespace

```cl
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



```

<a name="sec-7-42"></a>
## bookmark

```cl
(define-module bookmark
  (custom-set-variables
   '(bookmark-use-annotations nil))

  (require-package 'bookmark+)

  (setq bmkp-navigation-map
    (let ((map (make-sparse-keymap)))
      (define-key map "." 'bmkp-next-bookmark-this-buffer)
      (define-key map "," 'bmkp-previous-bookmark-this-buffer)
      (define-key map (kbd "M-.") 'bmkp-next-bookmark-this-buffer)
      (define-key map (kbd "M-,") 'bmkp-previous-bookmark-this-buffer)
      (define-key map (kbd "<") 'bmkp-previous-bookmark)
      (define-key map (kbd ">") 'bmkp-next-bookmark)
      map))

  (temporary-mode-define-keys my-keymap 'bmkp-navigation))

```

<a name="sec-7-43"></a>
## spell

```cl
(define-module spell
  (custom-set-variables
   '(flyspell-use-meta-tab nil))

  (defun init--flyspell-mode ()
    (define-key flyspell-mode-map [(control ?\,)] nil)
    (define-key flyspell-mode-map [(control ?\.)] nil))

  (add-hook 'flyspell-mode-hook 'init--flyspell-mode)

  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'ruby-mode-hook 'flyspell-prog-mode))

```

<a name="sec-8"></a>
# TODO Backlog

```cl

```
