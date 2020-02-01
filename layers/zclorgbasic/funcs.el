(defun org-cycle-hide-drawers (state)
  "Re-hide all drawers after a visibility state change."
  (when (and (derived-mode-p 'org-mode)
             (not (memq state '(overview folded contents))))
    (save-excursion
      (let* ((globalp (memq state '(contents all)))
             (beg (if globalp
                    (point-min)
                    (point)))
             (end (if globalp
                    (point-max)
                    (if (eq state 'children)
                      (save-excursion
                        (outline-next-heading)
                        (point))
                      (org-end-of-subtree t)))))
        (goto-char beg)
        (while (re-search-forward org-drawer-regexp end t)
          (save-excursion
            (beginning-of-line 1)
            (when (looking-at org-drawer-regexp)
              (let* ((start (1- (match-beginning 0)))
                     (limit
                       (save-excursion
                         (outline-next-heading)
                           (point)))
                     (msg (format
                            (concat
                              "org-cycle-hide-drawers:  "
                              "`:END:`"
                              " line missing at position %s")
                            (1+ start))))
                (if (re-search-forward "^[ \t]*:END:" limit t)
                  (outline-flag-region start (point-at-eol) t)
                  (user-error msg))))))))))

(add-hook 'org-cycle-hook 'org-cycle-hide-drawers)

;; org toggle tag visibility
(defun org-toggle-tag-visibility (state)
  "Run in `org-cycle-hook'."
  (message "%s" state)
  (cond
   ;; global cycling
   ((memq state '(overview contents showall))
    (org-map-entries
     (lambda ()
       (let ((tagstring (nth 5 (org-heading-components)))
         start end)
     (when tagstring
       (save-excursion
         (beginning-of-line)
         (re-search-forward tagstring)
         (setq start (match-beginning 0)
           end (match-end 0)))
       (cond
        ((memq state '(overview contents))
         (outline-flag-region start end t))
        (t
         (outline-flag-region start end nil))))))))
   ;; local cycling
   ((memq state '(folded children subtree))
    (save-restriction
      (org-narrow-to-subtree)
      (org-map-entries
       (lambda ()
     (let ((tagstring (nth 5 (org-heading-components)))
           start end)
       (when tagstring
         (save-excursion
           (beginning-of-line)
           (re-search-forward tagstring)
           (setq start (match-beginning 0)
             end (match-end 0)))
         (cond
          ((memq state '(folded children))
           (outline-flag-region start end t))
          (t
           (outline-flag-region start end nil)))))))))))

(add-hook 'org-cycle-hook 'org-toggle-tag-visibility)
