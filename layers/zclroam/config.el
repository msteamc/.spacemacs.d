;; (setq org-journal-dir "~/Dropbox/zorg/Journal/")
;; org journal(do not delete and must appear here)
;; https://github.com/bastibe/org-journal/issues/20
(with-eval-after-load 'org-journal
  (setq org-journal-file-type 'weekly)
  (setq org-journal-dir "~/Dropbox/zorg/Journal/")
  ;; When =org-journal-file-pattern= has the default value, this would be the regex.
  (setq org-agenda-file-regexp "\\`\\\([^.].*\\.org\\\|[0-9]\\\{8\\\}\\\(\\.gpg\\\)?\\\)\\'")
  (add-to-list 'org-agenda-files org-journal-dir)
  (setq org-journal-enable-agenda-integration t)
  )
;;(add-to-list 'load-path "~/.spacemacs.d/local/org-roam-ui")
;;(load-library "org-roam-ui")
;; org roam
;; (add-hook 'org-mode-hook 'org-roam-mode)
;; (setq org-roam-directory "~/Dropbox/zorg/roam/")
