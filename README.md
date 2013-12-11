<div id="table-of-contents">
<h2>Table of Contents</h2>
<div id="text-table-of-contents">
<ul>
<li><a href="#sec-1">1. Usage</a>
<ul>
<li><a href="#sec-1-1">1.1. Quick Start</a></li>
<li><a href="#sec-1-2">1.2. Generate init.el</a></li>
<li><a href="#sec-1-3">1.3. vendor and elpa</a></li>
<li><a href="#sec-1-4">1.4. Modules</a></li>
</ul>
</li>
<li><a href="#sec-2">2. Startup</a></li>
<li><a href="#sec-3">3. Dependencies</a></li>
<li><a href="#sec-4">4. Theme</a></li>
<li><a href="#sec-5">5. My Config</a>
<ul>
<li><a href="#sec-5-1">5.1. Basic</a></li>
<li><a href="#sec-5-2">5.2. File system</a></li>
<li><a href="#sec-5-3">5.3. Clipboard</a></li>
<li><a href="#sec-5-4">5.4. Encoding</a></li>
<li><a href="#sec-5-5">5.5. Enable Commands</a></li>
<li><a href="#sec-5-6">5.6. Safe Variables</a></li>
<li><a href="#sec-5-7">5.7. Aliases</a></li>
</ul>
</li>
<li><a href="#sec-6">6. ELPA</a></li>
<li><a href="#sec-7">7. Modules</a>
<ul>
<li><a href="#sec-7-1">7.1. powerline</a></li>
<li><a href="#sec-7-2">7.2. s</a></li>
<li><a href="#sec-7-3">7.3. delete-keys-hacks</a></li>
<li><a href="#sec-7-4">7.4. my-basic-keybindings</a></li>
<li><a href="#sec-7-5">7.5. movement-keybindings</a></li>
<li><a href="#sec-7-6">7.6. char-motion</a></li>
<li><a href="#sec-7-7">7.7. ace-jump</a></li>
<li><a href="#sec-7-8">7.8. projectile</a></li>
<li><a href="#sec-7-9">7.9. ido</a></li>
<li><a href="#sec-7-10">7.10. ido-plus</a></li>
<li><a href="#sec-7-11">7.11. ido-vertical-mode</a></li>
<li><a href="#sec-7-12">7.12. magit</a></li>
<li><a href="#sec-7-13">7.13. org-basic</a></li>
<li><a href="#sec-7-14">7.14. org-files</a></li>
<li><a href="#sec-7-15">7.15. org-capture</a></li>
<li><a href="#sec-7-16">7.16. org-clock</a></li>
<li><a href="#sec-7-17">7.17. org-gtd</a></li>
<li><a href="#sec-7-18">7.18. org-agenda</a></li>
<li><a href="#sec-7-19">7.19. org-export</a></li>
<li><a href="#sec-7-20">7.20. org-speed</a></li>
<li><a href="#sec-7-21">7.21. org-pomodoro</a></li>
<li><a href="#sec-7-22">7.22. org-appt</a></li>
<li><a href="#sec-7-23">7.23. org-babel</a></li>
<li><a href="#sec-7-24">7.24. org-drill</a></li>
<li><a href="#sec-7-25">7.25. case-dwim</a></li>
<li><a href="#sec-7-26">7.26. backup</a></li>
<li><a href="#sec-7-27">7.27. multiple-cursors</a></li>
<li><a href="#sec-7-28">7.28. dired</a></li>
<li><a href="#sec-7-29">7.29. windows-commands</a></li>
<li><a href="#sec-7-30">7.30. winring</a></li>
<li><a href="#sec-7-31">7.31. display-buffer</a></li>
<li><a href="#sec-7-32">7.32. buffers-commands</a></li>
<li><a href="#sec-7-33">7.33. files-commands</a></li>
<li><a href="#sec-7-34">7.34. vc</a></li>
<li><a href="#sec-7-35">7.35. isearch</a></li>
<li><a href="#sec-7-36">7.36. revert</a></li>
<li><a href="#sec-7-37">7.37. terminal</a></li>
<li><a href="#sec-7-38">7.38. helm</a></li>
<li><a href="#sec-7-39">7.39. compile-and-run</a></li>
<li><a href="#sec-7-40">7.40. editing</a></li>
<li><a href="#sec-7-41">7.41. kill-ring</a></li>
<li><a href="#sec-7-42">7.42. recentf</a></li>
<li><a href="#sec-7-43">7.43. desktop</a></li>
<li><a href="#sec-7-44">7.44. mark</a></li>
<li><a href="#sec-7-45">7.45. whitespace</a></li>
<li><a href="#sec-7-46">7.46. bookmark</a></li>
<li><a href="#sec-7-47">7.47. spell</a></li>
<li><a href="#sec-7-48">7.48. tab-fix</a></li>
<li><a href="#sec-7-49">7.49. yasnippet</a></li>
<li><a href="#sec-7-50">7.50. auto-complete</a></li>
<li><a href="#sec-7-51">7.51. prog-mode-generic</a></li>
<li><a href="#sec-7-52">7.52. auto-insert</a></li>
<li><a href="#sec-7-53">7.53. ediff-mode</a></li>
<li><a href="#sec-7-54">7.54. ediff-winring</a></li>
<li><a href="#sec-7-55">7.55. time-stamp</a></li>
<li><a href="#sec-7-56">7.56. highlight</a></li>
<li><a href="#sec-7-57">7.57. hippie-expand</a></li>
<li><a href="#sec-7-58">7.58. abbrev</a></li>
<li><a href="#sec-7-59">7.59. search-files</a></li>
<li><a href="#sec-7-60">7.60. alternative-files</a></li>
<li><a href="#sec-7-61">7.61. ibuffer-mode</a></li>
<li><a href="#sec-7-62">7.62. deft</a></li>
<li><a href="#sec-7-63">7.63. mail</a></li>
<li><a href="#sec-7-64">7.64. html-template-modes</a></li>
<li><a href="#sec-7-65">7.65. css</a></li>
<li><a href="#sec-7-66">7.66. yaml-mode</a></li>
<li><a href="#sec-7-67">7.67. rainbow-mode</a></li>
<li><a href="#sec-7-68">7.68. markdown-mode</a></li>
<li><a href="#sec-7-69">7.69. lisp-mode</a></li>
<li><a href="#sec-7-70">7.70. ruby-mode</a></li>
<li><a href="#sec-7-71">7.71. rails</a></li>
<li><a href="#sec-7-72">7.72. rspec-mode</a></li>
<li><a href="#sec-7-73">7.73. mmm-mode</a></li>
<li><a href="#sec-7-74">7.74. flycheck</a></li>
<li><a href="#sec-7-75">7.75. tmux-send</a></li>
<li><a href="#sec-7-76">7.76. speedbar</a></li>
<li><a href="#sec-7-77">7.77. clean-buffer</a></li>
<li><a href="#sec-7-78">7.78. uniquify-buffer</a></li>
<li><a href="#sec-7-79">7.79. diminish</a></li>
<li><a href="#sec-7-80">7.80. dtrt-indent</a></li>
<li><a href="#sec-7-81">7.81. undo-tree</a></li>
<li><a href="#sec-7-82">7.82. js-mode</a></li>
<li><a href="#sec-7-83">7.83. coffee-mode</a></li>
<li><a href="#sec-7-84">7.84. c-mode</a></li>
<li><a href="#sec-7-85">7.85. win-move-resize</a></li>
<li><a href="#sec-7-86">7.86. scala-mode</a></li>
<li><a href="#sec-7-87">7.87. visual-regexp</a></li>
<li><a href="#sec-7-88">7.88. eclim</a></li>
<li><a href="#sec-7-89">7.89. ensime</a></li>
<li><a href="#sec-7-90">7.90. ess</a></li>
<li><a href="#sec-7-91">7.91. ianyme</a></li>
<li><a href="#sec-7-92">7.92. mac</a></li>
<li><a href="#sec-7-93">7.93. cscope</a></li>
<li><a href="#sec-7-94">7.94. folding</a></li>
<li><a href="#sec-7-95">7.95. erlang</a></li>
<li><a href="#sec-7-96">7.96. sgml</a></li>
<li><a href="#sec-7-97">7.97. sh-mode</a></li>
<li><a href="#sec-7-98">7.98. haskell-mode</a></li>
<li><a href="#sec-7-99">7.99. confluence</a></li>
<li><a href="#sec-7-100">7.100. server</a></li>
</ul>
</li>
<li><a href="#sec-8">8. Module Groups</a></li>
<li><a href="#sec-9">9. Backlog</a></li>
</ul>
</div>
</div>
<a name="sec-1"></a>
# Usage

<a name="sec-1-1"></a>
## Quick Start

```
cd ~
git clone git://github.com/doitian/emacs.d.git .emacs.d
cd .emacs.d
make vendor all elpa
emacs --debug-init
```

<a name="sec-1-2"></a>
## Generate init.el

Use `make` or eval following lisp code. Move to the end of the expression, and press <kbd>Ctrl-X Ctrl-E</kbd>.

```
(progn
  (let* ((dir (file-name-directory (buffer-file-name)))
         (site-lisp (concat dir "site-lisp"))
         (outfile (concat dir "init.el"))
         (generated-autoload-file (concat site-lisp "/my-loaddefs.el"))
         (load-path (cons site-lisp load-path)))
    (update-directory-autoloads site-lisp)
    (org-babel-tangle-file (buffer-file-name) outfile)
    (byte-compile-file outfile)))
```

<a name="sec-1-3"></a>
## vendor and elpa

Some packages are large, and are not stable to install from ELPA. Install them using `make vendor`.

<pre><code>make vendor</code></pre>

Missing elpa packages will be installed when Emacs is started. They also can be pre-installed using `make elpa`:

<pre><code>make elpa</code></pre>

<a name="sec-1-4"></a>
## Modules

Module is defined as function, and is only loaded when:

-   `module-white-list` is empty, or it is in `module-white-list`.

-   and it is not in `module-black-list`.

`module-white-list`, and `module-black-list` also can include group names
defined in `module-group-alist`. If so, the group name is expanded recursively
to all the modules belong to it.

```cl
;; (custom-set-variables
;;   '(module-white-list nil)
;;   '(module-black-list '(delete-keys-hacks)))
```

`module-white-list` and `module-black-list` also can be set through
environment variable `EMACS_MODULE`, which is a comma separated list of module
or group names. Name starting with `!` are added to black list, and others are
added to white list.

Examples:

-   Start emacs without loading any module. Because white list is not empty,
    and there is no module with name "none"
    
    <pre><code>EMACS_MODULE=none emacs</code></pre>

-   Do not load org related modules. `!` must be quoted in SHELL
    
    <pre><code>EMACS_MODULE="!org" emacs</code></pre>

By default all modules are auto loaded unless `module-auto-initialie` is
set to `nil`. Module can be loaded manually using `module-load`. To load a
module in black list or not in white list, clear the lists first using
`module-clear-lists`.

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
(defvar my-extra-dir (expand-file-name "extra/" user-emacs-directory)
  ".emacs.d/extra")
(defvar my-vendor-dir (expand-file-name "vendor/" user-emacs-directory)
  ".emacs.d/vendor")

(setq load-path (cons my-extra-dir load-path))
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


I don't have any settings through customization widgets. Uncomment lines below to load
custom.el if you prefer it.

```cl
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
;; (load custom-file t)
(load my-custom-readonly-file t)
(load my-secrets-file t)
```

<a name="sec-4"></a>
# Theme

```cl
(setq custom-theme-directory (expand-file-name "themes" user-emacs-directory))
(load (concat custom-theme-directory "/zenburn-theme.el"))
(defun init--theme ()
  ;; (load-theme 'zenburn t)
  (set-frame-font my-frame-font)
  (set-fontset-font "fontset-default" 'chinese-gbk my-frame-font-chinese))
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
```

<a name="sec-5"></a>
# My Config

<a name="sec-5-1"></a>
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

 '(tags-add-tables nil)

 '(set-mark-command-repeat-pop t)

 '(max-specpdl-size 2500)
 '(max-lisp-eval-depth 1200))
```

<a name="sec-5-2"></a>
## File system

```cl
(custom-set-variables
 '(delete-by-moving-to-trash t)
 '(tramp-default-method-alist (quote (("\\`localhost\\'" "\\`root\\'" "sudo")))))
```

<a name="sec-5-3"></a>
## Clipboard

```cl
(custom-set-variables
 '(mouse-yank-at-point t)
 '(x-select-enable-clipboard t))
```

<a name="sec-5-4"></a>
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

<a name="sec-5-5"></a>
## Enable Commands

```cl
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
```

<a name="sec-5-6"></a>
## Safe Variables

```cl
(custom-set-variables
 '(safe-local-variable-values '((encoding . utf-8)
                                (outline-minor-mode . t))))
```

<a name="sec-5-7"></a>
## Aliases

```cl
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
(defalias 'vi 'toggle-viper-mode)
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
(unless (package-installed-p 'dash)
  (package-install-file (concat my-site-lisp-dir "dash.el")))

(setq package-archives
      '(("melpa" . "http://melpa.milkbox.net/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")))
```

<a name="sec-7"></a>
# Modules

<a name="sec-7-1"></a>
## powerline

```cl
(define-module powerline
  (require-package 'powerline)
  (powerline-default-theme))
```

<a name="sec-7-2"></a>
## s

```cl
(define-module s
  (require-package 's)
  (require 's nil t))
```

<a name="sec-7-3"></a>
## delete-keys-hacks

Use <kbd>M-r</kbd> to delete word backward, <kbd>C-h</kbd> to delete char backword.

To get help, use <kbd>C-H</kbd> or <kbd>F1</kbd> instead.

This is an opinioned config, disable it by adding it to `module-black-list`.

```cl
(define-module delete-keys-hacks
  "Translate C-h and M-r to delete char and word backward"
  (define-key key-translation-map [?\C-h] [?\C-?])
  (define-key key-translation-map [?\M-r] [?\C-\M-?])
  (global-set-key (kbd "<backspace>") 'backward-delete-char)
  (global-set-key (kbd "M-<backspace>") 'backward-kill-word))
```

<a name="sec-7-4"></a>
## my-basic-keybindings

-   Use <kbd>C-,</kbd> as rectangle commands prefix (<kbd>C-x r</kbd>)

-   Use <kbd>C-'</kbd> and <kbd>M-'</kbd> as negative argument.

```cl
(define-module my-basic-keybindings
  (define-key my-minor-mode-map (kbd "C-,") ctl-x-r-map)
  (define-key my-minor-mode-map (kbd "C-'") 'negative-argument)
  (define-key my-minor-mode-map (kbd "M-'") 'negative-argument)
  (global-set-key (kbd "C-x SPC") 'point-to-register)
  (global-set-key (kbd "C-.") 'repeat)
  (global-set-key (kbd "C-M-j") 'mf-join-following-line)
  (global-set-key (kbd "M-J") 'mf-join-previous-line)
  (setq repeat-on-final-keystroke "z"))
```

<a name="sec-7-5"></a>
## movement-keybindings

```cl
(define-module movement-keybindings
  (global-set-key (kbd "M-g") 'goto-line)
  (define-key my-keymap (kbd "M-g") 'what-line)
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

<a name="sec-7-6"></a>
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

  (global-set-key (kbd "M-m") 'iy-go-up-to-char)
  (global-set-key (kbd "M-M") 'iy-go-up-to-char-backward)
  (define-key my-keymap (kbd "z") 'iy-go-to-char)
  (define-key my-keymap (kbd "Z") 'iy-go-to-char-backward)
  (define-key my-keymap (kbd ";") 'iy-go-to-or-up-to-continue)
  (define-key my-keymap (kbd ":") 'iy-go-to-or-up-to-continue-backward)

  (global-set-key (kbd "C-z") 'zap-up-to-char)
  (global-set-key (kbd "C-S-z") 'zap-back-up-to-char)
  (global-set-key (kbd "C-Z") 'zap-back-up-to-char)

  (global-set-key (kbd "M-Z") 'zap-back-up-to-char)

  (define-key my-keymap "d" 'zap-up-to-char)
  (define-key my-keymap "D" 'zap-back-up-to-char)

  (global-set-key "\C-a" 'back-to-indentation-or-beginning))
```

<a name="sec-7-7"></a>
## ace-jump

```cl
(define-module ace-jump
  (require-package 'ace-jump-mode)
  (define-key my-keymap "g" 'ace-jump-line-mode)
  (define-key my-keymap (kbd "M-m") 'ace-jump-mode))
```

<a name="sec-7-8"></a>
## projectile

```cl
(define-module projectile
  (require-package 'projectile)
  (custom-set-variables
   '(projectile-enable-caching t)
   '(projectile-keymap-prefix (kbd "M-s p")))
  (setq projectile-mode-line-lighter " ")

  (defun projectile+-open-project (&optional force)
    (interactive "P")
    (let ((current-prefix-arg (if force 8 4)))
      (call-interactively 'magit-status)))

  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "M-s p a") 'projectile-ag)
  (define-key projectile-mode-map (kbd "M-s p A") 'projectile-ack)
  (define-key projectile-mode-map (kbd "M-s p x") 'projectile-test-project)
  (define-key projectile-mode-map (kbd "M-s p p") 'projectile-switch-project)
  (define-key projectile-mode-map (kbd "M-s p P") 'projectile+-open-project)
  (define-key projectile-mode-map (kbd "M-s p s") nil))
```

<a name="sec-7-9"></a>
## ido

```cl
(define-module ido
  (ido-mode +1)
  (ido-load-history)

  (define-key ido-file-completion-map [(meta ?l)] nil)
  (custom-set-variables
   '(ido-save-directory-list-file
     (expand-file-name ".ido.last" user-emacs-directory))))
```

<a name="sec-7-10"></a>
## ido-plus

```cl
(define-module ido-plus
  "Enable ido globally, and use it everywhere"

  (require-module ido)

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

  (add-hook 'ido-setup-hook 'init--ido-setup))
```

<a name="sec-7-11"></a>
## ido-vertical-mode

```cl
(define-module ido-vertical-mode
  (require-module ido)
  (require-package 'ido-vertical-mode)
  (ido-vertical-mode +1))
```

<a name="sec-7-12"></a>
## magit

```cl
(define-module magit
  "Git GUI for Emacs"

  (custom-set-variables
   '(magit-process-popup-time 60)
   '(magit-repo-dirs (list my-codebase-dir))
   '(magit-repo-dirs-depth 1))

  (require-package 'magit)
  (global-magit-wip-save-mode +1)

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

  (global-set-key [f12] 'magit-status))
```

<a name="sec-7-13"></a>
## org-basic

Install latest org by running `make org`. Othewise system bundled version is used.

```cl
(define-module org-basic
  "Basic orgmode setup"

  (setq org-modules '(org-bibtex org-bookmark org-expiry org-habit org-id org-info
                                 org-inlinetask org-man org-w3m org-clock org-timer
                                 org-protocol org-drill org-mu4e))
  (when (eq system-type 'darwin)
    (setq org-modules (append org-modules '(org-mac-link-grabber))))

  (custom-set-variables
   '(org-modules org-modules)
   '(org-global-properties '(("STYLE_ALL" . "habit")))
   '(org-read-date-prefer-future 'time)
   '(org-completion-use-ido t)
   '(org-refile-targets '((org-agenda-files :maxlevel . 3)
                          (nil :maxlevel . 3)))
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
   '(org-fontify-done-headline t)
   '(org-src-window-setup 'current-window))

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
    (when (or t (fboundp 'set-face-attribute))
      ;; Make sure that a fixed-width face is used when we have a column table.
      (set-face-attribute 'org-column nil
                          :height (face-attribute 'default :height)
                          :family (face-attribute 'default :family))))

  (defun init--org-call-process-open (path)
    "Open PATH using system open command."
    (call-process "open" nil nil nil path))

  (defun init--org-load ()
    (wl-org-column-view-uses-fixed-width-face)
    (org-add-link-type "open" 'init--org-call-process-open)
    (remove-hook 'org-mode-hook 'init--org-load))
  (add-hook 'org-mode-hook 'init--org-load)

  (defun init--org-mode ()
    (when (daemonp)
      (wl-org-column-view-uses-fixed-width-face))

    (define-key org-mode-map (kbd "C-,") nil)
    (define-key org-mode-map (kbd "C-c ,") 'org-cycle-agenda-files))

  (add-hook 'org-mode-hook 'init--org-mode)

  (autoload 'org-footnote-action "org-footnote" nil t)

  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c L") 'org-insert-link-global)
  (global-set-key (kbd "C-c o") 'org-open-at-point-global)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c t") 'org-footnote-action)
  (define-key my-keymap (kbd "r") 'org-capture)
  (define-key my-keymap (kbd "M-r") 'org-capture)
  (define-key my-keymap (kbd "<return>") 'org-clock-goto))
```

<a name="sec-7-14"></a>
## org-files

Store org agenda files in dropbox directory

```cl
(define-module org-files
  (require-module org-basic)
  (make-directory (concat my-dropbox-dir "g/org/projects") t)
  (setq org-directory (concat my-dropbox-dir "g/org"))
  (setq org-agenda-files
        (mapcar
         (lambda (e)
           (concat my-dropbox-dir "g/org/" e))
         (list "inbox.org" "personal.org" "someday.org" "habit.org" "journal.org" "projects")))
  (setq org-mobile-directory (concat my-dropbox-dir "MobileOrg"))
  (setq org-default-notes-file (concat org-directory "/inbox.org"))
  (setq org-mobile-inbox-for-pull (concat my-dropbox-dir "g/org/from_mobile.org"))

  (defun org ()
    (interactive)
    (ido-find-file-in-dir org-directory))
  (defun dired-g (&rest arguments)
    (interactive)
    (dired (concat my-dropbox-dir "g")))
  (defun orgb ()
    (interactive)
    (ido-find-file-in-dir org-directory)))
```

<a name="sec-7-15"></a>
## org-capture

Capture template

```cl
(define-module org-capture
  (require-module org-basic)

  ;; Sparrow does not support getting current selected mail through Apple
  ;; Script, but the message can be dragged. If the dragging message is
  ;; dropped as text, the text contains subject and the URL to the message. So
  ;; add around advice on ns-insert-text to monitor any Sparrow drop.
  (defadvice ns-insert-text (around monitor-sparrow-drop activate)
    (if (string-match "\\(.*\\) (\\(x-sparrow:.*\\))$" ns-input-text)
        (let* ((subject (match-string 1 ns-input-text))
               (link (match-string 2 ns-input-text))
               (orglink (org-make-link-string link subject))
               (org-capture-link-is-already-stored t))
          (org-store-link-props :type "open"
                                :link link
                                :description (concat subject " :@message:")
                                :annotation orglink
                                :initial ""
                                :query "")
          (funcall 'org-capture nil "b"))
      ad-do-it))

  (defun ns-insert-text ()
    "Insert contents of `ns-input-text' at point."
    (interactive)
    (insert ns-input-text)
    (setq ns-input-text nil))

  (custom-set-variables
   '(org-protocol-protocol-alist '(("edit-link" :protocol "edit-link" :function org-edit-url)))
   '(org-capture-templates
     '(("r" "Notes" entry (file+headline (concat org-directory "/inbox.org") "Notes")
        "* %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  %a\n%i"
        :prepend t)
       ("t" "TODO" entry (file+headline (concat org-directory "/inbox.org") "Tasks")
        "* TODO %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  %a\n%i")
       ("j" "Journal" plain (file+datetree (concat org-directory "/journal.org"))
        "\n%?\n" :empty-lines 1)
       ("d" "Dump" plain (file+olp (concat org-directory "/inbox.org") "Quick Notes" "Plain")
        "\n--%U--------------------------------------------------\n%?\n" :empty-lines 1)
       ("l" "List" item (file+olp (concat org-directory "/inbox.org") "Quick Notes" "List") "%?\n" :empty-lines 1)
       ("s" "SOMEDAY" entry (file+headline (concat org-directory "/inbox.org") "Someday")
        "* SOMEDAY %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  %a\n%i")
       ("x" "Clipboard" entry (file+headline (concat org-directory "/inbox.org") "Notes")
        "* %?\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n  %x"
        :prepend t :empty-lines 1)

       ("b" "Default template" entry (file+headline (concat org-directory "/inbox.org") "Tasks")
        "* TODO %:description\n  :PROPERTIES:\n  :CREATED: %U\n  :END:\n%a"
        :prepend t :empty-lines 1 :immediate-finish t)))))
```

<a name="sec-7-16"></a>
## org-clock

```cl
(define-module org-clock
  (require-module org-basic)

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

<a name="sec-7-17"></a>
## org-gtd

Opinioned GTD config based on org

```cl
(define-module org-gtd
  (require-module org-basic)

  (custom-set-variables
   '(org-extend-today-until 2)
   '(org-agenda-time-grid
     '((daily today require-timed remove-match)
       "----------------"
       (700 800 900 1000 1100 1400 1500 1600 2000 2200)))
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
                     ("@phone" . ?o)
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
     "%42ITEM %TODO %3Effort(E){:} %3CLOCKSUM(R) %SCHEDULED")))
```

<a name="sec-7-18"></a>
## org-agenda

```cl
(define-module org-agenda
  (require-module org-basic)
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
            (tags-todo "@reading/GOING|PAUSE|TODO")
            (tags-todo "-@home-@errands-@computer-@phone-@message-@reading/GOING|PAUSE|TODO")))
          ("T" "TODO List"
           ((todo "GOING|PAUSE|TODO"))
           ((org-agenda-todo-ignore-with-date nil)))
          ("D" "DONE List"
           ((todo "DONE|CANCELED"))
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

          ("g" "open dropbox/g" dired-g))))

```

<a name="sec-7-19"></a>
## org-export

```cl
(define-module org-export
  (require-module org-basic)

  (custom-set-variables
   '(org-latex-listings t)
   '(org-latex-packages-alist nil)
   '(org-latex-minted-options '(("linenos") ("framesep=2mm")))
   '(org-latex-pdf-process '("xelatex -interaction nonstopmode -shell-escape -output-directory %o %f"
                             "xelatex -interaction nonstopmode -shell-escape -output-directory %o %f"))
   '(org-export-backends '(md html icalendar latex beamer freemind confluence))
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

  (defvar org-md-fanced-code-block-language-alist nil)
  (setq org-md-fanced-code-block-language-alist
        '(("emacs-lisp" . "cl")))

  (defadvice org-md-example-block (around fenced-code-block (example-block contents info) activate)
    (let ((lang (or (org-element-property :language example-block) "")))
      (setq ad-return-value
            (concat "```" (or (assoc-default lang org-md-fanced-code-block-language-alist) lang) "\n"
                    (org-remove-indentation (org-element-property :value example-block))
                    "```\n"))))

  (add-hook 'org-export-before-parsing-hook 'iy-org-ical-verify))
```

<a name="sec-7-20"></a>
## org-speed

```cl
(define-module org-speed
  (require-module org-basic)

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

<a name="sec-7-21"></a>
## org-pomodoro

```cl
(define-module org-pomodoro
  (require-module org-basic)

  (define-key my-keymap (kbd "'") 'org-pomodoro-record-interuptions)
  (add-hook 'org-load-hook 'org-pomodoro-on-org-load)
  (add-hook 'org-agenda-mode-hook 'org-pomodoro-on-org-agenda-load))
```

<a name="sec-7-22"></a>
## org-appt

```cl
(define-module org-appt
  (require-module org-basic)

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

<a name="sec-7-23"></a>
## org-babel

Autoload babel languages.

```cl
(define-module org-babel
  (require-module org-basic)

  (mapc
   (lambda (lang)
     (autoload
       (intern (concat "org-babel-execute:" lang))
       (concat "ob-" lang)
       (format "Execute %s src block" lang)))
   '("ruby" "sh" "awk" "R" "ditaa" "dot")))
```

<a name="sec-7-24"></a>
## org-drill

```cl
(define-module org-drill
  (require-module org-basic)

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

<a name="sec-7-25"></a>
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
  (define-key isearch-mode-map (kbd "M-u") 'case-dwim-isearch-underscore)


  (defadvice helm-unmark-all (around helm-unmark-all-or-underscore () activate)
    (if (zerop (with-helm-window (length helm-marked-candidates)))
        (call-interactively 'case-dwim-underscore)
      ad-do-it)))
```

<a name="sec-7-26"></a>
## backup

See commands in `site-lisp/pick-backup.el` to diff or restore a backup.

```cl
(define-module backup
  ;; Place all backup files into this directory
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

<a name="sec-7-27"></a>
## multiple-cursors

```cl
(define-module multiple-cursors
  (require-package 'multiple-cursors)
  (setq mc/cursor-specific-vars
        '(iy-go-to-char-start-pos autopair-action autopair-wrap-action transient-mark-mode er/history))

  (defadvice set-rectangular-region-anchor (around edit-lines-when-region-is-active activate)
    (if (region-active-p)
        (call-interactively 'mc/edit-lines)
      ad-do-it))

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
  (define-key ctl-x-r-map (kbd "#") 'mc/insert-numbers)

  (global-unset-key (kbd "C-<down-mouse-1>"))
  (global-set-key (kbd "C-<mouse-1>") 'mc/add-cursor-on-click)

  (global-set-key (kbd "C-3") 'mc/mark-all-like-this)
  (define-key ctl-x-r-map [return] 'set-rectangular-region-anchor))
```

<a name="sec-7-28"></a>
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
  (global-set-key (kbd "C-x M-j") (lambda () (interactive)
                                    (call-process "open" nil nil nil default-directory)))
  (add-hook 'dired-load-hook 'init--dired-load)
  (add-hook 'dired-mode-hook 'init--dired-mode)
  )
```

<a name="sec-7-29"></a>
## windows-commands

```cl
(define-module windows-commands
  (defvar init--windows-keymap (make-sparse-keymap))
  (define-key my-minor-mode-map (kbd "M-o") 'other-window)
  (define-key my-minor-mode-map (kbd "M-O") 'other-frame)

  (winner-mode 1)
  (define-key winner-mode-map [(control c)] nil)

  (defvar init--winner-undo-redo-map
    (let ((map (make-sparse-keymap)))
      (define-key map "," 'winner-undo)
      (define-key map "." 'winner-redo)
      map))

  (defun display-compilation-buffer ()
    (interactive)
    (let ((buffer next-error-last-buffer)
          list)
      (unless (buffer-live-p next-error-last-buffer)
        (setq list (buffer-list))
        (while (and list (not (buffer-live-p next-error-last-buffer)))
          (with-current-buffer (car list)
            (and (or (and (boundp 'compilation-shell-minor-mode) compilation-shell-minor-mode)
                     (derived-mode-p 'compilation-mode))
                 (setq next-error-last-buffer (car list))))
          (setq list (cdr list))))
      (if (buffer-live-p next-error-last-buffer)
          (select-window
           (display-buffer next-error-last-buffer))
        (message "No compilation buffers"))))

  (temporary-mode-define-keys init--windows-keymap 'init--winner-undo-redo)
  (define-key init--windows-keymap (kbd "s") 'split-window-below)
  (define-key init--windows-keymap (kbd "d") 'mf-indirect-region-or-buffer)
  (define-key init--windows-keymap (kbd "v") 'split-window-right)
  (define-key init--windows-keymap (kbd "c") 'delete-window)
  (define-key init--windows-keymap (kbd "o") 'delete-other-windows)
  (define-key init--windows-keymap (kbd "x") 'mf-kill-buffer-and-window)
  (define-key init--windows-keymap (kbd "SPC") 'display-compilation-buffer)

  (define-key my-keymap "w" init--windows-keymap))
```

<a name="sec-7-30"></a>
## winring

```cl
(define-module winring
  (require-module windows-commands)
  (custom-set-variables
   '(winring-show-names t))

  (require 'winring)
  (defun winring-create-frame-hook (frame)
    (winring-set-name "W" frame))

  (defun winring-jump-or-create (&optional name)
    "Jump to or create configuration by name"
    (interactive)
    (let* ((ring (winring-get-ring))
           (n (1- (ring-length ring)))
           (current (winring-name-of-current))
           (lst (list (cons current -1)))
           (def (if (>= n 0) (winring-name-of (ring-ref ring 0)) current))
           index item)
      (while (<= 0 n)
        (push (cons (winring-name-of (ring-ref ring n)) n) lst)
        (setq n (1- n)))
      (setq name
            (or name
                (ido-completing-read
                 (format "Window configuration name (%s): " current)
                 (mapcar 'car lst) nil 'confirm nil 'winring-name-history def)))
      (setq index (cdr (assoc name lst)))
      (if (eq nil index)
          (progn
            (winring-save-current-configuration)
            (delete-other-windows)
            (switch-to-buffer winring-new-config-buffer-name)
            (winring-set-name name))
        (when (<= 0 index)
          (setq item (ring-remove ring index))
          (winring-save-current-configuration)
          (winring-restore-configuration item)))))

  (winring-initialize)

  (define-key init--windows-keymap "2" 'winring-duplicate-configuration)
  (define-key init--windows-keymap "0" 'winring-delete-configuration)
  (define-key init--windows-keymap "r" 'winring-rename-configuration)
  (define-key init--windows-keymap "w" 'winring-jump-or-create)
  (define-key init--windows-keymap "n" 'winring-next-configuration)
  (define-key init--windows-keymap "p" 'winring-prev-configuration)
  (define-key init--windows-keymap (kbd "C-n") 'winring-prev-configuration)
  (define-key init--windows-keymap (kbd "C-p") 'winring-prev-configuration))
```

<a name="sec-7-31"></a>
## display-buffer

```cl
(define-module display-buffer
  ;; Manage display-buffer-alist

  (defun init--windata-display-buffer (buffer alist)
    (let (win buf newwin)
      (setq win (selected-window))
      (setq buf (get-buffer buffer))
      (or (get-buffer-window buf)
          (with-current-buffer (window-buffer win)
            (setq newwin
                  (windata-display-buffer
                   buf
                   (assoc-default 'frame-p alist nil nil)
                   (assoc-default 'dir alist nil nil)
                   (assoc-default 'size alist nil 0.5)
                   (assoc-default 'delete-p alist nil nil)))
            ;; let quit-window delete the window
            (set-window-parameter newwin 'quit-restore
                                  (list 'window 'window
                                        win buf))
            (set-window-prev-buffers newwin nil)
            newwin))))

  (defun init--display-buffer-compilation-p (buffer alist)
    (with-current-buffer (get-buffer buffer)
      (or (derived-mode-p 'compilation-mode)
          (and (boundp 'compilation-shell-minor-mode) compilation-shell-minor-mode))))

  (custom-set-variables
   '(display-buffer-alist
     '((init--display-buffer-compilation-p
        init--windata-display-buffer
        (dir . bottom)
        (size . 0.3)
        (frame-p . t)))))

  (defun init--display-dired ()
    (interactive)
    (let ((first-window (car (window-list))))
      (if (and
           (cdr (window-list))
           (with-current-buffer (window-buffer first-window)
             (eq major-mode 'dired-mode)))
          (delete-window first-window)
        (select-window
         (init--windata-display-buffer
          (dired-noselect default-directory)
          '((dir . left)
            (size . 0.3)
            (frame-p . t)))))))

  (define-key my-keymap (kbd "n") 'init--display-dired))
```

<a name="sec-7-32"></a>
## buffers-commands

```cl
(define-module buffers-commands
  (global-set-key (kbd "C-M-l") 'mf-switch-to-previous-buffer)
  (global-set-key (kbd "C-<next>") 'next-buffer)
  (global-set-key (kbd "C-<prior>") 'previous-buffer)
  (global-set-key (kbd "C-x K") 'mf-kill-buffer-and-window)
  )
```

<a name="sec-7-33"></a>
## files-commands

```cl
(define-module files-commands
  (global-set-key (kbd "C-x C-r") 'mf-rename-current-buffer-file)
  (global-set-key (kbd "C-x M-f") 'mf-find-alternative-file-with-sudo)
  (when (locate-file "gpicker" exec-path)
    (define-key my-keymap "g" 'gpicker-find-file)
    (define-key my-keymap (kbd "M-g") 'gpicker-find-file)))
```

<a name="sec-7-34"></a>
## vc

Version Control backends.

`git-emacs` can be install using `make vendor` or `make git-emacs`. See list
of commands using <kbd>C-x g C-h</kbd>. My favrite one is <kbd>C-x g i</kbd>,
add changes interactively using `ediff`.

```cl
(define-module vc
  (require-package 'git-messenger)
  (require-package 'git-gutter+)

  (custom-set-variables
   '(git-state-modeline-decoration (quote git-state-decoration-large-dot))
   '(vc-follow-symlinks t))

  (mapc (lambda (pattern)
          (unless (member pattern revert-without-query)
            (setq revert-without-query (cons pattern revert-without-query))))
        '("COMMIT_EDITMSG\\'" "MERGE_MSG\\'" "git-rebase-todo"))

  (let ((git-emacs-dir (concat my-vendor-dir "git-emacs")))
    (when (file-exists-p (concat git-emacs-dir "/git-emacs.el"))
      (setq load-path (cons git-emacs-dir load-path))
      (require 'git-emacs)))

  (add-to-list 'auto-mode-alist '("\\.gitconfig\\'" . conf-mode))
  (add-to-list 'auto-mode-alist '("\\.git/config\\'" . conf-mode))

  (global-set-key (kbd "C-<f12>") 'git-status)
  (global-set-key (kbd "<ESC> <f12>") 'git-status)

  (global-set-key (kbd "C-x v w") 'git-messenger:popup-message)
  (global-set-key (kbd "C-x v SPC") 'git-gutter+-mode)
  (global-set-key (kbd "C-x v n") 'git-gutter+-next-hunk)
  (global-set-key (kbd "C-x v p") 'git-gutter+-previous-hunk)
  (global-set-key (kbd "C-x v .") 'git-gutter+-popup-hunk)
  (global-set-key (kbd "C-x v ,") 'git-gutter+-revert-hunk)
  (global-set-key (kbd "C-x v j") 'git-gutter+-stage-hunks)
  (global-set-key (kbd "C-x v k") 'git-gutter+-commit)
  (global-set-key (kbd "C-x v K") 'git-gutter+-commit)

  )
```

<a name="sec-7-35"></a>
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

<a name="sec-7-36"></a>
## revert

Auto revert, and helper functions to revert without confirmation.

```cl
(define-module revert
  (defun revert-buffer-no-confirm ()
    "Revert buffer without confirmation."
    (interactive) (flet ((yes-or-no-p (prompt) t)) (revert-buffer)))

  ;; Auto refresh buffers
  (global-auto-revert-mode +1)

  ;; Also auto refresh dired, but be quiet about it
  (setq global-auto-revert-non-file-buffers t)
  (setq auto-revert-verbose nil))
```

<a name="sec-7-37"></a>
## terminal

```cl
(define-module terminal
  (autoload 'term-check-proc "term")

  (defun terminal-eshell-named (&optional name)
    "Get or create eshell buffer with specified name"
    (let ((eshell-buffer-name (or name eshell-buffer-name)))
      (save-window-excursion (eshell))))

  (defun terminal-term-named (&optional name)
    "Get or create term buffer with specified name"
    (let ((buffer (get-buffer-create (or name "*term*"))))
      (when (not (term-check-proc buffer))
        (with-current-buffer buffer
          (term-mode)
          (term-exec buffer (or name "*term*") (getenv "SHELL") nil nil)
          (term-char-mode)
          (goto-char (point-max))))
      buffer))

  (defvar terminal--kind-alist
    '((eshell terminal-eshell-named eshell-send-input)
      (term terminal-term-named term-send-input)))

  (defun terminal--toggle (kind name)
    "Toggle terminal buffer with the name.
hide -> show -> full screen -> hide
inactive -> switch -> full screen -> hide
"
    (let* ((kind-info (assoc-default kind terminal--kind-alist))
           (buffer (funcall (car kind-info) name)))
      (if (eq (current-buffer) buffer)
          (if (eq (length (window-list)) 1)
              ;; full screen
              (switch-to-buffer (other-buffer))
            ;; active, go to full screen
            (delete-other-windows))
        ;; activate the buffer
        (switch-to-buffer-other-window buffer))))

  (defun terminal--here (kind name)
    "Get or create in current directory."
    (let* ((dir default-directory)
           (kind-info (assoc-default kind terminal--kind-alist))
           (buffer (funcall (car kind-info) name)))
      (unless (eq (current-buffer) buffer)
        (switch-to-buffer-other-window buffer)
        (goto-char (point-max))
        (insert (format "cd '%s'" dir))
        (funcall (cadr kind-info)))))

  (defun eshell-toggle (&optional name)
    (interactive)
    (terminal--toggle 'eshell name))

  (defun eshell-here (&optional name)
    (interactive)
    (terminal--here 'eshell name))

  (defun term-toggle (&optional name)
    (interactive)
    (terminal--toggle 'term name))

  (defun term-here (&optional name)
    (interactive)
    (terminal--here 'term name))

  (defun init--term-exec ()
    "Close buffer when terminal exists."
    (let* ((buff (current-buffer))
           (proc (get-buffer-process buff)))
      (lexical-let ((buff buff))
        (set-process-sentinel proc (lambda (process event)
                                     (if (string= event "finished\n")
                                         (kill-buffer buff)))))))

  ;; Advice `dired-run-shell-command' with asynchronously.
  (defadvice dired-run-shell-command (around dired-run-shell-command-async activate)
    "Postfix COMMAND argument of `dired-run-shell-command' with an ampersand.
If there is none yet, so that it is run asynchronously."
    (let* ((cmd (ad-get-arg 0))
           (cmd-length (length cmd))
           (last-cmd-char (substring cmd
                                     (max 0 (- cmd-length 1))
                                     cmd-length)))
      (unless (string= last-cmd-char "&")
        (ad-set-arg 0 (concat cmd "&")))
      (save-window-excursion ad-do-it)))

  (defun init--term-mode ()
    (when (fboundp 'yas-minor-mode)
      (yas-minor-mode -1)))

  (add-hook 'term-exec-hook 'init--term-exec)
  (add-hook 'term-mode-hook 'init--term-mode)

  (define-key my-keymap (kbd "t") 'term-toggle)
  (define-key my-keymap (kbd "T") 'term-here)
  (define-key my-keymap (kbd "e") 'eshell-toggle)
  (define-key my-keymap (kbd "E") 'eshell-here))
```

<a name="sec-7-38"></a>
## helm

```cl
(define-module helm
  (require-module alternative-files)
  (require-module projectile)
  (require-package 'helm)
  (require-package 'helm-projectile)
  (require 'helm-config)

  (defvar helm-source-alternative-files nil)

  (defvar helm--project-root nil)

  (setq helm-source-alternative-files
        '((name . "Alternative Files")
          (init . (lambda () (setq helm--project-root (with-helm-current-buffer (projectile-project-p)))))
          (candidates . (lambda ()
                          (with-helm-current-buffer (alternative-files-existing))))
          (real-to-display . (lambda (e)
                               (with-helm-current-buffer
                                 (file-relative-name e helm--project-root))))
          (type . file)))

  (custom-set-variables
   '(helm-command-prefix-key "M-S")
   '(helm-input-idle-delay 0)
   '(helm-idle-delay 0.3)
   '(helm-quick-update t)
   '(helm-c-use-standard-keys t)
   '(helm-quick-update nil)
   '(helm-enable-shortcuts 'prefix))

  (defun init--helm-load ()
    (require 'helm-mode)
    (require 'helm-config)
    (require 'helm-match-plugin)
    (require 'helm-buffers)
    (require 'helm-files)
    (require 'helm-locate)
    (require 'helm-w3m)
    (require 'helm-projectile)
    (require 'helm-projectile-files-candidates-in-buffer)
    (define-key projectile-mode-map (kbd "C-c p h") nil)
    (define-key projectile-mode-map (kbd "M-s p h") 'helm-projectile)

    (remove-hook 'helm-before-initialize-hook 'init--helm-load))

  (add-hook 'helm-before-initialize-hook 'init--helm-load)

  ;;; Sources
  (defvar my-helm-sources nil)
  (setq my-helm-sources
        '(
          helm-source-alternative-files
          helm-source-projectile-files-candidates-in-buffer-files-list
          helm-source-files-in-current-dir
          helm-source-buffers-list
          helm-source-file-cache
          helm-source-recentf
          helm-source-file-name-history
          helm-source-bookmarks))

  (defun my-helm-go ()
    "Preconfigured `helm' to fidn fiels"
    (interactive)
    (helm-other-buffer my-helm-sources "*helm go*"))

  (autoload 'helm-command-prefix "helm-config" nil nil 'keymap)

  (define-key helm-command-map (kbd "g") 'helm-do-grep)
  (define-key helm-command-map (kbd "o") 'helm-occur)
  (define-key helm-command-map (kbd "r") 'helm-register)
  (define-key helm-command-map (kbd "R") 'helm-regexp)
  (define-key helm-command-map (kbd "b") 'helm-c-pp-bookmarks)
  (define-key helm-command-map (kbd "<SPC>") 'helm-all-mark-rings)

  (global-set-key (kbd "M-X") 'my-helm-go)
  (define-key my-keymap (kbd "M-s") 'my-helm-go)
  (define-key my-keymap (kbd "s") 'helm-command-prefix)

  ;; 1. Quote the string
  ;; 2. If we didn't input any typically regexp characters, convert spaces to .*,
  ;;    however, it is still order related.
  (defun helm-pattern-to-regexp (string)
    (if (string-match-p "^locate" helm-locate-command)
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
               (mapconcat 'regexp-quote parts ".*")))))
      string))

  ;; Hack
  ;; Convert helm pattern to regexp for locate
  (defadvice helm-locate-init (around helm-pattern-to-regexp () activate)
    (let ((helm-pattern (helm-pattern-to-regexp helm-pattern)))
      ad-do-it))
  )
```

<a name="sec-7-39"></a>
## compile-and-run

```cl
(define-module compile-and-run
  (require-package 'quickrun)

  (custom-set-variables
   '(compilation-auto-jump-to-first-error nil)
   '(compilation-context-lines 5)
   '(compilation-scroll-output (quote first-error)))

  (defun init--compile-load (&rest ignore)
    (require 'ansi-color)
    (define-key compilation-mode-map "l" 'compilation-restore-mode-line)
    (define-key compilation-mode-map "c" 'compilation-clear-screen)
    (remove-hook 'compilation-start-hook 'init--compile-load))
  (add-hook 'compilation-start-hook 'init--compile-load)

  (defun colorize-compilation-buffer ()
    (toggle-read-only)
    (ansi-color-apply-on-region (point-min) (point-max))
    (toggle-read-only))
  (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

  (defcustom compilation-defualt-mode-line-background "#1e2320"
    "Default mode line background"
    :group 'compilation)
  (defcustom compilation-error-mode-line-background "#310602"
    "Error mode line background"
    :group 'compilation)

  (defun compilation-notify-result (buffer message)
    (unless (member major-mode '(ag-mode))
      (setq message (s-trim message))
      (let ((pass (string= message "finished")))
        (notify mode-name message
                :icon (if pass "dialog-ok" "dialog-error"))
        (if pass
            (set-face-attribute 'mode-line nil :background compilation-defualt-mode-line-background)
          (set-face-attribute 'mode-line nil :background compilation-error-mode-line-background)))))

  (defun compilation-restore-mode-line ()
    (interactive)
    (setq compilation-in-progress nil)
    (set-face-attribute 'mode-line nil :background compilation-defualt-mode-line-background))

  (defun compilation-clear-screen ()
    (interactive)
    (toggle-read-only)
    (erase-buffer)
    (toggle-read-only))

  (when (fboundp 'notify)
    (add-hook 'compilation-finish-functions 'compilation-notify-result))

  (defvar run-or-replace-template-history nil "History for `run-or-replace-template'")
  (defun run-or-replace-template-fill (command &optional src)
    (let* ((case-fold-search  nil)
           (path (expand-file-name (or src (buffer-file-name) default-directory)))
           (info `(("%f" . ,(file-name-nondirectory path))
                   ("%F" . ,path)
                   ("%p" . ,path)
                   ("%n" . ,(file-name-sans-extension (file-name-nondirectory path)))
                   ("%d" . ,(file-name-directory path))
                   ("%e" . ,(file-name-extension path))))
           (str command))
      (mapc (lambda (holder)
              (setq str (replace-regexp-in-string (car holder) (cdr holder) str t)))
            info)
      str))

  (defun run-or-replace-template (command &optional remember)
    (interactive (list (if (minibufferp)
                           (buffer-substring (minibuffer-prompt-end) (point-max))
                         (read-from-minibuffer "Shell command: "
                                               (car run-or-replace-template-history) nil nil
                                               '(run-or-replace-template-history . 1)))
                       current-prefix-arg))
    (if (minibufferp)
        (progn
          (delete-minibuffer-contents)
          (goto-char (minibuffer-prompt-end))
          (insert (with-current-buffer (window-buffer (minibuffer-selected-window))
                    (run-or-replace-template-fill command))))
      (setq command (run-or-replace-template-fill command))
      (when remember
        (let ((map (make-sparse-keymap))
              (dir default-directory))
          (define-key map (kbd "r") (eval `(lambda () (interactive)
                                             (let ((default-directory ,dir))
                                               (compile ,command)))))
          (global-set-key (kbd "M-s v") map)))
      (compile command)))

  (defadvice quickrun (around init--quick-run)
    (init--quick-run)
    ad-do-it
    (ad-disable-advice 'quickrun 'around 'init--quick-run)
    (ad-activate 'quickrun))
  (ad-enable-advice 'quickrun 'around 'init--quick-run)
  (ad-activate 'quickrun)

  (defun init--quick-run ()
    (quickrun-add-command
     "objc" '((:command . "gcc")
              (:exec    . ((lambda ()
                             (if (eq system-type 'darwin)
                                 "%c -x objective-c %o -o %e %s -framework foundation"
                               "%c -x objective-c %o -o %e %s `gnustep-config --objc-flags` `gnustep-config --base-libs`"))
                           "%e %a"))
              (:remove  . ("%e"))
              (:description . "Compile Objective-C file with gcc and execute"))
     :override t))

  (defun init--new-scratch (&optional extension)
    "Create a temporary file with given EXTENSION."
    (interactive "sextension: ")
    (find-file-other-window (make-temp-file "scratch-" nil
                                            (concat "." (or extension "txt")))))

  (global-set-key [f5] 'compile)
  (define-key my-keymap (kbd "5") 'compile)
  (define-key my-keymap (kbd "M-c") 'recompile)

  (define-key my-keymap (kbd "c") 'quickrun-compile-only)
  (define-key my-keymap (kbd "x") 'quickrun)
  (define-key my-keymap (kbd "M-x") 'init--new-scratch)
  (global-set-key (kbd "C-1") 'run-or-replace-template)
  (define-key my-keymap (kbd "1") 'run-or-replace-template)
  (global-set-key (kbd "C-`") 'next-error)
  (global-set-key (kbd "C-~") 'previous-error))
```

<a name="sec-7-40"></a>
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
  (global-set-key (kbd "C-M-<return>") 'mf-append-line-delimter-then-next-line-and-open-it-if-not-empty)
  (global-set-key (kbd "C-M-;") 'mf-append-line-delimter-then-next-line-and-open-it-if-not-empty)
  (global-set-key (kbd "s-<return>") 'mf-next-line-and-open-it-if-not-empty)
  (global-set-key (kbd "C-x C-o") 'mf-shrink-whitespaces)
  (global-set-key (kbd "C-8") 'pop-tag-mark))
```

<a name="sec-7-41"></a>
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

<a name="sec-7-42"></a>
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

<a name="sec-7-43"></a>
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

  (defadvice desktop-clear (around init--bookmark-save-around-desktop-clear activate)
    (and (fboundp 'bookmark-save) (bookmark-save))
    ad-do-it
    (and (fboundp 'bookmark-load) (bookmark-load bookmark-default-file)))

  (desktop-save-mode +1)
  (setq history-length 250)
  (add-to-list 'desktop-globals-to-save 'file-name-history)
  (add-to-list 'desktop-globals-to-clear 'bookmark-alist)
  (add-to-list 'desktop-modes-not-to-save 'Info-mode)
  (add-to-list 'desktop-modes-not-to-save 'info-lookup-mode)
  (add-to-list 'desktop-modes-not-to-save 'fundamental-mode))
```

<a name="sec-7-44"></a>
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

<a name="sec-7-45"></a>
## whitespace

```cl
(define-module whitespace
  (custom-set-variables
   '(whitespace-action nil)
   '(whitespace-global-modes nil)
   '(whitespace-line-column nil)
   '(whitespace-style (quote (face tabs trailing newline indentation space-before-tab tab-mark newline-mark)))
   '(coffee-cleanup-whitespace nil)
   '(recentf-save-file (expand-file-name ".recentf" user-emacs-directory)))
  (add-hook 'prog-mode-hook 'whitespace-mode)
  (defun whitespace-cleanup-and-save ()
    (interactive)
    (whitespace-cleanup)
    (call-interactively (key-binding (kbd "C-x C-s"))))
  (define-key my-keymap (kbd "SPC") 'whitespace-cleanup-and-save))
```

<a name="sec-7-46"></a>
## bookmark

```cl
(define-module bookmark
  (custom-set-variables
   '(bookmark-use-annotations nil))

  (global-set-key (kbd "C-x j SPC") 'jump-to-register))
```

<a name="sec-7-47"></a>
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
  (add-hook 'message-mode-hook 'flyspell-mode)
  (add-hook 'org-mode-hook 'flyspell-mode)
  (add-hook 'markdown-mode-hook 'flyspell-mode)

  (global-set-key (kbd "C-4") 'ispell-word))
```

<a name="sec-7-48"></a>
## tab-fix

```cl
(define-module tab-fix
  (defun tab-fix-keymap (map)
    (let ((binding (assoc 'tab map)))
      (when binding
        (setcar binding 9))))

  (defun tab-fix-org-mode ()
    (tab-fix-keymap org-mode-map)
    (remove-hook 'org-mode-hook 'tab-fix-org-mode))
  (add-hook 'org-mode-hook 'tab-fix-org-mode)

  (defun tab-fix-markdown-mode ()
    (tab-fix-keymap markdown-mode-map)
    (remove-hook 'markdown-mode-hook 'tab-fix-org-mode))
  (add-hook 'markdown-mode-hook 'tab-fix-org-mode))
```

<a name="sec-7-49"></a>
## yasnippet

Compile all snippets into `snippets.el` and load it. After change or and any snippets, must

-   execute `yas-reload-all` in Emacs,

-   run `make snippets` in shell

```cl
(define-module yasnippet
  (require-package 'yasnippet)
  (require-package 'popup)
  (require 'popup nil t)
  (when (featurep 'popup)
    (define-key popup-menu-keymap (kbd "M-n") 'popup-next)
    (define-key popup-menu-keymap (kbd "TAB") 'popup-next)
    (define-key popup-menu-keymap (kbd "<tab>") 'popup-next)
    (define-key popup-menu-keymap (kbd "<backtab>") 'popup-previous)
    (define-key popup-menu-keymap (kbd "M-p") 'popup-previous))

  (custom-set-variables
   '(yas-trigger-key "TAB")
   ;; Add yas-expand itself, so when auto-complete completes and retry, yas-expand can work.
   '(yas-expand-only-for-last-commands '(self-insert-command org-self-insert-command yas-expand ac-next ac-previous ac-expand))
   '(yas-choose-keys-first nil)
   '(yas-prompt-functions (quote (yas-popup-isearch-prompt
                                  yas-ido-prompt
                                  yas-x-prompt
                                  yas-no-prompt)))
   '(yas-wrap-around-region nil)
   '(yas-use-menu nil)
   '(yas-triggers-in-field t))

  (defun yas-buffer-name-stub ()
    (let ((name (or (buffer-file-name)
                    (buffer-name))))
      (replace-regexp-in-string
       "^t_\\|_?\\(test\\|spec\\)$" ""
       (file-name-sans-extension (file-name-nondirectory name)))))

  (defun yas-safer-expand ()
    (let ((yas-fallback-behavior 'return-nil))
      (call-interactively 'yas-expand)))

  (defun yas-ido-insert-snippets (&optional no-condition)
    (interactive "P")
    (let ((yas-prompt-functions '(yas-ido-prompt)))
      (yas-insert-snippet)))

  (defvar yas-popup-remember-pattern nil)
  (defadvice popup-isearch-prompt (after remember-pattern (popup pattern) activate)
    (setq yas-popup-remember-pattern pattern))

  (defun yas-popup-isearch-prompt (prompt choices &optional display-fn)
    (when (featurep 'popup)
      (setq yas-popup-remember-pattern nil)
      (or
       (popup-menu*
        (mapcar
         (lambda (choice)
           (popup-make-item
            (or (and display-fn (funcall display-fn choice))
                choice)
            :value choice))
         choices)
        :prompt prompt
        :isearch t
        ) yas-popup-remember-pattern)))

  (defadvice yas--menu-keymap-get-create (around ignore (mode) activate))

  (define-key my-keymap (kbd "<tab>") 'yas-insert-snippet)

  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-/") 'yas-ido-insert-snippets)
    (define-key map (kbd "/") 'yas-ido-insert-snippets)
    (define-key map (kbd "n") 'yas-new-snippet)
    (define-key map (kbd "o") 'yas-visit-snippet-file)
    (define-key map (kbd "i") 'auto-insert)
    (define-key map (kbd "RET") 'zencoding-expand-yas)
    (define-key my-keymap (kbd "M-/") map))

  (setq yas-snippet-dirs (list (expand-file-name "snippets" user-emacs-directory)))
  (yas-global-mode +1)
  (defadvice yas-reload-all (before yas-recompile-all-before-reload activate)
    (yas-recompile-all)))

```

<a name="sec-7-50"></a>
## auto-complete

```cl
(define-module auto-complete
  (require-package 'auto-complete)
  (require-package 'pos-tip)
  (require-module yasnippet)
  (require 'pos-tip)

  (custom-set-variables
   '(ac-use-fuzzy nil)
   '(ac-trigger-key "TAB")
   '(ac-auto-start nil)
   '(ac-use-menu-map t)
   '(ac-auto-show-menu nil)
   '(ac-show-menu nil)
   '(ac-use-quick-help t)
   '(ac-non-trigger-commands nil)
   '(ac-trigger-commands nil)
   '(ac-trigger-commands-on-completing
     '(self-insert-command case-dwim-dash case-dwim-underscore
                           delete-backward-char backward-delete-char
                           backward-delete-char-untabify autopair-backspace
                           paredit-backward-delete paredit-backward-kill-word))
   '(ac-modes nil)
   '(ac-disable-inline t))

  (require 'auto-complete)
  (require 'auto-complete-config)
  (global-auto-complete-mode -1)

  (defun ac-update-greedy-command ()
    (interactive)
    (if (or (eq last-command 'ac-update-greedy-command)
            (eq last-command 'ac-expand)
            (eq last-command 'yas-expand))
        (progn
          (ac-expand)
          (setq this-command 'ac-expand))
      (ac-update-greedy t)))

  (define-key ac-complete-mode-map (kbd "M-SPC") 'ac-complete)
  (define-key ac-complete-mode-map (kbd "M-<tab>") 'ac-complete)
  (define-key ac-complete-mode-map (kbd "C-g") 'ac-stop)
  (define-key ac-complete-mode-map "\t" 'ac-update-greedy-command)
  (define-key ac-complete-mode-map [tab] 'ac-update-greedy-command)

  (add-hook 'prog-mode-hook 'auto-complete-mode)
  (add-hook 'nxml-mode-hook 'auto-complete-mode)

  (setq-default
   ac-sources '(ac-source-yasnippet
                ac-source-abbrev
                ac-source-dictionary
                ac-source-imenu
                ac-source-words-in-buffer
                ac-source-words-in-same-mode-buffers
                ;; ac-source-words-in-all-buffer
                ))

  (defun init--ac-emacs-lisp-mode ()
    (setq ac-sources
          '(
            ac-source-yasnippet
            ac-source-features
            ac-source-functions
            ac-source-variables
            ac-source-symbols
            ac-source-abbrev
            ac-source-dictionary
            ac-source-imenu
            ac-source-words-in-buffer
            ac-source-words-in-same-mode-buffers)))
  (add-hook 'emacs-lisp-mode-hook 'init--ac-emacs-lisp-mode))
```

<a name="sec-7-51"></a>
## prog-mode-generic

```cl
(define-module prog-mode-generic
  (add-hook 'prog-mode-hook 'subword-mode)
  (add-hook 'prog-mode-hook 'electric-pair-mode)

  (defun font-lock-comment-annotations ()
    "Highlight a bunch of well known comment annotations.

This functions should be added to the hooks of major modes for programming."
    (font-lock-add-keywords
     nil '(("\\<\\(FIX\\(ME\\)?\\|TODO\\|OPTIMIZE\\|HACK\\|REFACTOR\\):"
            1 font-lock-warning-face t))))

  (add-hook 'prog-mode-hook 'font-lock-comment-annotations))
```

<a name="sec-7-52"></a>
## auto-insert

```cl
(define-module auto-insert
  (require 'autoinsert)
  (define-key my-keymap (kbd "C-n") 'auto-insert)

  (custom-set-variables
   '(auto-insert-directory (expand-file-name "insert/" user-emacs-directory)))

  (defvar auto-insert-alist-default auto-insert-alist)

  (setq auto-insert-alist
        (append
         '((("\\.erl\\'" . "Erlang Module")
            nil
            "-module("
            (file-name-nondirectory
             (file-name-sans-extension buffer-file-name))
            ")." \n
            "-export([" _ "]).\n"))
         auto-insert-alist-default)))
```

<a name="sec-7-53"></a>
## ediff-mode

```cl
(define-module ediff-mode
  (custom-set-variables
   '(ediff-split-window-function (quote split-window-horizontally)))

  (defun ediff-main ()
    "Show ediff registry"
    (interactive)
    (let ((ediff-window-display-p (lambda () nil)))
      (ediff-show-registry))))
```

<a name="sec-7-54"></a>
## ediff-winring

```cl
(define-module ediff-winring
  (require-module winring)
  (require-module windows-commands)

  (defun init--ediff-before-setup-winring-jump ()
    (winring-jump-or-create "*ediff*"))
  (defun init--ediff-after-setup-save-register ()
    (set-register 'ediff (list (current-window-configuration) (point-marker))))
  (defun init--ediff-quit-winring-delete ()
    (when (string= (winring-name-of-current) "*ediff*")
      (set-register 'ediff nil)
      (let ((prev (ring-remove (winring-get-ring) 0)))
        (winring-restore-configuration prev))))

  (defun winring-toggle-ediff ()
    (interactive)
    (if (string= (winring-name-of-current) "*ediff*")
        (let ((prev (ring-remove (winring-get-ring) 0)))
          (winring-restore-configuration prev))
      (if (get-register 'ediff)
          (progn
           (winring-jump-or-create "*ediff*")
           (jump-to-register 'ediff))
        (error "No active ediff window configuration"))))

  (add-hook 'ediff-before-setup-hook 'init--ediff-before-setup-winring-jump)
  (add-hook 'ediff-after-setup-windows-hook 'init--ediff-after-setup-save-register
            'append)
  (add-hook 'ediff-quit-hook 'init--ediff-quit-winring-delete)

  (define-key init--windows-keymap "e" 'winring-toggle-ediff))
```

<a name="sec-7-55"></a>
## time-stamp

```cl
(define-module time-stamp
  (add-hook 'before-save-hook 'time-stamp)
  (setq time-stamp-active t
        time-stamp-format "%:y-%02m-%02d %02H:%02M:%02S"
        time-stamp-start "[Uu]pdated\\(_at\\)?[ \t]*:?[ \t]+<"
        time-stamp-end ">"))
```

<a name="sec-7-56"></a>
## highlight

```cl
(define-module highlight
  (require-package 'highlight-symbol)
  (require-package 'highlight-parentheses)
  (require-package 'highlight-indentation)

  (custom-set-variables
   '(highlight-symbol-idle-delay 1)
   '(highlight-symbol-on-navigation-p t)
   '(hl-paren-colors (quote ("firebrick1" "IndianRed1" "IndianRed4" "grey")))
   '(pulse-delay 0.03)
   '(pulse-flag nil)
   '(pulse-iterations 5))

  (defun toggle-highlight-indentation ()
    (interactive)
    (if (and (boundp 'highlight-indentation-mode) highlight-indentation-mode)
        (progn
          (call-interactively 'highlight-indentation-mode +1)
          (call-interactively 'highlight-indentation-current-column-mode +1))
      (call-interactively 'highlight-indentation-mode -1)
      (call-interactively 'highlight-indentation-current-column-mode -1)))

  (defun enable-highlight-indentation ()
    (interactive)
    (call-interactively 'highlight-indentation-mode +1)
    (call-interactively 'highlight-indentation-current-column-mode +1))

  (add-hook 'coffee-mode-hook 'enable-highlight-indentation)
  (add-hook 'python-mode-hook 'enable-highlight-indentation)

  (defvar highlight-symbol-navigation-map
    (let ((map (make-sparse-keymap)))
      (define-key map "9" 'highlight-symbol-prev)
      (define-key map "0" 'highlight-symbol-next)
      map))

  (temporary-mode-define-keys my-keymap 'highlight-symbol-navigation)

  (define-key my-keymap (kbd "+") 'highlight-symbol-query-replace)
  (define-key my-keymap (kbd "=") 'highlight-symbol-at-point)
  (define-key my-keymap (kbd "-") 'highlight-symbol-remove-all)
  (define-key my-keymap (kbd "_") 'highlight-symbol-mode)
  (define-key my-keymap (kbd "\\") 'toggle-highlight-indentation)
  (define-key my-keymap (kbd "|") 'highlight-indentation-set-offset)

  (add-hook 'c-mode-common-hook 'highlight-parentheses-mode)
  (add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
  (add-hook 'ruby-mode-hook 'highlight-parentheses-mode))
```

<a name="sec-7-57"></a>
## hippie-expand

```cl
(define-module hippie-expand
  ;; Exclude very large buffers from dabbrev
  (defun sanityinc/dabbrev-friend-buffer (other-buffer)
    (< (buffer-size other-buffer) (* 1 1024 1024)))

  (setq dabbrev-friend-buffer-function 'sanityinc/dabbrev-friend-buffer)

  (setq hippie-expand-try-functions-list
        '(
          try-expand-dabbrev
          try-expand-dabbrev-visible
          try-expand-dabbrev-all-buffers
          try-expand-dabbrev-from-kill
          try-complete-file-name-partially
          try-complete-file-name
          try-complete-lisp-symbol-partially
          try-complete-lisp-symbol
          try-expand-list))

  (global-set-key (kbd "M-/") 'hippie-expand))  
```

<a name="sec-7-58"></a>
## abbrev

```cl
(define-module abbrev
  (custom-set-variables
   '(abbrev-mode t)
   '(mail-abbrevs-mode t)))
```

<a name="sec-7-59"></a>
## search-files

```cl
(define-module search-files
  (require-package 'ag)
  (require-package 'wgrep-ag)

  (define-key my-keymap (kbd "o") 'occur)
  (define-key my-keymap (kbd "O") 'multi-occur)
  (define-key my-keymap (kbd "C-o") 'multi-occur-in-matching-buffers)
  (global-set-key (kbd "<f9>") 'rgrep)
  (global-set-key (kbd "<f10>") 'find-dired)
  (global-set-key (kbd "<f11>") 'find-grep-dired))
```

<a name="sec-7-60"></a>
## alternative-files

```cl
(define-module alternative-files
  (defun alternative-files-factories-finder (&optional file)
    (let ((file (or file (alternative-files--detect-file-name))))
      (cond
       ((string-match "^\\(.*\\)/app/models/\\(.+\\)\\.rb$" file)
        (let ((root (match-string 1 file))
              (name (match-string 2 file)))
          (list
           (concat root "/spec/factories/" (alternative-files--pluralize-string name) ".rb"))))

       ((string-match "^\\(.*\\)/spec/factories/\\(.+\\)\\.rb$" file)
        (let* ((root (match-string 1 file))
               (name (match-string 2 file))
               (singular-name (alternative-files--singularize-string name)))
          (list
           (concat root "/app/models/" singular-name ".rb")
           (concat root "/spec/models/" singular-name "_spec.rb")
           (concat root "/app/controllers/" name "_controller.rb")
           (concat root "/spec/controllers/" name "_controller.rb")
           (concat root "/app/helpers/" name "_helper.rb")
           (concat root "/spec/helpers/" name "_helper.rb")
           (concat root "/app/views/" name "/")))))))

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

  (defun alternative-files-maven-finder (&optional file)
    (let ((file (or file (alternative-files--detect-file-name))))
      (cond
       ((string-match "^\\(.+\\)/\\(?:app\\|main\\)/\\(.+\\)\\.\\(java\\|scala\\)$" file)
        (let ((root (match-string 1 file))
              (name (match-string 2 file))
              (ext (match-string 3 file)))
          (list
           (concat root "/test/" name "Test." ext)
           (concat root "/test/" name "Spec." ext)
           (concat root "/test/" name "Suite." ext))))
       ((string-match "^\\(.+\\)/test/\\(.+\\)\\(?:Test\\|Spec\\|Suite\\)\\.\\(java\\|scala\\)$" file)
        (let ((root (match-string 1 file))
              (name (match-string 2 file))
              (ext (match-string 3 file)))
          (list
           (concat root "/main/" name "." ext)
           (concat root "/app/" name "." ext)))))))

  (setq alternative-files-user-functions
        '(alternative-files-factories-finder
          alternative-files-go-finder
          alternative-files-maven-finder))
  (setq alternative-files-root-dir-function 'projectile-project-p)

  (define-key my-keymap "a" 'alternative-files-find-file)
  (define-key my-keymap (kbd "M-a") 'alternative-files-find-file)
  (define-key my-keymap (kbd "A") 'alternative-files-create-file))
```

<a name="sec-7-61"></a>
## ibuffer-mode

```cl
(define-module ibuffer-mode
  (global-set-key (kbd "C-x C-b") 'ibuffer)

  (custom-set-variables
   '(ibuffer-always-show-last-buffer :nomini)
   '(ibuffer-default-shrink-to-minimum-size t)
   '(ibuffer-jump-offer-only-visible-buffers nil)
   '(ibuffer-show-empty-filter-groups nil))

  (defun init--ibuffer-load ()
    (define-ibuffer-sorter filename-or-dired
      "Sort the buffers by their pathname."
      (:description "filenames plus dired")
      (string-lessp
       (with-current-buffer (car a)

         (or buffer-file-name
             (if (eq major-mode 'dired-mode)
                 (expand-file-name dired-directory))
             ;; so that all non pathnames are at the end
             "~"))
       (with-current-buffer (car b)
         (or buffer-file-name
             (if (eq major-mode 'dired-mode)
                 (expand-file-name dired-directory))
             ;; so that all non pathnames are at the end
             "~"))))

    ;; add another sorting method for ibuffer (allow the grouping of
    ;; filenames and dired buffers
    (define-key ibuffer-mode-map (kbd "s p") 'ibuffer-do-sort-by-filename-or-dired)

    (defun ibuffer-filter-by-extname (qualifier)
      (interactive "sFilter by extname: ")
      (ibuffer-filter-by-filename (concat "\\." qualifier "$")))

    (define-key ibuffer-mode-map (kbd "/ .") 'ibuffer-filter-by-extname)

    (setq ibuffer-saved-filter-groups
          '(("default"
             ("dired" (mode . dired-mode))
             ("source" (or
                        (mode . c-mode)
                        (mode . c++-mode)
                        (mode . objc-mode)
                        (mode . cperl-mode)
                        (mode . perl-mode)
                        (mode . java-mode)
                        (filename . "\\.rb\\'")))
             ("web" (or
                     (filename . "\\.js\\'")
                     (filename . "\\.erb\\'")
                     (mode . html-mode)
                     (mode . nxml-mode)
                     (mode . nxhtml-mode)
                     (mode . haml-mode)
                     (mode . css-mode)
                     (mode . sass-mode)
                     (mode . coffee-mode)))
             ("doc" (or
                     (mode   . latex-mode)
                     (mode   . metapost-mode)
                     (mode   . doc-view-mode)
                     (mode   . markdown-mode)))
             ("build" (or
                       (mode . cmake-mode)
                       (mode . makefile-mode)
                       (mode . makefile-gmake-mode)
                       (filename . "Gemfile\\'")
                       (filename . "Gemfile\\.lock\\'")
                       (filename . "[Rr]akefile\\'")))
             ("pim" (or
                     (name    . "^\\*Calendar\\*$")
                     (name    . "^diary$")
                     (mode    . org-mode)))
             ("system" (or
                        (mode       . help-mode)
                        (mode       . completion-list-mode)
                        (mode       . apropos-mode)
                        (name      . "^\\*.*\\*$")
                        (filename . "\.emacs\.d")
                        (mode     . custom-mode))))))

    (remove-hook 'ibuffer-mode-hook 'init--ibuffer-load))

  (defun init--ibuffer-mode ()
    (ibuffer-switch-to-saved-filter-groups "default"))

  (add-hook 'ibuffer-mode-hook 'init--ibuffer-mode)
  ;; ibuffer is a autoloads file, ibufer-load-hook is already ran.  So use
  ;; run-once trick. It must ran before 'init--buffer-mode, so it is added
  ;; after that.
  (add-hook 'ibuffer-mode-hook 'init--ibuffer-load))

```

<a name="sec-7-62"></a>
## deft

```cl
(define-module deft
  (require-package 'deft)
  (custom-set-variables
   '(deft-extension "org")
   '(deft-directory (concat my-dropbox-dir "g/cards"))
   '(deft-use-filename-as-title t)
   '(deft-text-mode 'org-mode))

  (defun init--deft-mode ()
    (define-key deft-mode-map (kbd "C-c SPC") 'org-drill-deft)
    (remove-hook 'deft-mode-hook 'init--deft-mode))
  (add-hook 'deft-mode-hook 'init--deft-mode)

  (defun org-drill-deft ()
    "Run org-drill in deft-directory"
    (interactive)
    (with-current-buffer (find-file-noselect (concat deft-directory "/.timestamp"))
      (org-drill 'directory)))

  (define-key my-keymap "m" 'deft))
```

<a name="sec-7-63"></a>
## mail

```cl
(define-module mail
  (custom-set-variables
   '(compose-mail-user-agent-warnings nil))

  (defun init--mutt-compose ()
    (when (and
           (buffer-file-name)
           (string-match-p
            "^mutt-"
            (file-name-nondirectory (buffer-file-name))))
      (message-mode)
      (message-goto-body)))

  (add-hook 'server-visit-hook 'init--mutt-compose)

  (autoload 'external-abook-try-expand "external-abook" nil t)
  (defun init--message-mode ()
    (local-set-key "\C-c\t" 'external-abook-try-expand))
    (add-hook 'message-mode-hook 'init--message-mode)

  (when (eq system-type 'darwin)
    (custom-set-variables
     '(external-abook-command "contacts -lSf '%%e\t\"%%n\"' '%s'")
     '(message-signature-file nil)
     '(message-send-mail-function 'message-send-mail-with-mailclient))))
```

<a name="sec-7-64"></a>
## html-template-modes

```cl
(define-module html-template-modes
  (require-package 'haml-mode)
  (require-package 'slim-mode)
  (require-package 'handlebars-mode)
  (require-package 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.handlebars$" . handlebars-mode))
  (add-to-list 'auto-mode-alist '("\\.hbs$" . handlebars-mode)))
```

<a name="sec-7-65"></a>
## css

css, sass, scss, stylus

```cl
(define-module css
  (require-module html-template-modes)
  (require-package 'scss-mode)
  (require-package 'sass-mode)
  (require-package 'stylus-mode)

  (custom-set-variables
   '(scss-compile-at-save nil)
   '(css-indent-offset 2))

  (defun init--sass-load ()
    ;; do not indent after CSS attribute
    (setq sass-non-block-openers
          (cons
           "^ *[-a-zA-Z0-9]+: "
           sass-non-block-openers))
    (remove-hook 'sass-mode-hook 'init--sass-load))

  (add-hook 'sass-mode-hook 'init--sass-load))
```

<a name="sec-7-66"></a>
## yaml-mode

```cl
(define-module yaml-mode
  (require-package 'yaml-mode))
```

<a name="sec-7-67"></a>
## rainbow-mode

```cl
(define-module rainbow-mode
  (require-package 'rainbow-mode)

  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'sass-mode-hook 'rainbow-mode)
  (add-hook 'scss-mode-hook 'rainbow-mode))
```

<a name="sec-7-68"></a>
## markdown-mode

```cl
(define-module markdown-mode
  (require-package 'markdown-mode)

  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

  (defun markdown-demote-all ()
    (interactive)
    (ignore-errors
      (markdown-demote)
      (outline-next-visible-heading))
    (while (not (eobp))
      (markdown-demote)
      (outline-next-visible-heading)))

  (defun markdown-preview-in-marked (&optional file)
    "Preview FILE in Marked.app"
    (interactive)
    (setq file (or file (buffer-file-name)))
    (start-process "*marked" nil "open" "-a" "Marked" file))

  (defun init--markdown-mode-mac ()
    (local-set-key (kbd "C-c C-c p") 'markdown-preview-in-marked))

  (when (eq system-type 'darwin)
    (add-hook 'markdown-mode-hook 'init--markdown-mode-mac))

  (add-hook 'markdown-mode-hook 'auto-fill-mode))
```

<a name="sec-7-69"></a>
## lisp-mode

```cl
(define-module lisp-mode
  (require-package 'paredit)

  (defun paredit-wrap-round-from-behind ()
    (interactive)

    (forward-sexp -1)
    (paredit-wrap-round)
    (insert " ")
    (forward-char -1))

  (defun conditionally-enable-paredit-mode ()
    "Enable `paredit-mode' in the minibuffer, during `eval-expression'."
    (when (eq this-command 'eval-expression)
      (paredit-mode +1)))

  (defun init--emacs-lisp-load ()
    (define-key emacs-lisp-mode-map (kbd "M-s /") 'describe-function)
    (remove-hook 'emacs-lisp-mode-hook 'init--emacs-lisp-load))

  (defun init--paredit-load ()
    (define-key paredit-mode-map (kbd "M-)") 'paredit-wrap-round-from-behind)
    (define-key paredit-mode-map (kbd "M-s") nil)
    (define-key paredit-mode-map (kbd "M-S") nil)
    (define-key paredit-mode-map [C-left] nil)
    (define-key paredit-mode-map [C-right] nil)
    (define-key paredit-mode-map [C-up] nil)
    (define-key paredit-mode-map [C-down] nil)
    (define-key paredit-mode-map (kbd "M-N") 'paredit-split-sexp)
    (remove-hook 'paredit-mode-hook 'init--paredit-load))

  (defun init--lisp-mode ()
    (paredit-mode +1))

  (defun init--paredit-mode ()
    (if (minibufferp)
        (progn
          (local-set-key (kbd "M-p") 'previous-history-element)
          (local-set-key (kbd "M-n") 'next-history-element))
      (local-set-key (kbd "M-p") 'paredit-raise-sexp)
      (local-set-key (kbd "M-n") 'paredit-splice-sexp)))

  (add-hook 'paredit-mode-hook 'init--paredit-mode)
  (add-hook 'emacs-lisp-mode-hook 'init--lisp-mode)
  (add-hook 'minibuffer-setup-hook 'conditionally-enable-paredit-mode)

  (add-hook 'paredit-mode-hook 'init--paredit-load)
  (add-hook 'emacs-lisp-mode-hook 'init--emacs-lisp-load))
```

<a name="sec-7-70"></a>
## ruby-mode

```cl
(define-module ruby-mode
  (custom-set-variables
   '(ruby-deep-indent-paren nil))

  (require-package 'ruby-end)
  (require-package 'yari)
  (defalias 'ri 'yari)

  (defun init--ruby-mode ()
    (local-set-key (kbd "M-s /") 'yari)

    (ruby-end-mode +1)
    (hs-minor-mode +1)
    (turn-on-auto-fill)

    (setq autopair-extra-pairs '(:code ((?` . ?`)))))

  ;;https://gist.github.com/dgutov/1274520
  (defadvice ruby-indent-line (after unindent-closing-paren activate)
    (let ((column (current-column))
          indent offset)
      (save-excursion
        (back-to-indentation)
        (let ((state (syntax-ppss)))
          (setq offset (- column (current-column)))
          (when (and (eq (char-after) ?\))
                     (not (zerop (car state))))
            (goto-char (cadr state))
            (setq indent (current-indentation)))))
      (when indent
        (indent-line-to indent)
        (when (> offset 0) (forward-char offset)))))

  ;; Only expand when last command is self-insert
  (defadvice ruby-end-expand-p (around no-duplicate-end activate)
    (if (eq last-command 'self-insert-command)
        ad-do-it
      (setq ad-return-value nil)))

  (add-to-list 'auto-mode-alist '("Rakefile\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rake\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.thor\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.ru\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Capfile\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Vagrantfile\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.rabl\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.jbuilder\\'" . ruby-mode))
  (add-to-list 'auto-mode-alist '("\\.tokamak\\'" . ruby-mode))

  (add-hook 'ruby-mode-hook 'init--ruby-mode))
```

<a name="sec-7-71"></a>
## rails

Install `emacs-rails` using `make vendor`

```cl
(define-module rails
  (setq load-path (cons (concat my-vendor-dir "emacs-rails") load-path))

  (custom-set-variables
   '(rails-always-use-text-menus t)
   '(rails-browse-api-with-w3m t)
   '(rails-ui:show-mode-line nil))

  (require 'emacs-rails-hacks))
```

<a name="sec-7-72"></a>
## rspec-mode

```cl
(define-module rspec-mode
  ;; require the two macros to compile rspec-mode correctly.
  (defmacro rspec-from-directory (directory body-form)
    "Peform body-form from the specified directory"
    `(let ((default-directory ,directory))
       ,body-form))

  (defmacro rspec-from-project-root (body-form)
    "Peform body-form from the project root directory"
    `(rspec-from-directory (or (rspec-project-root) default-directory)
                          ,body-form))

  (require-package 'rspec-mode)

  (custom-set-variables
   ;; already handled by ~/bin/rspec
   '(rspec-use-bundler-when-possible nil)
   '(rspec-use-zeus-when-possible nil)
   '(rspec-use-rake-when-possible nil)
   '(rspec-key-command-prefix (kbd "M-s v"))))
```

<a name="sec-7-73"></a>
## mmm-mode

```cl
(define-module mmm-mode
  (require-package 'mmm-mode)

  ;; fix font lock when started as daemon
  (add-hook 'after-make-window-system-frame-hooks
            '(lambda ()
               (setq mmm-font-lock-available-p t)))

  (defvar mmm-fenced-code-block-mode-alist nil)
  (setq mmm-fenced-code-block-mode-alist
        '(("javascript" . js-mode)))

  (defun mmm-fenced-code-block-get-mode (string)
    (string-match "[a-zA-Z_-]+" string)
    (setq string (match-string 0 string))
    (or
     (mmm-ensure-modename (or (cdr (assoc string mmm-fenced-code-block-mode-alist))
                              (intern (concat string "-mode"))))
     (signal 'mmm-no-matching-submode nil)))

  (setq mmm-global-mode 'maybe)
  (setq mmm-submode-decoration-level 2)
  (setq mmm-parse-when-idle t)
  (require 'mmm-auto)

  (mmm-add-classes
   '((yaml-header-matters
      :submode yaml-mode
      :face mmm-code-submode-face
      :front "\\`---$"
      :back "^---$")))

  (mmm-add-classes
   '((fenced-code-block
      :front "^\\(```\\)\\(\\w+\\)$"
      :front-offset (end-of-line 1)
      :face mmm-code-submode-face
      :back "^```$"
      :delimiter-mode nil
      :match-submode mmm-fenced-code-block-get-mode
      :insert ((?s fenced-code-block "Code Type: " @ "```" str "\n" _
                   @ "\n" @ "```\n" @)))))

  (mmm-add-mode-ext-class 'html-erb-mode "\\.html\\.erb\\'" 'erb)
  (mmm-add-mode-ext-class 'html-erb-mode "\\.rhtml\\'" 'erb)
  (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)
  (mmm-add-mode-ext-class 'html-erb-mode nil 'html-js)
  (mmm-add-mode-ext-class 'html-erb-mode nil 'html-css)
  (mmm-add-mode-ext-class 'markdown-mode nil 'yaml-header-matters)
  (mmm-add-mode-ext-class 'markdown-mode nil 'fenced-code-block)
  (mmm-add-mode-ext-class 'gfm-mode nil 'yaml-header-matters)
  (mmm-add-mode-ext-class 'gfm-mode nil 'fenced-code-block)

  (add-to-list 'auto-mode-alist '("\\.html\\.erb\\'" . html-erb-mode))
  (add-to-list 'auto-mode-alist '("\\.rhtml\\'" . html-erb-mode))
  (add-to-list 'auto-mode-alist '("\\.jst\\.ejs\\'"  . html-erb-mode)))
```

<a name="sec-7-74"></a>
## flycheck

```cl
(define-module flycheck
  (require-package 'flycheck)
  (global-flycheck-mode)
  (setq flycheck-mode-line-lighter " fC")

  (defun init--disable-emacs-lisp-checkdoc-in-org-src-mode ()
    (make-local-variable 'flycheck-checkers)
    (setq flycheck-checkers (delq 'emacs-lisp-checkdoc flycheck-checkers)))

  (add-hook 'org-src-mode-hook 'init--disable-emacs-lisp-checkdoc-in-org-src-mode)

  (define-key my-keymap (kbd "`") 'flycheck-next-error)
  (define-key my-keymap (kbd "~") 'flycheck-previous-error)
  (define-key my-keymap (kbd "M-`") 'flycheck-next-error)
  (global-set-key (kbd "M-`") 'flycheck-next-error)
  (global-set-key (kbd "M-~") 'flycheck-previous-error))
```

<a name="sec-7-75"></a>
## tmux-send

```cl
(define-module tmux-send
  (defalias 'tcd 'tmux-cd)
  (global-set-key (kbd "M-<f6>") 'tmux-toggle-send-next-compile-command)
  (global-set-key (kbd "C-M-<f6>") 'tmux-repeat)
  (global-set-key (kbd "<f6>") 'tmux-send)
  (global-set-key (kbd "C-<f6>") 'tmux-select))
```

<a name="sec-7-76"></a>
## speedbar

```cl
(define-module speedbar
  (global-set-key (kbd "<f8>") 'speedbar-get-focus)

  (custom-set-variables
   '(speedbar-frame-parameters '((minibuffer . nil)
                                 (width . 20)
                                 (border-width . 0)
                                 (menu-bar-lines . 0)
                                 (tool-bar-lines . 0)
                                 (unsplittable . t)
                                 (left-fringe . 0)
                                 (name . "speedbar")
                                 (user-position . t)
                                 (top . 0)
                                 (left . 0)))))
```

<a name="sec-7-77"></a>
## clean-buffer

```cl
(define-module clean-buffer
  (custom-set-variables
   '(clean-buffer-list-delay-special 3600)
   '(clean-buffer-list-kill-buffer-names (quote ("*Help*" "*Apropos*" "*Buffer List*" "*Compile-Log*" "*info*" "*vc*" "*vc-diff*" "*diff*" "bbdb" "*RE-Builder*" "*Shell Command Output*" "*ESS*" "*WoMan-Log*" "*magit-process*" "*Dired log*" "*anything*" "*CEDET Global*" "*Pp Eval Output*" "*Completions*")))
   '(clean-buffer-list-kill-regexps (quote ("\\`\\*Customize Group:" "\\`\\*Man " "\\`\\*magit" "\\`\\*RNC Input")))
   '(midnight-mode t nil (midnight))))
```

<a name="sec-7-78"></a>
## uniquify-buffer

```cl
(define-module clean-buffer
  (custom-set-variables
   '(uniquify-buffer-name-style (quote post-forward-angle-brackets) nil (uniquify))
   '(uniquify-strip-common-suffix nil)))
```

<a name="sec-7-79"></a>
## diminish

```cl
(defmacro diminish-on-load (hook mode &optional to-what)
  (let ((func (intern (concat "diminish-" (symbol-name mode)))))
    `(if (and (boundp ',mode) ,mode)
         (diminish ',mode ,to-what)
       (defun ,func ()
         (diminish ',mode ,to-what)
         (remove-hook ',hook ',func))
       (add-hook ',hook ',func))))

(define-module diminish
  (require-package 'diminish)

  (diminish-on-load highlight-parentheses-mode-hook highlight-parentheses-mode)
  (diminish-on-load yas-minor-mode-hook yas-minor-mode)
  (diminish-on-load whitespace-mode-hook global-whitespace-mode)
  (diminish-on-load whitespace-mode-hook whitespace-mode)
  (diminish-on-load whole-line-or-region-on-hook whole-line-or-region-mode)
  (diminish-on-load hs-minor-mode-hook hs-minor-mode)
  (diminish-on-load flyspell-mode-hook flyspell-mode " fS")
  (diminish-on-load paredit-mode-hook paredit-mode)
  (diminish-on-load undo-tree-mode-hook undo-tree-mode)
  (diminish-on-load outline-minor-mode-hook outline-minor-mode)
  (diminish-on-load highlight-indentation-mode-hook highlight-indentation-mode)
  (diminish-on-load highlight-indentation-current-column-mode-hook highlight-indentation-current-column-mode)
  (diminish-on-load rspec-mode-hook rspec-mode)
  (diminish-on-load rails-rspec-model-minor-mode-hook rails-rspec-model-minor-mode)
  (diminish-on-load rails-model-minor-mode-hook rails-model-minor-mode)
  (diminish-on-load rails-controller-minor-mode-hook rails-controller-minor-mode)
  (diminish-on-load ruby-end-mode-hook ruby-end-mode)
  (diminish 'abbrev-mode)
  (diminish 'auto-fill-function " F"))
```

<a name="sec-7-80"></a>
## dtrt-indent

```cl
(define-module dtrt-indent
  (require 'dtrt-indent)
  (dtrt-indent-mode 1))
```

<a name="sec-7-81"></a>
## undo-tree

```cl
(define-module undo-tree
  (require-package 'undo-tree)
  (global-undo-tree-mode)
  (define-key undo-tree-map (kbd "C-x r") nil)
  (define-key ctl-x-r-map "u" 'undo-tree-save-state-to-register)
  (define-key ctl-x-r-map "U" 'undo-tree-restore-state-from-register))
```

<a name="sec-7-82"></a>
## js-mode

```cl
(define-module js-mode
  (custom-set-variables
   '(js-indent-level 2)
   '(js-expr-indent-offset 2)
   '(js-enabled-frameworks nil)
   '(inf-mongo-command "mongo"))

  (require-package 'inf-mongo)

  (defun moz-eval-statement-or-region ()
    "Send the previous statement to the inferior Mongo process."
    (interactive)
    (save-window-excursion
      (save-excursion
        (unless (region-active-p)
          (thing-region "sentence"))
        (moz-send-region (mark) (point))))
    (display-buffer (process-buffer (inferior-moz-process))))
  (defun init--moz-minor-mode-load ()
    (define-key moz-minor-mode-map (kbd "C-M-x") 'moz-eval-statement-or-region)
    (define-key moz-minor-mode-map (kbd "C-x C-e") 'moz-eval-statement-or-region)
    (remove-hook 'moz-minor-mode-hook 'init--moz-minor-mode-load))
  (add-hook 'moz-minor-mode-hook 'init--moz-minor-mode-load)

  (defun mongo-eval-statement-or-region ()
    "Send the previous statement to the inferior Mongo process."
    (interactive)
    (save-window-excursion
      (save-excursion
        (unless (region-active-p)
          (thing-region "sentence"))
        (mongo-send-region (mark) (point))))
    (display-buffer inf-mongo-buffer))

  (defvar mongo-minor-mode-map
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-M-x") 'mongo-eval-statement-or-region)
      (define-key map (kbd "C-x C-e") 'mongo-eval-statement-or-region)
      map))

  (define-minor-mode mongo-minor-mode
    "Eval commands in mongo shell"
    nil " mongo" mongo-minor-mode-map))
```

<a name="sec-7-83"></a>
## coffee-mode

```cl
(define-module coffee-mode
  (require-package 'coffee-mode))
```

<a name="sec-7-84"></a>
## c-mode

```cl
(define-module c-mode
  ;; see http://ann77.stu.cdut.edu.cn/EmacsAutoNewLineImpv.html
  ;; auto-newline refinement
  (defvar wcy-cancel-auto-new-line-command-list
    '(next-line previous-line)
    "a list of command which will trigger the cancel.")

  (defun wcy-cancel-auto-new-line ()
    (interactive)
    (save-excursion
      (if (and (eq last-command 'c-electric-semi&comma)
               (memq this-command wcy-cancel-auto-new-line-command-list))
          (progn
            (if (and (boundp c-auto-newline) c-auto-newline)
                (progn
                  (delete-blank-lines)))))))

  (defun init--autopair-open-braces (action pair pos-before)
    (when (and (eq 'opening action)
               (eq ?\} pair)
               (looking-back "^[  ]*"))
      (save-excursion
        (newline)
        (indent-according-to-mode))))

  (defconst my-c-style
    '((c-basic-offset             . 2)
      (c-comment-only-line-offset . (0 . 0))
      (c-ignore-auto-fill         . nil)
      (c-tab-always-indent        . t)
      (c-hanging-braces-alist     . ((defun-open after)
                                     (defun-close before)
                                     (class-open after)
                                     (class-close before)
                                     (block-open after)
                                     ;; (block-close . c-snug-do-while)
                                     (block-close before)
                                     (topmost-intro)
                                     (brace-list-open)
                                     (brace-list-close)
                                     (do-while-closure after)
                                     (substatement-open after)
                                     (else-clause after)
                                     (access-label after)
                                     (catch-clause  after)
                                     (inline-open after)
                                     (namespace-open)))
      (c-hanging-colons-alist     . ((inher-intro)
                                     (case-label after)
                                     (label after)
                                     (access-label after)
                                     (member-init-intro before)))
      (c-cleanup-list             . (scope-operator
                                     defun-close-semi
                                     list-close-comma
                                     comment-close-slash))
      (c-offsets-alist            . ((block-open . 0)
                                     (block-close . 0)
                                     (statement-block-intro . +)
                                     (substatement . +)
                                     (substatement-open . 0)
                                     (substatement-label . 0)
                                     (label . 0)
                                     (statement-cont c-lineup-string-cont c-lineup-assignments +)
                                     ;; (template-args-cont iy-c-lineup-template-args-cont c-lineup-template-args +)
                                     (case-label . 0)
                                     (do-while-closure . 0)
                                     (else-clause . 0)
                                     (catch-clause . 0)
                                     (case-label . 0)
                                     (access-label . -)
                                     (arglist-close . c-lineup-close-paren)
                                     (namespace-open . 0)
                                     (class-open . 0)
                                     (class-close . 0)
                                     (innamespace . 0)
                                     (inline-open . 0)
                                     (member-init-intro . 0)
                                     (inher-intro . 0)
                                     )))
    "My C/C++ Programming Style")

  ;; Customizations for all modes in CC Mode.
  (defun init--c-mode-common ()
    (c-add-style "cust" my-c-style t)

    (c-set-style "cust")

    (setq tab-width 2
          indent-tabs-mode nil)
    (c-toggle-auto-hungry-state 1)

    (hs-minor-mode t)
    (set (make-local-variable 'comment-auto-fill-only-comments) t)
    (turn-on-auto-fill)
    (setq autopair-handle-action-fns '(autopair-default-handle-action
                                       init--autopair-open-braces))
    (add-hook 'pre-command-hook 'wcy-cancel-auto-new-line nil t)

    (local-set-key (kbd "C-M-a") 'c-beginning-of-defun)
    (local-set-key (kbd "C-M-e") 'c-end-of-defun))

  (defun bh-choose-header-mode ()
    (interactive)
    (if (string-equal (substring (buffer-file-name) -2) ".h")
        (progn
          ;; OK, we got a .h file, if a .m file exists we'll assume it's
          ;; an objective c file. Otherwise, we'll look for a .cpp file.
          (let ((dot-m-file (concat (substring (buffer-file-name) 0 -1) "m"))
                (dot-cpp-file (concat (substring (buffer-file-name) 0 -1) "cpp")))
            (if (file-exists-p dot-m-file)
                (progn
                  (objc-mode)
                  )
              (if (file-exists-p dot-cpp-file)
                  (c++-mode)))))))

  (add-hook 'find-file-hook 'bh-choose-header-mode)
  (add-hook 'c-mode-common-hook 'init--c-mode-common))
```

<a name="sec-7-85"></a>
## win-move-resize

```cl
(define-module win-move-resize
  (require-module windows-commands)
  (require-package 'buffer-move)
  (global-set-key [C-up] 'buf-move-up)
  (global-set-key [C-down] 'buf-move-down)
  (global-set-key [C-left] 'buf-move-left)
  (global-set-key [C-right] 'buf-move-right)

  (windmove-default-keybindings 'meta)

  (require 'win-resize)

  (defvar win-move-resize-map
    (let ((map (make-sparse-keymap)))
      (define-key map "h" 'windmove-left)
      (define-key map "j" 'windmove-down)
      (define-key map "k" 'windmove-up)
      (define-key map "l" 'windmove-right)
      ;; may C-h is translated to backspace
      (define-key map (kbd "C-h") 'buf-move-left)
      (define-key map (kbd "C-j") 'buf-move-down)
      (define-key map (kbd "C-k") 'buf-move-up)
      (define-key map (kbd "C-l") 'buf-move-right)
      (define-key map (kbd "<backspace>") 'buf-move-left)
      (define-key map (kbd "<DEL>") 'buf-move-left)
      (define-key map "H" 'win-resize-enlarge-vert)
      (define-key map "J" 'win-resize-minimize-horiz)
      (define-key map "K" 'win-resize-enlarge-horiz)
      (define-key map "L" 'win-resize-minimize-vert)
      map))

  (temporary-mode-define-keys my-keymap 'win-move-resize))
```

<a name="sec-7-86"></a>
## scala-mode

```cl
(define-module scala-mode
  (require-package 'scala-mode2)

  (defun init--scala-mode ()
    (setq imenu-generic-expression
          '(
            ("var" "\\(var +\\)\\([^(): ]+\\)" 2)
            ("val" "\\(val +\\)\\([^(): ]+\\)" 2)
            ("override def" "^[ \\t]*\\(override\\) +\\(def +\\)\\([^(): ]+\\)" 3)
            ("implicit def" "^[ \\t]*\\(implicit\\) +\\(def +\\)\\([^(): ]+\\)" 3)
            ("def" "^[ \\t]*\\(def +\\)\\([^(): ]+\\)" 2)
            ("trait" "\\(trait +\\)\\([^(): ]+\\)" 2)
            ("class" "^[ \\t]*\\(class +\\)\\([^(): ]+\\)" 2)
            ("case class" "^[ \\t]*\\(case class +\\)\\([^(): ]+\\)" 2)
            ("object" "\\(object +\\)\\([^(): ]+\\)" 2)
            )))

  (add-hook 'scala-mode-hook 'init--scala-mode))
```

<a name="sec-7-87"></a>
## visual-regexp

```cl
(define-module visual-regexp
  (require-package 'visual-regexp)
  (autoload 'vr/query-replace "visual-regexp" nil t)
  (define-key my-keymap (kbd "v Q") 'vr/replace)
  (define-key my-keymap (kbd "v q") 'vr/query-replace))
```

<a name="sec-7-88"></a>
## eclim

```cl
(define-module eclim
  (require-package 'emacs-eclim)

  (custom-set-variables
   '(eclim-use-yasnippet nil))

  (autoload 'start-eclimd "eclimd" nil t)

  (defun projectile-maybe-turn-on-eclim ()
    (when (and buffer-file-name
               (file-exists-p (concat (projectile-project-p) ".project"))
               (eclim--accepted-p buffer-file-name)
               (eclim--project-dir buffer-file-name))
      (eclim-mode +1)))
  (defun init--eclim-mode ()
    (when (boundp 'ac-sources)
      (if (eq (car ac-sources) 'ac-source-yasnippet)
          (setq ac-sources (cons 'ac-source-yasnippet (cons 'ac-source-emacs-eclim (cdr ac-sources))))
        (setq ac-sources (cons 'ac-source-emacs-eclim ac-sources))))
    (define-key eclim-mode-map (kbd "C-c C-e C-;") 'eclim-problems-correct)
    (define-key eclim-mode-map (kbd "C-c C-e C-n") 'eclim-problems-next)
    (define-key eclim-mode-map (kbd "C-c C-e C-p") 'eclim-problems-previous))
  (add-hook 'eclim-mode-hook 'init--eclim-mode)

  (defun eclim-enable ()
    (interactive)
    (require 'eclim)
    (require 'ac-emacs-eclim-source)

    (add-hook 'projectile-mode-hook 'projectile-maybe-turn-on-eclim)
    (mapc (lambda (buffer)
            (with-current-buffer buffer
              (when (and buffer-file-name
                         (eclim--accepted-p buffer-file-name)
                         (eclim--project-dir buffer-file-name))
               (eclim-mode +1))))
          (buffer-list)))
  (defun eclim-disable ()
    (interactive)
    (remove-hook 'projectile-mode-hook 'projectile-maybe-turn-on-eclim)
    (mapc (lambda (buffer)
            (with-current-buffer buffer
              (eclim-mode -1)))
          (buffer-list))))
```

<a name="sec-7-89"></a>
## ensime

Add [ENSIME-sbt-cmd](https://github.com/aemoncannon/ensime-sbt-cmd) in `~/.sbt/plugins/plugins.sbt`

```
addSbtPlugin("org.ensime" % "ensime-sbt-cmd" % "VERSION")
```

Install [ensime](https://github.com/aemoncannon/ensime) using `make vendor`

```cl
(define-module ensime
  (let ((path
         (car (nreverse (file-expand-wildcards (concat my-vendor-dir "ensime_*"))))))
    (when path
      ;; Append ensime elisp dir
      (setq load-path
            (nreverse (cons (concat path "/elisp")
                            (nreverse load-path))))))

  (custom-set-variables
   '(ensime-ac-override-settings nil))

  (defun projectile-maybe-turn-on-ensime (&optional buffer)
    (with-current-buffer (or buffer (current-buffer))
      (when (and (buffer-file-name)
                 (eq major-mode 'scala-mode)
                 (file-exists-p (concat (projectile-project-p) ".ensime")))
        (ensime-mode +1))))

  (defun init--ensime-mode ()
    (when (boundp 'ac-sources)
      (if (eq (car ac-sources) 'ac-source-yasnippet)
          (setq ac-sources (cons 'ac-source-yasnippet (cons 'ac-source-ensime-completions (cdr ac-sources))))
        (setq ac-sources (cons 'ac-source-ensime-completions ac-sources))))
    (local-set-key (kbd "M-s /") 'ensime-inspect-type-at-point))
  (add-hook 'ensime-mode-hook 'init--ensime-mode)

  (defun ensime-enable ()
    (interactive)
    (require 'ensime)
    (ensime)
    (add-hook 'projectile-mode-hook 'projectile-maybe-turn-on-ensime)
    (mapc 'projectile-maybe-turn-on-ensime (buffer-list))
    )

  (defun ensime-disable ()
    (interactive)
    (remove-hook 'projectile-mode-hook 'projectile-maybe-turn-on-ensime)
    (mapc (lambda (buffer)
            (with-current-buffer buffer
              (ensime-mode -1)))
          (buffer-list))
    (ensime-disconnect-all)
    (ignore-errors
      (ensime-shutdown))))
```

<a name="sec-7-90"></a>
## ess

```cl
(define-module ess
  (let ((path
         (car (nreverse (file-expand-wildcards (concat my-vendor-dir "ess-*"))))))
    (when path
      (setq load-path (cons path load-path))
      (autoload 'R-mode "ess-site" nil t)
      (autoload 'Rnw-mode "ess-site" nil t)

      (setq auto-mode-alist
            (append
             '(("\\.[rR]\\'"        . R-mode)
               ("\\.[rR]nw\\'"      . Rnw-mode))
             auto-mode-alist)))))
```

<a name="sec-7-91"></a>
## ianyme

Functions to manage site iany.me

```cl
(define-module ianyme
  (defun wiki ()
    (interactive)
    (ido-find-file-in-dir (concat my-codebase-dir "iany.me/content/wiki")))
  (defun blog ()
    (interactive)
    (ido-find-file-in-dir (concat my-codebase-dir "iany.me/content/posts")))
  (defun wikify ()
    (interactive)
    (let* ((oldname (buffer-file-name))
           (basename (file-name-nondirectory oldname))
           (newname (concat my-codebase-dir "iany.me/content/wiki/" basename)))
      (rename-file oldname newname)
      (set-visited-file-name newname))))
```

<a name="sec-7-92"></a>
## mac

```cl
(define-module mac
  (when (eq system-type 'darwin)
    (custom-set-variables '(mac-command-modifier 'super)
                          '(mac-right-command-modifier 'meta)
                          '(mac-option-modifier 'hyper)
                          '(ns-pop-up-frames nil)
                          '(helm-locate-command "mdfind %s %s")
                          '(locate-command "mdfind"))

    (defalias 'mdfind 'locate)

    (define-key key-translation-map (kbd "H-<tab>") (kbd "M-TAB"))

    (require-package 'applescript-mode)

    (require-package 'dash-at-point)
    (define-key my-keymap "?" 'dash-at-point)

    (defvar mac--open-dictionary-hist)
    (defun mac--open-dictionary (the-word)
      "Open Dictionary.app for the-word"
      (interactive (list
                    (let* ((wap (word-at-point))
                           (w (read-from-minibuffer
                               (format "Dictionary Lookup (%s): " wap)
                               nil nil nil 'mac--open-dictionary-hist)))
                      (if (zerop (length w)) wap w))))
      (start-process "dict" nil "open" (concat "dict:///" the-word)))

    (global-set-key (kbd "H-SPC") 'mac--open-dictionary)
    (global-set-key (kbd "H-v") 'scroll-down-command)
    (global-set-key (kbd "M-v") 'scroll-down-command)
    (global-set-key (kbd "C-S-v") 'scroll-down-command)

    (defadvice case-dwim-capitalize (around ns-copy activate)
      (if (region-active-p)
          (ns-copy-including-secondary)
        ad-do-it))
    (defadvice scroll-down-command (around ns-paste (arg) activate)
      (if (< (prefix-numeric-value arg) 0)
          (yank)
        ad-do-it))

    ;; for DEVONThink
    (add-to-list 'auto-mode-alist '("\\.scala\\.txt\\'" . scala-mode))
    (add-to-list 'auto-mode-alist '("\\.xml\\.txt\\'" . xml-mode))

    ))
```

<a name="sec-7-93"></a>
## cscope

```cl
(define-module cscope
  (when (require 'xcscope nil t)
    (defcustom cscope-ignore-case t
      "*Whether to ignore case while searching."
      :group 'cscope
      :type 'boolean)

    (defun cscope-toggle-case ()
      (interactive)
      (setq cscope-ignore-case (not cscope-ignore-case))
      (cscope-tell-ignore-case))
    (defun cscope-tell-ignore-case ()
      (interactive)
      (message "Cscope Ignore Case (%s)"
               (if cscope-ignore-case "Enable" "Disable")))

    (define-key cscope:map "\C-csv" 'cscope-toggle-case)
    (define-key cscope:map "\C-csV" 'cscope-tell-ignore-case)
    (define-key cscope-list-entry-keymap "v" 'cscope-toggle-case)
    (define-key cscope-list-entry-keymap "V" 'cscope-tell-ignore-case)

    (defadvice cscope-call (before ignore-case activate)
      "ignore case in cscope search"
      (when cscope-ignore-case
        (ad-set-arg 1 (cons "-C" (ad-get-arg 1)))))))
```

<a name="sec-7-94"></a>
## folding

```cl
(define-module folding
  (require-package 'fold-dwim)
  (require 'fold-dwim)
  (require 'hideshow)

  (define-key my-keymap (kbd "M-i") 'fold-dwim-toggle)
  (define-key my-keymap (kbd "I") 'fold-dwim-show-all)
  (define-key my-keymap (kbd "C-i") 'fold-dwim-hide-all)

  ;; Outline-minor-mode key map
  (define-prefix-command 'my-outline-map nil "Outline-")

  ;; HIDE
  (define-key my-outline-map "q" 'hide-sublevels) ; Hide everything but the top-level headings
  (define-key my-outline-map "t" 'hide-body) ; Hide everything but headings (all body lines)
  (define-key my-outline-map "o" 'hide-other) ; Hide other branches
  (define-key my-outline-map "c" 'hide-entry) ; Hide this entry's body
  (define-key my-outline-map "l" 'hide-leaves) ; Hide body lines in this entry and sub-entries
  (define-key my-outline-map "d" 'hide-subtree) ; Hide everything in this entry and sub-entries

  ;; SHOW
  (define-key my-outline-map "a" 'show-all)  ; Show (expand) everything
  (define-key my-outline-map "e" 'show-entry) ; Show this heading's body
  (define-key my-outline-map "i" 'show-children) ; Show this heading's immediate child sub-headings
  (define-key my-outline-map "k" 'show-branches) ; Show all sub-headings under this heading
  (define-key my-outline-map "s" 'show-subtree) ; Show (expand) everything in this heading & below

  ;; MOVE
  (define-key my-outline-map "u" 'outline-up-heading)              ; Up
  (define-key my-outline-map "n" 'outline-next-visible-heading)    ; Next
  (define-key my-outline-map "p" 'outline-previous-visible-heading) ; Previous
  (define-key my-outline-map "f" 'outline-forward-same-level) ; Forward - same level
  (define-key my-outline-map "b" 'outline-backward-same-level) ; Backward - same level

  (define-key my-outline-map "i" 'fold-dwim-toggle)
  (define-key my-outline-map (kbd "TAB") 'toggle-selective-display)

  (define-key my-keymap (kbd "i") my-outline-map)

  ;; Folding
  (defvar fringe-face 'fringe)
  (defface collapsed-face '((t (:background "#2e3330" :foreground "#57705c"))) "Collapsed Overlay")
  (defvar collapsed-face 'collapsed-face)

  (add-hook 'lisp-mode-hook 'hs-minor-mode)
  (add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
  (add-hook 'ruby-mode-hook 'hs-minor-mode)

  (defun toggle-selective-display (column)
      (interactive "P")
      (set-selective-display
       (or column
           (unless selective-display
             (1+ (current-column))))))

  ;; http://code.google.com/p/bamanzi-misc/source/browse/trunk/_emacs.d/site-lisp/common/fold_/hideshow-fringe.el?r=122&spec=svn448
  (define-fringe-bitmap 'hs-marker [0 24 24 126 126 24 24 0])

  (defun display-code-line-counts (ov)
    (when (eq 'code (overlay-get ov 'hs))
      (let* ((marker-string "*fringe-dummy*")
             (marker-length (length marker-string))
             (display-string (format " (%d)..." (count-lines (overlay-start ov) (overlay-end ov)))))
        (overlay-put ov 'help-echo "Hiddent text. M-s M-i to show")
        (put-text-property 0 marker-length 'display (list 'left-fringe 'hs-marker 'fringe-face) marker-string)
        (overlay-put ov 'before-string marker-string)
        (put-text-property 1 (length display-string) 'face 'collapsed-face display-string)
        (overlay-put ov 'display display-string)
        (overlay-put ov 'evaporate t))))

  (setq hs-set-up-overlay 'display-code-line-counts)

  (add-to-list 'hs-special-modes-alist
               '(ruby-mode
                 "\\(def\\|do\\|{\\)" "\\(end\\|}\\)" "#"
                 (lambda (arg) (ruby-end-of-block)) nil))

  (defadvice outline-flag-region (after display-code-line-counts (from to flag) activate)
    (when flag
      (dolist (ov (overlays-in from to))
        (when (eq 'outline (overlay-get ov 'invisible))
          (let* ((marker-string "*fringe-dummy*")
                 (marker-length (length marker-string))
                 (display-string "..."))
            (overlay-put ov 'help-echo "Hiddent text. M-s i s to show")
            (put-text-property 0 marker-length 'display (list 'left-fringe 'hs-marker 'fringe-face) marker-string)
            (overlay-put ov 'before-string marker-string)
            (put-text-property 0 (length display-string) 'face 'collapsed-face display-string)
            (overlay-put ov 'display display-string)
            (overlay-put ov 'evaporate t))))))

  (defvar iy-forward-comment-stop-at-outline-header t)

  (defun iy-forward-one-comment ()
    (let ((iy-forward-comment-stop-at-outline-header nil))
      ;; stop if at the begining of outline heading
      (when (not (and (bolp) (outline-on-heading-p)))
        (when (forward-comment 1)
          ;; forward-comment should not skip outline heading
          (let ((pos (point)))
            (if (and (forward-comment -1)
                     (outline-on-heading-p))
                nil
              (goto-char pos)
              t))))))

  (defun iy-backward-one-comment ()
    (let ((iy-forward-comment-stop-at-outline-header nil))
      (when (forward-comment -1)
        (if (outline-on-heading-p)
            (progn
              (end-of-line)
              nil)
          t))))

  ;; Fix outline-minor-mode conflicts with fold-dwim
  (defadvice forward-comment (around stop-at-outline-header (count) activate)
    (if (and (or outline-minor-mode (eq major-mode 'outline-mode))
             iy-forward-comment-stop-at-outline-header)
        (progn
          (while (and (> count 0) (iy-forward-one-comment))
            (setq count (1- count)))
          (while (and (< count 0) (iy-backward-one-comment))
            (setq count (1+ count)))
          (setq ad-return-value (zerop count)))
      ad-do-it))
  )

```

<a name="sec-7-95"></a>
## erlang

```cl
(define-module erlang
  (custom-set-variables
   '(erlang-indent-level 2)
   '(erlang-root-dir "/usr/lib/erlang"))

  (defun init--erlang-mode ()
    (run-hooks 'prog-mode-hook)
    (electric-pair-mode -1)
    (local-set-key (kbd "M-s /") 'erlang-man-function)
    (local-set-key (kbd "M-s ?") 'erlang-man-module))
  (add-hook 'erlang-mode-hook 'init--erlang-mode)
  (require-package 'erlang))
```

<a name="sec-7-96"></a>
## sgml

```cl
(define-module sgml
  (require-package 'zencoding-mode)
  (custom-set-variables
   '(zencoding-indentation 2))
  (defun init--sgml-mode ()
    (zencoding-mode +1)
    (setq sgml-xml-mode t))
  (add-hook 'sgml-mode-hook 'init--sgml-mode))
```

<a name="sec-7-97"></a>
## sh-mode

```cl
(define-module sh-mode
  (add-to-list 'auto-mode-alist '("\\.zsh\\'" . sh-mode)))
```

<a name="sec-7-98"></a>
## haskell-mode

```cl
(define-module haskell-mode
  (require-package 'haskell-mode)
  (custom-set-variables
   '(haskell-mode-hook '(turn-on-haskell-indentation))))
```

<a name="sec-7-99"></a>
## confluence

```cl
(define-module confluence
  (concat my-vendor-dir )
  (setq load-path (cons (concat my-vendor-dir "confluence-el") load-path))

  (autoload 'confluence-get-page "confluence" nil t)
  (autoload 'confluence-search "confluence" nil t)
  (defalias 'cgp 'confluence-get-page )
  (defalias 'cs 'confluence-search)

  (custom-set-variables
   '(confluence-url "http://localhost:8090/rpc/xmlrpc")
   '(confluence-default-space-alist (list (cons confluence-url "Wiki"))))

  (defun init--confluence-common ()
    (longlines-mode +1)

    (local-set-key (kbd "C-c C-c") 'confluence-toggle-page-content-type))

  (defun init--confluence-mode ()
    (local-set-key "\C-c" confluence-prefix-map)
    (local-set-key "\C-m" 'confluence-newline-and-indent)
    (local-set-key "\M-;" 'confluence-list-indent-dwim))

  (add-hook 'confluence-mode-hook 'init--confluence-common)
  (add-hook 'confluence-mode-hook 'init--confluence-mode)
  (add-hook 'confluence-xml-edit-mode-hook 'init--confluence-common))

```

<a name="sec-7-100"></a>
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
    (= 2 (length (frame-list))))

  (defun server--run-delete-frame-functions (frame)
    (when (server--last-frontend-frame-p)
      (mapc (lambda (f)
              (when (fboundp f)
                (funcall f)))
            server-delete-frame-functions)))

  ;; Buggy to run the functions in MacOS X
  (when (daemonp)
    (add-hook 'delete-frame-functions 'server--run-delete-frame-functions))

  (define-minor-mode server-edit-minor-mode
    "Allow C-c C-c to run server-edit without change major modes keymap"
    nil ""
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "C-c C-c") 'server-edit)
      map))

  (defun init--server-visit ()
    (when (and
           (buffer-file-name)
           (string-match-p
            "^zsh[a-zA-Z0-9]+$"
            (file-name-nondirectory (buffer-file-name))))
      (sh-mode)
      (sh-set-shell "zsh"))
    (server-edit-minor-mode +1))

  ;; run last to run on the minor mode for any enabled major modes
  (add-hook 'server-visit-hook 'init--server-visit t)

  (require-package 'edit-server)
  (custom-set-variables
   '(edit-server-default-major-mode 'markdown-mode)
   '(edit-server-url-major-mode-alist
     '(("wiki\\.groupondev\\.com" . mediawiki-mode)))
   '(edit-server-new-frame nil))

  (server-start)
  (edit-server-start))
```

<a name="sec-8"></a>
# Module Groups

```cl
(setq
 module-group-alist
 '(
   ;; minimal: just some basic keybindings
   (minimal s ido my-basic-keybindings movement-keybindings
            windows-commands buffers-commands files-commands)
   ;; basic: only necessary modules make me comfortable
   (basic minimal delete-keys-hacks char-motion
          ido-plus magit case-dwim server backup
          multiple-cursors isearch)

   ;; org-group: org modules
   (org org-basic org-files org-capture org-clock org-gtd
        org-agenda org-agenda-splash org-export org-speed org-pomodoro
        org-appt org-babel org-drill)))
```

<a name="sec-9"></a>
# Backlog

```
(require-package 'haskell-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(require-package 'erlware-mode)
```
