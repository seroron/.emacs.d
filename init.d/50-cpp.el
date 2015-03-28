
(setq auto-mode-alist
      (append '(("\\.h$" . c++-mode))
              auto-mode-alist))

(defun my-c-c++-mode-init ()
  (c-set-style "bsd")
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil)
  (setq c-hungry-delete-key t)
  )

(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)

