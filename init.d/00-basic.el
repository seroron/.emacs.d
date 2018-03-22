;;;;;;;;;;;;;;;;;
;; theme
;;;;;;;;;;;;;;;;;
(load-theme 'wombat t)

;;;;;;;;;;;;;;;;;
;; bracket highlight
;;;;;;;;;;;;;;;;;
(setq show-paren-delay 0)
(show-paren-mode t)

;;;;;;;;;;;;;;;;;
;; Tab indent
;;;;;;;;;;;;;;;;;
(setq-default indent-tabs-mode nil)

;;;;;;;;;;;;;;;;;
;; Backup Files
;;;;;;;;;;;;;;;;;
(setq make-backup-files t)
(setq backup-directory-alist '(("" . "~/.emacs.d/backup")))

;;;;;;;;;;;;;;;;;
;; buffer history
;;;;;;;;;;;;;;;;;
(savehist-mode 1)
(setq savehist-file "~/.emacs.d/history")

;;;;;;;;;;;;;;;;;
;; menu-bar
;;;;;;;;;;;;;;;;;
(menu-bar-mode -1)

;;;;;;;;;;;;;;;;;
;; tool-bar
;;;;;;;;;;;;;;;;;
(tool-bar-mode -1)

;;;;;;;;;;;;;;;;;
;; cursor
;;;;;;;;;;;;;;;;;
(column-number-mode t)
(line-number-mode t)

;;;;;;;;;;;;;;;;;
;; bell off
;;;;;;;;;;;;;;;;;
(setq ring-bell-function 'ignore)
