(setq org-journal-dir "~/Dropbox/zorg/Journal/")
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
