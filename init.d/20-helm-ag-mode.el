(require 'helm-config)
(require 'helm-files)
(require 'helm-ag)

(setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")

(define-key global-map (kbd "M-s") 'helm-do-ag-project-root)
(define-key global-map (kbd "C-M-s") 'helm-ag-this-file)
