(require 'helm-config)
(require 'helm-files)
(require 'helm-ag)

(if (executable-find "rg")
    (setq helm-ag-base-command "rg --no-heading --ignore-case") ; ripgrep
    (setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case") ; The Silver Searcher
)

(define-key global-map (kbd "M-s") 'helm-do-ag-project-root)
(define-key global-map (kbd "C-M-s") 'helm-ag-this-file)
