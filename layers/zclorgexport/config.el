(with-eval-after-load 'org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;wo de;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  (setq org-src-fontify-natively t)
  (setq org-hide-emphasis-markers nil)
  ;;automatically delete this auxiliary files after export
  (setq org-export-coding-system 'utf-8)
    ;; set the exported latex file using the user defined labels
  (setq org-latex-prefer-user-labels t);
  (setq org-latex-logfiles-extensions (quote ("lof" "lot" "tex~" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl")))
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
\\usetikzlibrary{arrows,decorations.pathmorphing,,backgrounds,positioning,fit,petri,calc,intersections,through,shapes.misc,mindmap,calendar,shadows,mindmap,calendar,graphdrawing,trees}
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
(setq org-latex-pdf-process '("%latex -interaction nonstopmode -output-directory %o %f"
                              "bibtex %b"
                              "%latex -interaction nonstopmode -output-directory %o %f"
                              "%latex -interaction nonstopmode -output-directory %o %f"
                              "rm -rf %b.out %b.log %b.bbl %b.thm %b.aux auto "
                              ))
(add-hook 'LaTeX-mode-hook
          (lambda()
            (add-to-list 'TeX-command-list '("PdfLaTeX" "%`pdflatex%(mode)%' %t" TeX-run-TeX nil t))
            (add-to-list 'TeX-command-list '("LuaLatex" "%`lualatex%(mode)%' %t" TeX-run-TeX nil t))
            (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
            (setq TeX-command-default "pdflatex")))

;; (add-to-list 'org-latex-packages-alist
;;              '("" "tikz" t))
(setq org-latex-create-formula-image-program 'imagemagick)
(eval-after-load "preview"
  '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))
(setq exec-path (append exec-path '("/usr/local/texlive/2019/bin/x86_64-darwin/")))
(org-babel-do-load-languages
 'org-babel-load-languages
 '((latex . t)))

(setq org-image-actual-width 800)

(add-to-list 'image-type-file-name-regexps '("\\.pdf\\'" . imagemagick))
(add-to-list 'image-file-name-extensions "pdf")


;; customize the title command
(setq org-latex-title-command (concat ""))
(setq org-latex-toc-command (concat ""))

)
