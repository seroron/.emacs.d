(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(package-refresh-contents)

(require 'cl)

(defvar installing-package-list
  '(
    f
    init-loader
    recentf-ext
    helm
    helm-ls-git
    helm-ag
    direx
    company
    flycheck
    js2-mode
    undo-tree
    anzu
    magit
    yasnippet
    helm-c-yasnippet
    web-mode
    scss-mode
    yaml-mode
    git-gutter+
    haskell-mode
    powershell
    markdown-mode
    go-mode
    go-eldoc
    company-go
    elixir-mode
    dockerfile-mode
    alchemist
    ac-alchemist
    flycheck-elixir
    robe
    rbenv
    irony
    company-irony
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

