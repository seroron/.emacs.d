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


