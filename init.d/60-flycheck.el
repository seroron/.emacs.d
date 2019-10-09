(add-hook 'after-init-hook #'global-flycheck-mode)

(add-hook 'c++-mode-hook (lambda ()
                           (setq flycheck-clang-language-standard "c++1y")))

(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
