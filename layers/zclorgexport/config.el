(with-eval-after-load 'org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;wo de;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq org-src-fontify-natively t)
  (setq org-hide-emphasis-markers nil)
  ;;automatically delete this auxiliary files after export
  (setq org-export-coding-system 'utf-8)
    ;; set the exported latex file using the user defined labels
  (setq org-latex-prefer-user-labels t);
  (setq org-latex-logfiles-extensions (quote ("lof" "lot" "tex~" "aux" "idx"  "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl")))
  ;; open docx files in default application (ie msword)
  (setq org-file-apps
        '(("\\.docx\\'" . default)
          ("\\.mm\\'" . default)
          ("\\.x?html?\\'" . default)
          ("\\.pdf\\'" . default)
          (auto-mode . emacs)))
;;;;;;;;;;;;;;;;;;;;;;;;org export latex;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;;need to add #+LaTeX_CLASS at the beginning
  (setq org-list-allow-alphabetical t)
  (setq org-highlight-latex-and-related '(latex script entities))
  ;; Explicitly load required exporters
;;;###autoload
;;  (require 'ox-html)
;;;###autoload
;;  (require 'ox-latex)
;;;###autoload
;;  (require 'ox-ascii)
  (setq org-html-table-use-header-tags-for-first-column t);
  (add-hook 'org-mode-hook
            (lambda () (setq truncate-lines nil)))
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex);
  (add-hook 'org-mode-hook 'turn-on-reftex)
  (spacemacs|diminish org-cdlatex-mode "Ⓞ" "O")
  ;; code执行免应答（Eval code without confirm）

  (setq org-confirm-babel-evaluate nil)
  (add-hook 'org-mode-hook 'org-mode-reftex-setup)
  (add-to-list 'org-latex-classes
               '("cn-article"
                 "\\documentclass[10pt,a4paper,UTF8]{article}
                  \\usepackage{zclorg}
                  \\usepackage{tikztheorem}
                  \\usepackage[toc,lof,lot]{multicol}
                  [NO-DEFAULT-PACKAGES]
                  [NO-PACKAGES]"
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                  ("\\paragraph{%s}" . "\\paragraph*{%s}")
                  ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'org-latex-classes
               '("article"
                 "\\documentclass[10pt,a4paper,UTF8]{article}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("zclorgblueruin"
                 "\\documentclass[10pt,a4paper,UTF8]{article}
               \\usepackage{zclorgblueruin}
               [NO-DEFAULT-PACKAGES]
               [NO-PACKAGES]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'org-latex-classes
               '("org-article"
                 "\\documentclass{org-article}
\\usepackage{tikz}
\\usetikzlibrary{arrows,decorations.pathmorphing,,backgrounds,positioning,fit,petri,calc,intersections,through,shapes.misc,mindmap,calendar,shadows,mindmap,calendar,graphdrawing,trees,shapes.misc,quotes,angles}
\\definecolor{mycolor}{RGB}{139,0,0}
               [NO-DEFAULT-PACKAGES]
               [PACKAGES]
               [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
  (add-to-list 'org-latex-classes
               '("org-article-cn"
                 "\\documentclass{org-article}
                  \\usepackage{ctex}
                  \\usepackage{tikztheorem}
               [NO-DEFAULT-PACKAGES]
               [PACKAGES]
               [EXTRA]"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
(setq org-latex-listings t)
;;-----------------------------------------------------------------------------
(add-to-list 'org-latex-classes
             ;; beamer class, for presentations
             '("beamer"
               "\\documentclass[11pt,professionalfonts,UTF8]{beamer}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}"
                "\\begin{frame}[fragile]\\frametitle{%s}"
                "\\end{frame}")))
(setq ps-paper-type 'a4
      ps-font-size 18.0
      ps-print-header nil
      ps-landscape-mode nil)

(setq reftex-default-bibliography
      (quote
       ("default.bib" "~/Dropbox/research_library/zcl.bib")))
(define-key org-mode-map (kbd "C-c )") 'reftex-citation)
;;;;orgpublish;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq org-latex-to-pdf-process
;;       '("xelatex -interaction nonstopmode %f"
;;         "xelatex -interaction nonstopmode %f"))
;;(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
(setq-default TeX-engine "luatex")
(setq org-latex-compiler "lualatex")
(setq org-latex-pdf-process
      '("%latex -interaction nonstopmode  -output-directory %o %f"
        "bibtex %b"
        "%latex -interaction nonstopmode  -output-directory %o %f"
        "%latex -interaction nonstopmode  -output-directory %o %f"
        "rm -rf %b.out %b.log %b.bbl %b.thm %b.aux auto "
                              ))

(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("PdfLaTeX" "%`pdflatex%(mode)%' %t" TeX-run-TeX nil t))
            (add-to-list 'TeX-command-list '("LuaLatex" "%`lualatex  --shell-escape %(mode)%' %t" TeX-run-TeX nil t))
            (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
            (setq TeX-command-default "pdflatex")))


;; (add-to-list 'org-latex-packages-alist
;;              '("" "tikz" t))
(setq org-preview-latex-default-process 'imagemagick)
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))
(setq exec-path (append exec-path '("/usr/local/texlive/2019/bin/x86_64-darwin/")))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex . t)
   (gnuplot . t)))


(setq org-image-actual-width 800)

(add-to-list 'image-type-file-name-regexps '("\\.pdf\\'" . imagemagick))
(add-to-list 'image-file-name-extensions "pdf")


;; customize the title command
(setq org-latex-title-command "")
(setq org-latex-toc-command "")
(setq org-imagemagick-display-command "convert -density 600  \"%s\" -transparent white   -thumbnail \"%sx%s>\" \"%s\"")
(defun org-display-inline-images (&optional include-linked refresh beg end)
  "Display inline images.
Normally only links without a description part are inlined, because this
is how it will work for export.  When INCLUDE-LINKED is set, also links
with a description part will be inlined.  This
can be nice for a quick
look at those images, but it does not reflect what exported files will look
like.
When REFRESH is set, refresh existing images between BEG and END.
This will create new image displays only if necessary.
BEG and END default to the buffer boundaries."
  (interactive "P")
  (unless refresh
    (org-remove-inline-images)
    (if (fboundp 'clear-image-cache) (clear-image-cache)))
  (save-excursion
    (save-restriction
      (widen)
      (setq beg (or beg (point-min)) end (or end (point-max)))
      (goto-char beg)
      (let ((re (concat "\\[\\[\\(\\(file:\\)\\|\\([./~]\\)\\)\\([^]\n]+?"
                        (substring (org-image-file-name-regexp) 0 -2)
                        "\\)\\]" (if include-linked "" "\\]")))
            old file ov img)
        (while (re-search-forward re end t)
          (setq old (get-char-property-and-overlay (match-beginning 1)
                                                   'org-image-overlay)
        file (expand-file-name
                      (concat (or (match-string 3) "") (match-string 4))))
          (when (file-exists-p file)
            (let ((file-thumb (format "%s%s.png" (file-name-directory file) (file-name-base file))))
              (if (file-exists-p file-thumb)
                  (let ((thumb-time (nth 5 (file-attributes file-thumb 'string)))
                        (file-time (nth 5 (file-attributes file 'string))))
                    (if (time-less-p thumb-time file-time)
            (shell-command (format org-imagemagick-display-command
                           file org-image-actual-width org-image-actual-width file-thumb) nil nil)))
                (shell-command (format org-imagemagick-display-command
                                         file org-image-actual-width org-image-actual-width file-thumb) nil nil))
              (if (and (car-safe old) refresh)
                  (image-refresh (overlay-get (cdr old) 'display))
                (setq img (save-match-data (create-image file-thumb)))
                (when img
                  (setq ov (make-overlay (match-beginning 0) (match-end 0)))
                  (overlay-put ov 'display img)
                  (overlay-put ov 'face 'default)
                  (overlay-put ov 'org-image-overlay t)
                  (overlay-put ov 'modification-hooks
                               (list 'org-display-inline-remove-overlay))
                  (push ov org-inline-image-overlays))))))))))

(add-hook 'org-mode-hook 'org-display-inline-images)


 (defvar kk/org-latex-fragment-last nil
    "Holds last fragment/environment you were on.")

  (defun kk/org-in-latex-fragment-p ()
    "Return the point where the latex fragment begins, if inside
  a latex fragment. Else return false"
    (let* ((el (org-element-context))
           (el-type (car el)))
      (and (or (eq 'latex-fragment el-type) (eq 'latex-environment el-type))
          (org-element-property :begin el))))

  (defun kk/org-latex-fragment-toggle ()
    "Toggle a latex fragment image "
    (and (eq 'org-mode major-mode)
	 (let ((begin (kk/org-in-latex-fragment-p)))
           (cond
            ;; were on a fragment and now on a new fragment
            ((and
              ;; fragment we were on
              kk/org-latex-fragment-last
              ;; and are on a fragment now
              begin

              ;; but not on the last one this is a little tricky. as you edit the
              ;; fragment, it is not equal to the last one. We use the begin
              ;; property which is less likely to change for the comparison.
              (not (and kk/org-latex-fragment-last
			(= begin
			   kk/org-latex-fragment-last))))
             ;; go back to last one and put image back, provided there is still a fragment there
             (save-excursion
               (goto-char kk/org-latex-fragment-last)
               (when (kk/org-in-latex-fragment-p) (org-preview-latex-fragment))

               ;; now remove current image
               (goto-char begin)
               (let ((ov (loop for ov in (org--list-latex-overlays)
                               if
                               (and
				(<= (overlay-start ov) (point))
				(>= (overlay-end ov) (point)))
                               return ov)))
		 (when ov
                   (delete-overlay ov)))
               ;; and save new fragment
               (setq kk/org-latex-fragment-last begin)))

            ;; were on a fragment and now are not on a fragment
            ((and
              ;; not on a fragment now
              (not begin)
              ;; but we were on one
              kk/org-latex-fragment-last)
             ;; put image back on, provided that there is still a fragment here.
             (save-excursion
               (goto-char kk/org-latex-fragment-last)
               (when (kk/org-in-latex-fragment-p) (org-preview-latex-fragment)))

             ;; unset last fragment
             (setq kk/org-latex-fragment-last nil))

            ;; were not on a fragment, and now are
            ((and
              ;; we were not one one
              (not kk/org-latex-fragment-last)
              ;; but now we are
              begin)
             ;; remove image
             (save-excursion
               (goto-char begin)
               (let ((ov (loop for ov in (org--list-latex-overlays)
                               if
                               (and
				(<= (overlay-start ov) (point))
				(>= (overlay-end ov) (point)))
                               return ov)))
		 (when ov
                   (delete-overlay ov))))
             (setq kk/org-latex-fragment-last begin))))))

(add-hook 'post-command-hook 'kk/org-latex-fragment-toggle t)

)
