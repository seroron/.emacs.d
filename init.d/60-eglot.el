(require 'eglot)

(add-hook 'ruby-mode-hook 'eglot-ensure)
(add-hook 'rust-hook 'eglot-ensure)
(add-hook 'typescript-mode-hook 'eglot-ensure)
