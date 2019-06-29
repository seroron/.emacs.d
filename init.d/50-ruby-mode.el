;; ; rbenv
;; (setq rbenv-installation-dir "~/.rbenv")
;; (require 'rbenv)
;; (global-rbenv-mode)

(defun ruby-mode-hook-encoding-map ()
  " "
  (add-to-list 'ruby-encoding-map '(japanese-cp932 . cp932))
  )
(add-hook 'ruby-mode-hook 
          'ruby-mode-hook-encoding-map)
