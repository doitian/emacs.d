;;; emacs-rails-hacks.el

;; Thank you, I'll handle it myself
(defvar rails-auto-mode-alist nil)

(defun rails-nav:goto-assets-stylesheets ()
  "Go to stylesheets."
  (interactive)
  (rails-nav:goto-file-with-menu "app/assets/stylesheets/" "Go to stylesheet.." "s?[ac]ss" t))

(defun rails-nav:goto-assets-javascripts ()
  "Go to JavaScripts."
  (interactive)
  (rails-nav:goto-file-with-menu "app/assets/javascripts/" "Go to javascripts.." "\\(js\\|coffee\\)" t))

(defun rails-find:assets-stylesheets ()
  "Run find-file in Rails \"assets/stylesheets\" dir"
  (interactive)
  (let ((default-directory (rails-core:file "app/assets/stylesheets")))
    (call-interactively 'ido-find-file)))

(defun rails-find:assets-javascripts ()
  "Run find-file in Rails \"assets/javascripts\" dir"
  (interactive)
  (let ((default-directory (rails-core:file "app/assets/javascripts")))
    (call-interactively 'ido-find-file)))

;;;###autoload
(defun rails-hacks-rails-loaded-p ()
  "Whether `rails' has already been loaded"
  (boundp 'rails-version))

;;;###autoload
(defvar rails-hacks-rails-load-hook nil
  "Hook to run after `rails' is loaded")

;;;###autoload
(defun rails-hacks-rails-load ()
  "Load `rails'"
  (or
   (rails-hacks-rails-loaded-p)
   (when (require 'rails nil t)
     (rails-hacks--after-load-rails)
     t)))

;;;###autoload
(defun rails-hacks-maybe-turn-on ()
  (when (rails-project:root)
    (rails-hacks-rails-load)
    (rails-minor-mode t)
    (when (buffer-file-name)
      (rails-apply-for-buffer-type))))

;;;###autoload
(defun rails-hacks-maybe-turn-on-only-minor-mode ()
  (when (rails-project:root)
    (rails-hacks-rails-load)
    (rails-minor-mode t)))

(defun rails-hacks--find-hook-p (hook)
  (eq 'rails-project:root
      (car-safe (car-safe (cdr-safe (car-safe (car-safe (cdr-safe (car-safe (cdr-safe (cdr-safe hook)))))))))))

(defun rails-hacks--dired-mode-hook-p (hook)
  (eq 'rails-project:root
      (car-safe (car-safe (cdr-safe (car-safe (cdr-safe (cdr-safe hook))))))))

(defun rails-hacks--delete-hooks ()
  (setq find-file-hooks
        (delete-if 'rails-hacks--find-hook-p find-file-hooks))
  (setq dired-mode-hook
        (delete-if 'rails-hacks--dired-mode-hook-p dired-mode-hook)))

(defadvice rails-core:prepare-command (around rails-hacks--zeus-maybe (command) activate)
  (if (or (file-exists-p (rails-core:file ".zeus.sock"))
          (file-exists-p (rails-core:file "zeus.json")))
      (setq ad-return-value (concat "zeus-maybe " command))
    ad-do-it))

(defun rails-hacks--bindings ()
  ;; use rspec mode to run test
  (define-key rails-minor-mode-map  (kbd "C-c C-c #")  nil)
  (define-key rails-minor-mode-map  (kbd "C-c C-c .")  nil)
  (define-key rails-minor-mode-map  (kbd "C-c C-c /")  nil)
  (define-key rails-minor-mode-map  (kbd "C-c C-c z")  nil)

  (define-key rails-minor-mode-map  (kbd "C-c C-c SPC")  'rails-lib:run-primary-switch)
  (define-key rails-minor-mode-map  (kbd "C-c C-c <return>")  'rails-lib:run-secondary-switch)
  (define-key rails-minor-mode-map  (kbd "C-c C-c g j")  'rails-nav:goto-assets-javascripts)
  (define-key rails-minor-mode-map  (kbd "C-c C-c g s")  'rails-nav:goto-assets-stylesheets)
  (define-key rails-minor-mode-map  (kbd "C-c C-c f j")  'rails-find:assets-javascripts)
  (define-key rails-minor-mode-map  (kbd "C-c C-c f s")  'rails-find:assets-stylesheets)
  (define-key rails-minor-mode-map  (kbd "<f9>") nil)
  (global-set-key (kbd "C-c C-c j") nil)
  (global-set-key (kbd "C-c C-c") nil))

(defun rails-hacks--after-load-rails ()
  (rails-hacks--delete-hooks)
  (rails-hacks--bindings)
  (run-hooks 'rails-hacks-rails-load-hook))

(when (require 'rails-project nil t)
  (add-hook 'ruby-mode-hook 'rails-hacks-maybe-turn-on)
  (add-hook 'prog-mode-hook 'rails-hacks-maybe-turn-on)
  (add-hook 'magit-status-mode-hook 'rails-hacks-maybe-turn-on-only-minor-mode)
  (add-hook 'dired-mode-hook 'rails-hacks-maybe-turn-on-only-minor-mode))

(provide 'emacs-rails-hacks)
;;; emacs-rails-hacks.el ends here
