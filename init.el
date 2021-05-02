;;;;;;;;;;;;;;;;;
;; global-set-key
;;;;;;;;;;;;;;;;;
(global-set-key [up] 'previous-line)
(global-set-key [right] 'right-char)
(global-set-key [down] 'next-line)
(global-set-key [left] 'left-char)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-cc" 'compile)

;;;;;;;;;;;;;;;;;
;; package-el
;;;;;;;;;;;;;;;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;;;;;;;;;;;;;;;;
;; init-loader
;;;;;;;;;;;;;;;;;
(require 'init-loader)
(init-loader-load "~/.emacs.d/init.d/")


;;;;;;;;;;;;;;;;;
;; custom file separating
;;;;;;;;;;;;;;;;;
(setq custom-file "~/.emacs.d/emacs-custom")
(if (file-exists-p custom-file)
    (load custom-file))
