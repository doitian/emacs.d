;;; eproject-plus.el --- Extend eproject

(require 'eproject nil t)
(require 'eproject-extra nil t)

(eval-when-compile (require 'cl))

(custom-set-variables
 '(eproject-completing-read-function (quote eproject-plus-completing-read-function)))

(defun eproject-plus-completing-read-buffer (prompt buffers)
  (let ((name (completing-read prompt (mapcar 'buffer-name buffers) nil t)))
    (when (and name (not (zerop (length name)))) (get-buffer name))))

(defun eproject-plus-completing-read-function (prompt choices)
  "Rewrite `eproject--completing-read' to handle buffers completing read"
  (if (bufferp (car choices))
      (eproject-plus-completing-read-buffer prompt choices)
    (completing-read prompt choices nil t)))

(defvar eproject-plus--attribute-history nil)
(defun eproject-plus-completing-read-attribute (&optional root)
  "Completing attribute from current project"
  (completing-read
   "attribute: "
   (mapcar (lambda (name) (substring (symbol-name name) 1))
           (eproject-plus-plist-keys (eproject-plus-attributes (or root (eproject-root)))))
   nil nil nil 'eproject-plus--attribute-history))

(defface eproject-plus-mode-line-project-name-face
  '((t (:inherit font-lock-string-face :bold t)))
  "Face for displaying the project name in the modeline." :group 'eproject)

(defun eproject-plus-ctags-command (&optional root)
  (let ((ctags (eproject-attribute :ctags (or root (eproject-root)))))
    (cond ((eq ctags 'rails) "ctags -u -e -f TAGS --tag-relative -R app lib vendor")
          (t ctags))))

(defun eproject-plus-maybe-create-tags-table ()
  (let* ((root (eproject-root))
         (ctags (eproject-plus-ctags-command root))
         (default-directory root))
    (when (and root ctags (eproject-attribute :ctags-first root))
      (ignore-errors
        (shell-command ctags)
        (visit-tags-table (concat root "TAGS") t)))))

(defun eproject-plus-visit-tags-table (&optional create)
  (interactive "P")
  (let* ((root (eproject-root))
         (ctags (eproject-plus-ctags-command root))
         (file (concat root "TAGS")))
    (when root
      (when (and create ctags)
        (let ((default-directory root))
          (shell-command ctags)))
      (when (file-exists-p file)
        (ignore-errors
          (visit-tags-table file t))))))

(defun* eproject-plus-attributes (&optional (root (eproject-root)))
  "Get attributes for the eproject ROOT
ROOT defaults to the current buffer's project-root."
  (cdr (assoc root eproject-attributes-alist)))

(defun* eproject-plus-pp-attributes (&optional (root (eproject-root)))
  "Print attributes for the eproject ROOT
ROOT defaults to the current buffer's project-root."
  (interactive)
  (pp-display-expression (eproject-plus-attributes root) "*eproject attributes*"))

(defun eproject-plus-insert-attributes (&optional root)
  "Insert attributes into file"
  (interactive)
  (let ((orig (eproject-plus-attributes (or root (eproject-root))))
        attributes key value)
    (while orig
      (setq key (car orig))
      (setq orig (cdr orig))
      (setq value (car orig))
      (setq orig (cdr orig))

      (when (and (not (member key '(:type
                                    :config-file
                                    :file-name-map
                                    :name
                                    :type
                                    :loaded-from-config-file)))
                 (not (member key attributes))
                 )
        (setq value
              (cond
               ((not value) value)
               ((or (listp value) (symbolp value)) (list 'quote value))
               (t value)))
        (setq attributes (plist-put attributes key value))))
    (erase-buffer)
    (insert
     (substring (pp-to-string attributes) 1 -2))
    (insert "\n")))

(defun eproject-plus-plist-keys (plist)
  "Get all keys in plist"
  (let (result)
    (while plist
      (setq result (cons (car plist) result))
      (setq plist (cdr (cdr plist))))
    result))

(defun eproject-plus-set-attribute (key value &optional root)
  "Set attribute KEY to VALUE for the eproject ROOT
ROOT defaults to the current buffer's project-root."
  (interactive (let ((key-name (eproject-plus-completing-read-attribute)))
                 (list
                  (intern (concat ":" key-name))
                  (read-from-minibuffer
                   (concat key-name ": ")
                   (prin1-to-string (eproject-attribute (intern (concat ":" key-name)) (eproject-root)))
                   nil t))))
  (setf (getf (cdr (assoc (or root (eproject-root)) eproject-attributes-alist)) key) value)
  value)

(defun eproject-plus-guess-compile-command (root)
  (let ((default-directory root))
    (cond
     ((or (file-exists-p "Makefile") (file-exists-p "makefile"))
      "make -k")
     ((file-exists-p "Rakefile")
      "rake")
     ((file-exists-p "pom.xml")
      "mvn test")
     ((file-exists-p "conf/routes")
      "play auto-test")
     ((or (file-exists-p "build.sbt") (file-exists-p "project/Build.scala"))
      "sbt test")
     ((file-exists-p "project.clj")
      "lein test")
     ((file-exists-p "build.xml")
      "ant")
     (t nil))))

(defun eproject-plus-detect-project (&optional file)
  (let ((file (or file (eproject--buffer-file-name)))
        bestroot besttype)
    (loop for type in (eproject--all-types)
          do (let ((root (eproject--run-project-selector type file)))
               (when (and root
                          (or (not bestroot)
                              ;; longest filename == best match (XXX:
                              ;; need to canonicalize?)
                              (> (length root) (length bestroot))))
                 (setq bestroot root)
                 (setq besttype type))))
    (cons bestroot besttype)))

(defun eproject-list-project-files-by-git (root buffer)
  (let ((default-directory root))
    (with-current-buffer buffer
      (call-process "git" nil (list (current-buffer) nil) nil
                    "--no-pager" "ls-files" "--full-name" "-c" "-o" "--exclude-standard"))))

(defun eproject-list-project-files-by-hg (root buffer)
  (let ((default-directory root))
    (with-current-buffer buffer
      (call-process "hg" nil (list (current-buffer) nil) nil "manifest"))))

(defun eproject-list-project-files-by-bzr (root buffer)
  (let ((default-directory root))
    (with-current-buffer buffer
      (call-process "bzr" nil (list (current-buffer) nil) nil
                    "ls" "--versioned"))))

;;;###autoload
(defun eproject-plus--cache-buffer (root)
  (get-buffer (format "*eproject cache[ %s ]*" root)))

(defun eproject-plus--cache-buffer-create (root)
  (get-buffer-create (format "*eproject cache[ %s ]*" root)))

(defun eproject-plus--cache-file (root)
  (expand-file-name ".eproject-files" root))

(defun eproject-plus--load-cache-file (root)
  (with-current-buffer (eproject-plus--cache-buffer root)
    (erase-buffer)
    (let ((file (eproject-plus--cache-file root)))
      (when (file-exists-p file)
        (insert-file-contents file)))))

(defun* eproject-plus-list-project-files-with-cache (&optional (root (eproject-root-safe)) force)
  (when root
    (let ((default-directory root)
          (relevant-files (eproject-attribute :relevant-files root))
          (file (eproject-plus--cache-file root))
          (buffer (eproject-plus--cache-buffer root)))
      (unless buffer
        (setq buffer (eproject-plus--cache-buffer-create root))
        (if (file-exists-p file)
            (eproject-plus--load-cache-file root)
          (with-current-buffer buffer
            (if (symbolp relevant-files)
                (funcall
                 (intern (concat "eproject-list-project-files-by-" (prin1-to-string relevant-files)))
                 root
                 (current-buffer))
              (insert
               (mapconcat 'file-relative-name (eproject-list-project-files root) "\n")))
            (write-region (point-min) (point-max) file))))
      (with-current-buffer (eproject-plus--cache-buffer root)
        (split-string (buffer-string) "\n")))))

(defun* eproject-plus-invalidate-project-files-cache (&optional (root (eproject-root-safe)))
  (interactive)
  (when root
    (let* ((file (eproject-plus--cache-file root))
           (buffer (eproject-plus--cache-buffer root)))
      (when buffer (kill-buffer buffer))
      (when (file-exists-p file) (delete-file file)))))

(defun eproject-plus-find-file-with-cache (&optional force)
  "Present the user with a list of files in the current project.
to select from, open file when selected."
  (interactive "P")
  (let* ((root (ignore-errors (eproject-root)))
         (default-directory root)
         (files (and root (eproject-plus-list-project-files-with-cache root force))))
    (when files
      (find-file
       (ido-completing-read
        "Project file: "
        (mapcar
         'file-relative-name
         files))))))

(defun eproject-plus-open-session ()
  (interactive)
  (let ((dir (eproject-root-safe)))
    (when dir
      (when desktop-save-mode
        (desktop-change-dir dir))
      (dired dir))))

(defun eproject-plus-open-project (&optional force)
  (interactive "P")
  (let ((current-prefix-arg (if force 8 4)))
    (call-interactively 'magit-status)))

(defun eproject-plus-eshell-toggle ()
  (interactive)
  (eshell-toggle (ignore-errors (concat "*eshell*<" (eproject-name) ">"))))

(defun eproject-plus-eshell-here ()
  (interactive)
  (eshell-here (ignore-errors (concat "*eshell*<" (eproject-name) ">"))))

(defun eproject-plus-term-toggle ()
  (interactive)
  (term-toggle (ignore-errors (concat "*term*<" (eproject-name) ">"))))

(defun eproject-plus-term-here ()
  (interactive)
  (term-here (ignore-errors (concat "*term*<" (eproject-name) ">"))))

(defun eproject-root-safe ()
  (ignore-errors (eproject-root)))

(defun eproject-plus-compile ()
  "My compile wrapper"
  (interactive)
  (defvar compile-history nil)
  (let* ((compile-command (if eproject-mode (eproject-attribute :compile-command) compile-command))
         (compile-history (if eproject-mode
                              (or (eproject-attribute :compile-history)
                                  (list compile-command))
                            compile-history))
         (default-directory (eproject-root)))
    (call-interactively 'compile)
    (let ((map (make-sparse-keymap)))
      (define-key map (kbd "r") (eval `(lambda () (interactive)
                                         (let ((default-directory ,default-directory))
                                           (compile ,(car compile-history))))))
      (global-set-key (kbd "M-s v") map))
    (when eproject-mode
      (eproject-plus-set-attribute :compile-history compile-history)
      (eproject-plus-set-attribute :compile-command compile-command))))

(defun eproject-plus-android-manifest ()
  "AndroidManifest.xml"
  (let ((file (concat (eproject-root-safe) "AndroidManifest.xml")))
    (when (file-exists-p file) file)))

(defun eproject-plus-android-package ()
  "Android package name"
  (let ((manifest (eproject-plus-android-manifest)))
    (when manifest
      (or (eproject-attribute :android-package)
          (let ((root (car (xml-parse-file manifest))) package)
            (setq package (xml-get-attribute root 'package))
            (eproject-plus-set-attribute :android-package package)
            package)))))

(defun eproject-plus-android-main-activities ()
  "Android package name"
  (let ((manifest (eproject-plus-android-manifest)))
    (when manifest
      (or (eproject-attribute :android-main-activities)
          (let ((root (car (xml-parse-file manifest))) activites)

            (mapc
             (lambda (node)
               (when (xml-get-attribute
                      (car
                       (xml-get-children
                        (car (xml-get-children node 'intent-filter))
                        'action))
                      'android:name)
                 (setq activites
                       (cons (xml-get-attribute node 'android:name) activites))))
             (xml-get-children
              (car (xml-get-children (car (xml-parse-file "/home/ian/codebase/android-command-line/AndroidManifest.xml")) 'application))
              'activity))

            (eproject-plus-set-attribute :android-main-activities activites)
            activites)))))

(defvar eproject-plus-android-start-app-hist nil)
(defun eproject-plus-android-start-app (activity)
  (interactive (list (let ((activites (eproject-plus-android-main-activities)))
                       (when activites
                         (ido-completing-read "Activity: " activites nil t nil 'eproject-plus-android-start-app-hist)))))
  (when activity
    (start-process "*adb am start*" nil "adb"
                   "shell" "am" "start" (concat (eproject-plus-android-package) "/." activity))))

(defun eproject-plus-edit-dot-eproject (&optional other-window)
  (interactive "p")
  (let ((file (expand-file-name ".eproject" (eproject-root))))
    (if other-window
        (find-file-other-window file)
      (find-file file))))

(defun eproject-plus-completing-read-proeprty (property &optional no-insert)
  "Completing read from eproject attribute"
  (interactive (list (eproject-plus-completing-read-attribute (eproject-root))
                     current-prefix-arg))
  (let ((result (completing-read
                 (concat property ": ")
                 (eproject-attribute (intern (concat ":" property))))))
    (unless no-insert
      (insert result))
    result))

(defun eproject-plus-run ()
  "Completion read :commands and run."
  (let* ((choices (eproject-attribute :commands))
         (key (completing-read
               "Command: "
               (mapcar 'car choices)
               nil t)))
    (let ((default-directory (eproject-root)))
      (compile (mapconcat 'identity (assoc-default key choices nil nil) "; ")
               current-prefix-arg))))

;;;###autoload
(defun yas-epp (property &optional prompt)
  (defvar yas-moving-away-p)
  (defvar yas-modified-p)

  (unless (or yas-moving-away-p
              yas-modified-p)
    (let* ((root (eproject-root-safe))
           (choices (when root (eproject-attribute property root)))
           (choice (completing-read
                    (concat
                     (or prompt (substring (symbol-name property) 1)) ": ")
                    choices)))
      (when (and root (not (member choice choices)))
        (eproject-plus-set-attribute property (cons choice choices) root))
      choice)))

(defadvice eproject-maybe-turn-on (around eproject-plus-ignore-errors)
  (ignore-errors
    ad-do-it))

(defadvice eproject--buffer-file-name (after eproject-plus-guess-directory)
  (when (and (boundp 'org-src-mode) org-src-mode
             (boundp 'org-edit-src-beg-marker) org-edit-src-beg-marker)
    (setq ad-return-value (buffer-file-name (marker-buffer org-edit-src-beg-marker))))
  (unless ad-return-value
    (setq ad-return-value
          (cond ((or (eq major-mode 'term-mode)
                     (eq major-mode 'eshell-mode)
                     (string-match-p "^magit-" (prin1-to-string major-mode)))
                 (expand-file-name default-directory))
                (t nil)))))

(defadvice eproject-list-project-files (around eproject-plus-search-by-backend (&optional root))
  (let* ((root (or root (eproject-root)))
         (relevant-files (eproject-attribute :relevant-files root)))
    (if (symbolp (eproject-attribute :relevant-files root))
        (setq ad-return-value
              (with-temp-buffer
                (funcall
                 (intern (concat "eproject-list-project-files-by-" (prin1-to-string relevant-files)))
                 root
                 (current-buffer))
                (let ((default-directory root))
                  (mapcar 'file-relative-name
                          (split-string (buffer-string) "\n")))))
      ad-do-it)))

(defun eproject-plus--init ()
  "Setup mode line."
  (make-local-variable 'mode-line-buffer-identification)
  (setq mode-line-buffer-identification
        (nconc
         (list
          (propertize
           (eproject-name)
           'face 'eproject-plus-mode-line-project-name-face)
          " ")
         (mapcar 'identity (default-value 'mode-line-buffer-identification)))))

(defmacro eproject-plus-defun-in-project-root (func)
  `(defun ,(intern (concat (symbol-name func) "-in-project-root")) ()
     ,(concat "Call " (symbol-name func) " in project root")
     (interactive)
     (let ((default-directory (eproject-root)))
       (call-interactively (quote ,func)))))

(eproject-plus-defun-in-project-root ido-find-file)
(eproject-plus-defun-in-project-root rgrep)
(eproject-plus-defun-in-project-root git-grep)
(eproject-plus-defun-in-project-root shell-command)

;; use git backend by default

(mapc
 (lambda (type)
   (when (member (car type) '(generic-git generic-hg generic-bzr))
     (setf (car (last type))
           (plist-put (car (last type))
                      :relevant-files (intern (substring (symbol-name (car type)) 8))))))
 eproject-project-types)


(setq
 eproject-extra-attributes
 '(
   ((lambda (root) t)
    (:compile-command eproject-plus-guess-compile-command))))

;; redefine the function
(fset 'eproject-detect-project 'eproject-plus-detect-project)

(add-hook 'eproject-first-buffer-hook 'eproject-plus-maybe-create-tags-table)
(add-hook 'eproject-mode-hook 'eproject-plus-visit-tags-table)
(add-hook 'eproject-mode-hook 'eproject-plus--init)
(ad-enable-advice 'eproject--buffer-file-name 'after 'eproject-plus-guess-directory)
(ad-enable-advice 'eproject-maybe-turn-on 'around 'eproject-plus-ignore-errors)
(ad-enable-advice 'eproject-list-project-files 'around 'eproject-plus-search-by-backend)
(ad-activate 'eproject--buffer-file-name)
(ad-activate 'eproject-maybe-turn-on)
(ad-activate 'eproject-list-project-files)

(add-hook 'org-src-mode-hook 'eproject-maybe-turn-on)
(add-hook 'magit-mode-hook 'eproject-maybe-turn-on)
(add-hook 'term-mode-hook 'eproject-maybe-turn-on)
(add-hook 'eshell-mode-hook 'eproject-maybe-turn-on)

(defcustom eproject-plus-keymap-prefix "M-s p"
  "Prefix for eproject plus commands" :group 'eproject)

(let ((map (make-sparse-keymap)))
  (define-key map "i" 'eproject-plus-invalidate-project-files-cache)
  (define-key map "P" 'eproject-plus-open-project)
  (define-key map "p" 'eproject-revisit-project)
  (define-key map "s" 'eproject-plus-open-session)
  (define-key map "c" 'eproject-plus-compile)
  (define-key map "x" 'eproject-plus-run)
  (define-key map "b" 'eproject-switch-to-buffer)
  (define-key map "\C-b" 'eproject-ibuffer)
  (define-key map "\C-f" 'ido-find-file-in-project-root)
  (define-key map "f" 'eproject-plus-find-file-with-cache)
  (define-key map "o" 'eproject-plus-find-file-with-cache)
  (define-key map "e" 'eproject-plus-eshell-toggle)
  (define-key map "E" 'eproject-plus-eshell-here)
  (define-key map "t" 'eproject-plus-term-toggle)
  (define-key map "T" 'eproject-plus-term-here)
  (define-key map "r" 'rgrep-in-project-root)
  (define-key map "a" 'ag-project-at-point)
  (define-key map "A" 'ag-regexp-project-at-point)
  (define-key map "g" 'git-grep-in-project-root)
  (define-key map "!" 'shell-command-in-project-root)
  (define-key map "?" 'eproject-plus-pp-attributes)
  (define-key map "=" 'eproject-plus-set-attribute)
  (define-key map "/" 'eproject-plus-completing-read-proeprty)
  (define-key map "d" 'eproject-plus-android-start-app)
  (define-key map "." 'eproject-plus-edit-dot-eproject)

  ;; generate  C-update
  (define-key map "'" 'eproject-plus-visit-tags-table)

  (define-key eproject-mode-map (kbd eproject-plus-keymap-prefix) map))

(define-key eproject-mode-map "\C-c" nil)
(define-key dot-eproject-mode-map (kbd "C-c i") 'eproject-plus-insert-attributes)

(provide 'eproject-plus)
;;; eproject-plus.el ends here
