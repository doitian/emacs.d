
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(set-background-color "#002b36")
(set-foreground-color "#839496")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; (load custom-file t)

(defvar my-lisp-dir (expand-file-name "lisp/" user-emacs-directory)
  ".emacs.d/lisp")

(setq load-path (cons my-lisp-dir load-path))

;; load loaddefs if generated, otherwise load all files in lisp
(let ((loaddefs (concat my-lisp-dir "my-loaddefs.el")))
  (if (file-exists-p loaddefs)
      (progn
        (require 'my-loaddefs))
    (mapc (lambda (file)
            (require (intern (file-name-sans-extension
                              (file-name-nondirectory it)))))
          (file-expand-wildcards (concat my-lisp-dir "*.el")))))

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

(require 'cl)

(defun init--theme ()
  (set-frame-font "Source Code Pro for Powerline-18:weight=medium")
  (set-fontset-font "fontset-default" 'chinese-gbk "Hiragino Sans GB-22:weight=medium"))
(init--theme)

(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))

;; prefer fringe
(setq next-error-highlight 'fringe-arrow)

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
(add-hook 'after-make-window-system-frame-hooks 'init--theme)

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
 '(use-dialog-box nil)
 '(ps-default-fg nil)
 '(ps-default-bg nil)
 '(ps-print-color-p nil)
 '(custom-safe-themes
   (quote
    ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))

(global-hl-line-mode)
(require-package 'solarized-theme)
(load-theme 'solarized-dark)

(custom-set-variables
 '(default-major-mode (quote text-mode) t)
 '(ad-redefinition-action 'accept)
 '(enable-recursive-minibuffers t)
 '(minibuffer-depth-indicate-mode t)

 '(tab-width 2)
 '(indent-tabs-mode nil)
 '(show-paren-mode t)
 '(fill-column 78)

 '(tags-add-tables nil)

 '(set-mark-command-repeat-pop t)

 '(max-specpdl-size 2500)
 '(max-lisp-eval-depth 1200))

(custom-set-variables
 '(delete-by-moving-to-trash t)
 '(tramp-default-method-alist (quote (("\\`localhost\\'" "\\`root\\'" "sudo")))))

(custom-set-variables
 '(mouse-yank-at-point t)
 '(x-select-enable-clipboard t))

(custom-set-variables
 '(current-language-environment "UTF-8")
 '(locale-coding-system 'utf-8))

(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(custom-set-variables
 '(safe-local-variable-values '((encoding . utf-8)
                                (outline-minor-mode . t))))

(fset 'yes-or-no-p 'y-or-n-p)
(defalias 'save-pwd 'mf-xsteve-save-current-directory)
(defalias 'qrr 'query-replace-regexp)
(defalias 'rr 'replace-regexp)
(defalias 'rb 'revert-buffer-no-confirm)
(defalias 'occ 'occur)
(defalias 'mocc 'multi-occur)
(defalias 'moccr 'multi-occur-in-matching-buffers)
(defalias 'aa 'helm-apropos)
(defalias 'wc 'whitespace-cleanup)
(defalias 'flb 'add-file-local-variable)
(defalias 'fll 'add-file-local-variable-prop-line)
(defalias 'fl 'add-file-local-variable-prop-line)
(defalias 'dl 'add-dir-local-variable)
(defalias 'ack 'agap)
(defalias 'sudo 'mf-find-alternativefooe-with-sudo)
(defalias 'af 'auto-fill-mode)

(when (eq system-type 'darwin)
  (custom-set-variables '(mac-command-modifier 'super)
                        '(mac-right-command-modifier 'meta)
                        '(mac-option-modifier 'meta)
                        '(ns-pop-up-frames nil)
                        '(helm-locate-command "mdfind %s %s")
                        '(locate-command "mdfind"))

  (defalias 'mdfind 'locate)

  (define-key key-translation-map (kbd "H-<tab>") (kbd "M-TAB"))

  (if (file-executable-p "/usr/local/bin/gls")
      (setq insert-directory-program "/usr/local/bin/gls")
    (setq dired-use-ls-dired nil))

  (defun system-move-file-to-trash--using-rm-trash (filename)
    "Remove file specified by FILENAME using rm-trash"
    (call-process "ruby" nil nil nil
                  "-W0" "-KU"
                  (expand-file-name "~/.rm-trash/rm.rb")
                  "-rf"
                  filename))
  (unless (fboundp 'system-move-file-to-trash)
    (defalias
      'system-move-file-to-trash
      'system-move-file-to-trash--using-rm-trash))

  (require-package 'reveal-in-finder)
  (defun open-in-iterm ()
    (interactive)
    (cl-flet ((reveal-in-finder-as
            (dir file)
            (call-process "open" nil nil nil "-a" "iTerm.app" dir)))
          (call-interactively 'reveal-in-finder)))

  (global-set-key (kbd "s-r") 'reveal-in-global)
  (global-set-key (kbd "s-t") 'open-in-iterm))

(ido-mode +1)
(ido-load-history)

(define-key ido-file-completion-map [(meta ?l)] nil)
(setq completion-ignored-extensions (cons ".meta" completion-ignored-extensions))
(custom-set-variables
 '(ido-save-directory-list-file
   (expand-file-name ".ido.last" user-emacs-directory))
 '(ido-default-file-method 'selected-window)
 '(ido-default-buffer-method 'selected-window))

(custom-set-variables
 '(ido-enable-regexp nil)
 '(ido-enable-flex-matching nil)
 '(ido-everywhere t)
 '(ido-read-file-name-as-directory-commands nil)
 '(ido-use-filename-at-point nil)
 '(flx-ido-threshhold 8000))

(require-package 'flx)
(require-package 'flx-ido)
(require-package 'ido-hacks)
(require-package 'ido-complete-space-or-hyphen)
(require-package 'idomenu)
(put 'bookmark-set 'ido 'ignore)
(put 'ido-exit-minibuffer 'ido 'ignore)

(ido-complete-space-or-hyphen-enable)

(require 'ido-hacks)
(ido-hacks-mode +1)
;; Use flx in flex matching
(ad-disable-advice 'ido-set-matches-1 'around 'ido-hacks-ido-set-matches-1)
(ad-activate 'ido-set-matches-1)
(mapc (lambda (s) (put s 'ido-hacks-fix-default t))
      '(bookmark-set))

(require 'flx-ido)
(setq ido-use-faces nil)
(flx-ido-mode +1)

(defun init--ido-setup ()
  (define-key ido-completion-map (kbd "M-m") 'ido-merge-work-directories)
  (define-key ido-completion-map "\C-c" 'ido-toggle-case))

(add-hook 'ido-setup-hook 'init--ido-setup)

(require-package 'ido-vertical-mode)
(ido-vertical-mode +1)

(require-package 'undo-tree)
(global-undo-tree-mode)
(define-key undo-tree-map (kbd "C-x r") nil)
(define-key ctl-x-r-map "u" 'undo-tree-save-state-to-register)
(define-key ctl-x-r-map "U" 'undo-tree-restore-state-from-register)

(custom-set-variables
 '(evil-shift-width 2)
 '(evil-leader/leader ","))
(require-package 'evil)
(require-package 'evil-surround)
(require-package 'evil-indent-textobject)
(require-package 'evil-leader)
(require-package 'evil-visualstar)
(evil-mode 1)
(global-evil-surround-mode 1)
(global-evil-leader-mode 1)
(require 'evil-visualstar)
(evil-leader/set-key
  ":" 'evil-repeat-find-char-reverse
  ";" 'evil-repeat-find-char
  "i" 'idomenu
  "," 'projectile-find-file)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)

;; (setq evil-default-state 'emacs)
(define-key evil-emacs-state-map (kbd "C-o") 'evil-execute-in-normal-state)
(evil-set-initial-state 'magit-log-edit-mode 'emacs)
(evil-set-initial-state 'ibuffer-mode 'normal)

(define-key evil-normal-state-map (kbd "C-j")  'windmove-down)
(define-key evil-normal-state-map (kbd "C-k")  'windmove-up)
(define-key evil-normal-state-map (kbd "C-h")  'windmove-left)
(define-key evil-normal-state-map (kbd "C-l")  'windmove-right)

(require-package 'projectile)
(custom-set-variables
 '(projectile-enable-caching t))
(projectile-global-mode)

(custom-set-variables
 '(magit-process-popup-time 60)
 '(magit-repo-dirs (expand-file-name "~/codebase"))
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
  (local-set-key [f12] 'magit-mode-quit-window))

(add-hook 'magit-mode-hook 'init--magit-mode)

(global-set-key [f12] 'magit-status)

(require-package 'ag)
(require-package 'wgrep-ag)

(defun agcase (string directory)
  "Search using ag in a given DIRECTORY for a given search STRING,
with STRING defaulting to the symbol under point.

If called with a prefix, prompts for flags to pass to ag."
  (interactive (list (read-from-minibuffer "Search string: " (ag/dwim-at-point))
                     (read-directory-name "Directory: ")))
  (let ((ag-arguments (list "--nogroup" "--column" "--")))
    (ag/search string directory)))

(define-key search-map (kbd "O") 'multi-occur)
(define-key search-map (kbd "C-o") 'multi-occur-in-matching-buffers)
(global-set-key (kbd "<f9>") 'rgrep)
(global-set-key (kbd "<f10>") 'find-dired)
(global-set-key (kbd "<f11>") 'find-grep-dired)

(require-package 'expand-region)

(global-set-key (kbd "C-2") 'er/expand-region)
(global-set-key [(meta ?@)] 'mark-word)
(global-set-key [(control meta ? )] 'mark-sexp)
(global-set-key [(control meta shift ?u)] 'mark-enclosing-sexp)

;; diactivate mark after narrow
(defadvice narrow-to-region (after deactivate-mark (start end) activate)
  (deactivate-mark))

(require-package 'editorconfig)

(global-set-key (kbd "C-`") 'next-error)
(global-set-key (kbd "C-~") 'previous-error)

(defun alternative-files-go-finder (&optional file)
  (let ((file (or file (alternative-files--detect-file-name))))
    (cond
     ((string-match "^\\(.+\\)_test\\.go$" file)
      (let ((base (match-string 1 file)))
        (list
         (concat base ".go"))))

     ((string-match "^\\(.*\\)\\.go$" file)
      (let* ((base (match-string 1 file)))
        (list
         (concat base "_test.go")))))))

(setq alternative-files-user-functions
      '(alternative-files-go-finder))

(setq alternative-files-root-dir-function 'projectile-project-p)

(define-key search-map "a" 'alternative-files-find-file)
(define-key search-map (kbd "M-a") 'alternative-files-find-file)
(define-key search-map (kbd "A") 'alternative-files-create-file)

(global-set-key (kbd "C-x C-b") 'ibuffer)
