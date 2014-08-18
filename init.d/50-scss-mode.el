(setq scss-compile-at-save nil)

(setq auto-mode-alist
      (append '(("\\.scss$" . scss-mode))
              auto-mode-alist))
