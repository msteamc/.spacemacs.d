(setq zclorggtd-packages
      '(
        (org-clock-convenience)
        (org )))

(defun zclorggtd/post-init-org()
  (use-package org
    ;;:defer t
    :init
    ))


(defun zclorggtd/init-org-clock-convenience()
  (use-package org-clock-convenience
    ;;:defer t
    :init
    :bind (:map org-agenda-mode-map
   	            ("<f9>" . org-clock-convenience-timestamp-up)
   	            ("<f10>" . org-clock-convenience-timestamp-down)
   	            ("<f11>" . org-clock-convenience-fill-gap)
   	            ("<f12>" . org-clock-convenience-fill-gap-both))
    ))
