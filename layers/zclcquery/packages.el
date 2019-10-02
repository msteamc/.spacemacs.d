(setq zclcquery-packages
      '(
        lsp-mode
        lsp-ui
        company-lsp
        cquery
        ))

(defun zclcquery/init-lsp-mode()
    (use-package lsp-mode
      :defer t
      :init
      (progn
        ;;
        )))
(defun zclcquery/init-lsp-ui()
  (use-package lsp-ui
    ;;:defer t
    :init
    (progn

      )))


(defun zclcquery/init-company-lsp()
  (use-package company-lsp
    :defer t
    :init
    (progn

      )))

(defun zclcquery/init-cquery()
  (use-package cquery
    :defer t
    :init
    (progn
      )))
