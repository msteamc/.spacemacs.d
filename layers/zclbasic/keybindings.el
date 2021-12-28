(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; (define-key pyim-mode-map "." 'pyim-page-next-page)
;; (define-key pyim-mode-map "," 'pyim-page-previous-page)


(global-set-key [f9] 'undo)

(global-set-key "\C-c\;" 'comment-or-uncomment-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key (kbd "C-x b") 'eshell)
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "C-SPC") 'set-mark-command)

(global-set-key [f4] 'helm-projectile-grep)

(set-register ?i (cons 'file "~/Dropbox/zcl.space/index.org"))
;; define-key copied  from the init.el
(define-key evil-motion-state-map "j" 'evil-next-visual-line)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "C-j") 'evil-scroll-page-down)
(define-key evil-motion-state-map (kbd "C-k") 'evil-scroll-page-up)
(define-key evil-motion-state-map "k" 'evil-previous-visual-line)

(define-key evil-motion-state-map (kbd "C-e") 'end-of-line)
(define-key evil-motion-state-map (kbd "C-q") 'undo-tree-visualize)
;; Also in visual mode
(define-key evil-visual-state-map "j" 'evil-next-visual-line)
(define-key evil-visual-state-map "k" 'evil-previous-visual-line)
(define-key evil-visual-state-map (kbd "C-e") 'end-of-line)
(define-key evil-visual-state-map (kbd "C-q") 'undo-tree-visualize)
(define-key evil-insert-state-map (kbd "C-a") 'beginning-of-line)

(define-key evil-insert-state-map (kbd "C-d") 'delete-char)
(define-key evil-insert-state-map (kbd "C-e") 'end-of-line)
(define-key evil-insert-state-map (kbd "C-p") 'previous-line)
(define-key evil-insert-state-map (kbd "C-n") 'next-line)
(define-key evil-insert-state-map (kbd "C-k") 'kill-line)
(define-key evil-insert-state-map (kbd "C-k") nil)
(define-key evil-insert-state-map (kbd "C-q") 'undo-tree-visualize)
(define-key evil-insert-state-map (kbd "C-r") 'undo-tree-undo)

;;(define-key evil-insert-state-map (kbd "C-t") 'undo-tree-redo)
;;(global-unset-key (kbd "C-k"))
(define-key evil-insert-state-map (kbd "C-y") 'yank)
(define-key evil-insert-state-map (kbd "C-v") 'scroll-up-command)
(define-key evil-insert-state-map (kbd "C-w") 'kill-region)
(define-key evil-insert-state-map (kbd "M-y") 'helm-show-kill-ring)
(define-key evil-normal-state-map "Q" 'evil-ex)
(define-key evil-normal-state-map (kbd "C-i") 'evil-jump-forward)
(define-key evil-normal-state-map "\'" 'save-buffer)
(define-key evil-normal-state-map "m" 'spacemacs/toggle-maximize-buffer)
(define-key evil-normal-state-map "M" 'spacemacs/toggle-frame-fullscreen)
(define-key evil-normal-state-map "q" 'kill-current-buffer)
;; (define-key evil-normal-state-map "‘" 'save-buffer)
(define-key evil-normal-state-map (kbd "RET") 'save-buffer)

(spacemacs/set-leader-keys "fn" 'find-file)
(spacemacs/set-leader-keys "fp" 'ffap)
(spacemacs/set-leader-keys "oe" 'open-in-desktop)
(spacemacs/set-leader-keys "bc" 'whitespace-cleanup)
(spacemacs/set-leader-keys "fw" 'write-file)
(spacemacs/set-leader-keys "fd" 'open-in-desktop)
(spacemacs/set-leader-keys "ss" 'spacemacs/helm-swoop-region-or-symbol)
(spacemacs/set-leader-keys "sS" 'helm-swoop)
(spacemacs/set-leader-keys "xo" 'delete-blank-lines)
(spacemacs/set-leader-keys "xll" 'qiang-copy-line)
(spacemacs/set-leader-keys "by" 'spacemacs/copy-whole-buffer-to-clipboard)
(spacemacs/set-leader-keys "fm" (lambda() (interactive)(find-file "/Users/chaolongzhang/Dropbox/zorg/mstemc/mstemc.org")))
(spacemacs/set-leader-keys "fd" (lambda() (interactive)(find-file "/Users/chaolongzhang/Dropbox/zorg/mstemc/docs.org")))

(spacemacs/set-leader-keys
  "{" 'org-cdlatex-environment-indent
  )

(spacemacs/set-leader-keys
  "g," 'helm-gtags-pop-stack
  "g." 'helm-gtags-dwim
  "gb" 'helm-gtags-pop-stack
  "gc" 'helm-gtags-create-tags
  "gd" 'helm-gtags-dwim
  "gf" 'helm-gtags-select-path
  "gG" 'helm-gtags-dwim-other-window
  "gi" 'helm-gtags-tags-in-this-function
  "gl" 'helm-gtags-parse-file
  "gn" 'helm-gtags-next-history
  "gp" 'helm-gtags-previous-history
  "gr" 'helm-gtags-find-rtag
  "gR" 'helm-gtags-resume
  "gs" 'helm-gtags-select
  "gS" 'helm-gtags-show-stack
  "gt" 'helm-gtags-find-tag
  "gT" 'helm-gtags-find-tag-other-window
  "gu" 'helm-gtags-update-tags
  "gw" 'helm-gtags-dwim
  "jm" 'helm-imenu
  "sp" 'spacemacs/helm-project-smart-do-search-region-or-symbol
  "sP" 'spacemacs/helm-project-smart-do-search
  "sq" 'query-replace
  )
(spacemacs/set-leader-keys
  "bv" 'revert-buffer
  "cc" 'org-ctrl-c-ctrl-c
  "da" 'clang-format
  "db" 'helm-bookmarks
  "dc" 'calc
  "dC" 'clc-clear-the-command-window
  "dd" 'sp-unwrap-sexp
  "de" 'powerthesaurus-lookup-word-dwim
  "df" 'spaceline-toggle-helm-follow-on
  "dg" 'magit-status
  "di" 'sdcv-search-input
  "dk" 'mark-whole-buffer
  "dl" 'goto-line
  "dm" 'helm-all-mark-rings
  "dr" 'repeat-complex-command
  "ds" 'projectile-save-project-buffers
  "dt" 'org-insert-structure-template
  "dp" 'realgud:ipdb
  "dq" 'sdcv-quit
  "du" 'universal-coding-system-argument
  "dv" 'view-mode
  "dw" 'delete-whitespace-rectangle
  "dx" 'describe-current-coding-system
  "dy" 'revert-buffer-with-coding-system
  "dz" 'set-buffer-file-coding-system
  "pa" 'helm-projectile-find-other-file
  "pb" 'helm-projectile-switch-to-buffer
  "pf" 'helm-projectile-find-file-dwim
  "pr" 'helm-projectile-recentf
  "pp" 'helm-projectile-switch-project
  "ph" 'helm-projectile
  "SPC" 'helm-M-x
  "tb"  'org-toggle-blocks
  "tn"  'display-line-numbers-mode
  )

(spacemacs/set-leader-keys-for-major-mode 'dired-mode
  "d" 'wdired-change-to-wdired-mode
  "s" 'org-agenda-schedule
  )

(spacemacs/set-leader-keys-for-major-mode 'org-mode
  "k" 'org-edit-special
  )

(spacemacs/set-leader-keys-for-major-mode 'c-mode
  "f" 'c-mark-function
  "i" 'helm-gtags-dwim
  "c" 'compile
  "d" 'gud-gdb
  "q" 'shell-command
  "a" 'beginning-of-defun
  "e" 'end-of-defun
  "o" 'helm-gtags-pop-stack
  )

(spacemacs/set-leader-keys-for-major-mode 'c++-mode
  "f" 'c-mark-function
  "i" 'helm-gtags-dwim
  "a" 'beginning-of-defun
  "e" 'end-of-defun
  "o" 'helm-gtags-pop-stack
  )
(spacemacs/set-leader-keys
  "ajj" 'org-journal-new-entry
  "ajj" 'org-journal-new-entry
  "ajV" 'org-journal-display-entry
  "ajs" 'org-journal-search
  "ajS" 'search-all-journals
  "ajn" 'org-journal-next-entry
  "ajp" 'org-journal-previous-entry
  "ajw" 'org-journal-search-calendar-week
  "ajm" 'org-journal-search-calendar-month
  "ajy" 'org-journal-search-calendar-year
  )
