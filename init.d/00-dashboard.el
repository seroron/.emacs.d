(require 'dashboard)

;; (setq dashboard-items '((recents  . 5)
;;                         (bookmarks . 5)
;;                         (projects . 5)
;;                         (agenda . 5)
;;                        (registers . 5)))

;; dashboard-item-generatorにエディタ名を表示する関数を追加する
(add-to-list 'dashboard-item-generators
             '(bindings . (lambda (list-size)
                          (dashboard-insert-heading "Bindings:")
                          (mapc (lambda (el) (insert "\n" el))
                                '("neo tree: F8"
                                  "tramp: /ssh:root@hostname:filename"
                                  )))))
(add-to-list 'dashboard-items '(bindings) t)

(setq dashboard-set-footer nil)

(dashboard-setup-startup-hook)
