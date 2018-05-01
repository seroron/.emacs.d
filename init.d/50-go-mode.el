(require 'company-go)
(require 'go-eldoc)

(add-hook 'go-mode-hook (lambda ()
                          (set (make-local-variable 'company-backends) '(company-go))
                          (company-mode)
                          (setq tab-width 2)
                          (go-eldoc-setup)
                          ))

(add-hook 'before-save-hook 'gofmt-before-save)
