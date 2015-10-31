(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))

(defun web-mode-hook ()
  "web mode hook"
  (setq web-mode-markup-indent-offset 2))
(add-hook 'web-mode-hook 'web-mode-hook)
