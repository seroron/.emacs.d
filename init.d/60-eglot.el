(require 'eglot)

(add-hook 'ruby-mode-hook 'eglot-ensure)
(add-hook 'rust-hook 'eglot-ensure)
