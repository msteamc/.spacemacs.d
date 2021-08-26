(setq zclroam-packages
      '(
        org-journal
        calendar
        org-roam
        ))

(defun zclroam//set-global-keys ()
  (spacemacs/declare-prefix "aj" "zclroam")
  (spacemacs/set-leader-keys "ajj" 'org-journal-new-entry)
  (spacemacs/set-leader-keys "ajv" 'view-journal)
  (spacemacs/set-leader-keys "ajV" 'org-journal-display-entry)
  (spacemacs/set-leader-keys "ajs" 'org-journal-search)
  (spacemacs/set-leader-keys "ajS" 'search-all-journals)
  (spacemacs/set-leader-keys "ajn" 'org-journal-next-entry)
  (spacemacs/set-leader-keys "ajp" 'org-journal-previous-entry)
  (spacemacs/set-leader-keys "ajw" 'org-journal-search-calendar-week)
  (spacemacs/set-leader-keys "ajm" 'org-journal-search-calendar-month)
  (spacemacs/set-leader-keys "ajy" 'org-journal-search-calendar-year)
  )

(defun zclroam//set-major-mode-keys ()
  (spacemacs/set-leader-keys-for-major-mode 'org-journal-mode
    "jn" 'org-journal-open-next-entry)
  (spacemacs/set-leader-keys-for-major-mode 'org-journal-mode
    "jp"  'org-journal-open-previous-entry)
  (spacemacs/set-leader-keys-for-major-mode 'org-journal-mode
    "jj"  'org-journal-new-entry)
  (spacemacs/set-leader-keys-for-major-mode 'org-journal-mode
    "js"  'org-journal-search)
  (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
    "Jn" 'org-journal-open-next-entry)
  (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
    "Jp"  'org-journal-open-previous-entry)
  (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
    "Jj"  'org-journal-new-entry)
  (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode
    "Js"  'org-journal-search)
  )

(defun zclroam//set-calendar-keys ()
  (define-key calendar-mode-map "Jj" 'org-journal-new-date-entry)
  (define-key calendar-mode-map "Jv" 'org-journal-read-entry)
  (define-key calendar-mode-map "JV" 'org-journal-display-entry)
  (define-key calendar-mode-map "Jn" 'org-journal-next-entry)
  (define-key calendar-mode-map "Jp" 'org-journal-previous-entry)
  (define-key calendar-mode-map "Js" 'org-journal-search)
  (define-key calendar-mode-map "JS" 'org-journal-search-forever)
  (define-key calendar-mode-map "Jw" 'org-journal-search-calendar-week)
  (define-key calendar-mode-map "Jm" 'org-journal-search-calendar-month)
  (define-key calendar-mode-map "Jy" 'org-journal-search-calendar-year)
  )

(defun zclroam/post-init-org-journal ()
  (use-package org-journal
    :defer t
    :init
    (progn
      (zclroam//set-global-keys)
      (setq spacemacs-org-journal-mode-map (copy-keymap spacemacs-org-mode-map))
      (spacemacs//init-leader-mode-map 'org-journal-mode 'spacemacs-org-journal-mode-map)
      (zclroam//set-major-mode-keys)
      )
    )
  )

(defun zclroam/post-init-org-roam ()
  (use-package org-roam
    :ensure t
    :init
    (setq org-roam-v2-ack t)
    :custom
    (org-roam-directory (file-truename "~/Dropbox/zorg/roam/"))
    (org-roam-completion-everywhere t)
    :bind (("C-c n l" . org-roam-buffer-toggle)
           ("C-c n f" . org-roam-node-find)
           ("C-c n g" . org-roam-graph)
           ("C-c n i" . org-roam-node-insert)
           ("C-c n c" . org-roam-capture)
           ;; Dailies
           ("C-c n j" . org-roam-dailies-capture-today))
    :config
    ;; (org-roam-db-autosync-mode)
    ;; If using org-roam-protocol
    ;; (require 'org-roam-protocol)
    )
  )


(defun zclroam/init-calendar ()
  (use-package calendar
    :config
    (progn
      (zclroam//set-calendar-keys)
      )
    )
  )
