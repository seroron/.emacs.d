(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
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
    auto-complete
    flycheck
    js2-mode
    undo-tree
    anzu
    magit
    web-mode
    scss-mode
    yaml-mode
    git-gutter+
    haskell-mode
    powershell
    markdown-mode
    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
        (package-install pkg))))

