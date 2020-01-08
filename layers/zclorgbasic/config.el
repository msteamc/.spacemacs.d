(with-eval-after-load 'org
  (setq org-directory "~/zorg/")
  (setq org-src-fontify-natively t)
  (setq diary-mail-addr "makestemclear@gmail.com")
  (setq org-default-notes-file  "~/zorg/output/znotes/znotes.org")
  ;;(spacemacs/set-leader-keys "oSPC" 'bh/clock-in-last-task)
  ;; ❀❤♫♠♣♥♦♡♢♤♧
  ;; (setq org-bullets-bullet-list '("☯" "☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷" "☭" "❀" "☯" "⊙" ))
  ;;(setq org-bullets-bullet-list '("☰" "☷" "☯" "☭"))
  (setq org-ellipsis "...");Other interesting characters are ▼, ↴, and ⋱.▼
    ;;(setq org-bullets-bullet-list '("✿"  "♣" "♧" "❀"))
  ;;  "➢" "➣" "➤" "≪", "≫", "«", "»"
  ;; "✡" "✽" "✲" "✱" "✻" "✼" "✽" "✾" "✿" "❀" "❁" "❂" "❃" "❄" "❅" "❆" "❇"
  ;;  "○" "☉" "◎" "◉" "○" "◌" "◎" "●" "◦" "◯" "❍" "￮" "⊙" "⊚" "⊛" "∙" "∘"
  ;;"☯" "☰" "☱" "☲" "☳" "☴" "☵" "☶" "☷"
  ;; Org

  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
  (add-hook 'org-mode-hook 'turn-on-font-lock)
  ;; Org
  (add-hook 'org-mode-hook
            (lambda ()
              ;; Enable fill column indicator
              ;;(fci-mode t)
              ;; Turn off line numbering, it makes org so slow
              (linum-mode -1)
              ;; Set fill column to 79
              (setq fill-column 80)
              (setq org-tags-column -80)
              (setq org-agenda-tags-column -90)
              ;; Enable automatic line wrapping at fill column
              (auto-fill-mode t)
              (org-indent-mode nil)))
  ;; (add-hook 'org-mode-hook
  ;;           '(lambda ()
  ;;              (delete '("\\.pdf\\'" . default) org-file-apps)
  ;;              (add-to-list 'org-file-apps '("\\.pdf\\'" . "qpdfview %s"))))

  (org-cycle-hide-drawers 'all)
  (setq org-hide-macro-markers t)
  ;; Replace org-set-tags with org-set-tags-command in keybinding
  (spacemacs/set-leader-keys-for-major-mode 'org-mode ":" 'org-set-tags-command)

  (defvar org-blocks-hidden nil)

  (defun org-toggle-blocks ()
    (interactive)
    (if org-blocks-hidden
        (org-show-block-all)
      (org-hide-block-all))
    (setq-local org-blocks-hidden (not org-blocks-hidden)))

  (add-hook 'org-mode-hook 'org-toggle-blocks)

  (define-key org-mode-map (kbd "C-c t") 'org-toggle-blocks)
  (setq org-startup-indented t
        org-hide-leading-stars nil)
  )
