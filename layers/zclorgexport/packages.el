(setq zclorgexport-packages
      '(
        (org )
        ox-hugo
              ))

(defun zclorgexport/init-ox-hugo()
  (use-package ox-hugo
    :ensure t
    :after ox
    :init
    ))
(defun zclorgexport/post-init-org()
  (use-package org
    ;;:defer t
    :init
    ))
