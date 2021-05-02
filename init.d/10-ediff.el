;; コントロール用のバッファを同一フレーム内に表示する
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; ediff のバッファを左右に並べる
(setq ediff-split-window-function 'split-window-horizontally)
