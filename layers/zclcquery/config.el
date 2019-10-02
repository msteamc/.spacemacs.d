(setq cquery-executable "/home/cliyh/Downloads/cquery/bin/bin/cquery")
(add-hook 'c-mode-hook 'lsp-cquery-enable)
(add-hook 'c++-mode-hook 'lsp-cquery-enable)
(setq cquery-extra-init-params '(:index (:comments 2) :cacheFormat "msgpack"))
(with-eval-after-load 'projectile
  (setq projectile-project-root-files-top-down-recurring
        (append '("compile_commands.json"
                  ".cquery")
                projectile-project-root-files-top-down-recurring)))

(setq company-transformers nil company-lsp-async t company-lsp-cache-candidates nil)
(setq cquery-extra-init-params '(:completion (:detailedLabel t)))
