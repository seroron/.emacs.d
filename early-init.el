;;;;;;;;;;;;;;;;;
;; GC
;;;;;;;;;;;;;;;;;

;; 200MB
(setq gc-cons-threshold 200000000)

;; 2分のアイドル時間ごとに明示的にガベージコレクトを呼び出す
(run-with-idle-timer 120 t #'garbage-collect)


;;;;;;;;;;;;;;;;;
;; Bars
;;;;;;;;;;;;;;;;;

;; MenuBarとToolBar無効化
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
