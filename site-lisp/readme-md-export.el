;;; Help to export README.org to README.md

(setq make-backup-files nil)

(defadvice org-md-headline (after anchor (headline contents info) activate)
  (setq ad-return-value
        (concat "<a name=\"sec-"
                (mapconcat 'number-to-string
                           (org-export-get-headline-number headline info)
                           "-")
                "\"></a>\n"
                ad-return-value)))

(defun org-md-example-block (example-block contents info)
  (concat "```cl\n"
          (org-remove-indentation (org-element-property :value example-block))
          "```\n"))

;; Local Variables:
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; readme-md-export.el ends here
