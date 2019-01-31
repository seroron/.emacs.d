(add-hook 'js2-mode-hook (lambda () (setq js2-basic-offset 2)))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

