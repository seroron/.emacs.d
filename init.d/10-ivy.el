(ivy-mode 1)
(counsel-mode 1)

;; プロンプトの表示が長い時に折り返す（選択候補も折り返される）
(setq ivy-truncate-lines nil)

;; `ivy-switch-buffer' (C-x b) のリストに recent files と bookmark を含める．
(setq ivy-use-virtual-buffers t)

;; minibufferのサイズを拡大
(setq ivy-height 30)

(global-set-key "\C-s" 'swiper-thing-at-point)

;; magit
(with-eval-after-load "magit"
  (setq magit-completing-read-function 'ivy-completing-read))

;; M-x history
(when (require 'smex nil t)
  (setq smex-history-length 35)
  (setq smex-completion-method 'ivy))

;; ivy-rich
(ivy-rich-mode 1)
(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)


(define-key ivy-minibuffer-map (kbd "<left>") 'counsel-up-directory)
(define-key ivy-minibuffer-map (kbd "<right>") 'ivy-alt-done)

(global-set-key (kbd "M-s") 'counsel-projectile-rg)
(global-set-key (kbd "C-x C-d") 'counsel-projectile-find-file)

