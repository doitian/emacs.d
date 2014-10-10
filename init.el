
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)

(defun init--theme ()
  (set-frame-font "Inconsolate for Powerline:pixelsize=16")
  (set-fontset-font "fontset-default" 'chinese-gbk "Hiragino Sans GB:pixelsize=20"))

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
 '(ps-print-color-p nil))

(global-hl-line-mode)

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
    (flet ((reveal-in-finder-as
            (dir file)
            (call-process "open" nil nil nil "-a" "iTerm.app" dir)))
          (call-interactively 'reveal-in-finder)))

  (global-set-key (kbd "s-r") 'reveal-in-global)
  (global-set-key (kbd "s-t") 'open-in-iterm))

(require-package 'projectile)
(custom-set-variables
 '(projectile-enable-caching t))
(projectile-global-mode)

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
  (local-set-key [f12] 'magit-mode-quit-window))

(add-hook 'magit-mode-hook 'init--magit-mode)

(global-set-key [f12] 'magit-status)
