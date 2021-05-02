(setq highlight-indent-guides-method 'column)
(setq highlight-indent-guides-responsive 'top)

;; (setq highlight-indent-guides-method 'character)
;; (setq highlight-indent-guides-character ?\|)

(setq highlight-indent-guides-auto-odd-face-perc 15)
(setq highlight-indent-guides-auto-even-face-perc 10)

(setq highlight-indent-guides-auto-top-odd-face-perc 40)
(setq highlight-indent-guides-auto-top-even-face-perc 40)


(add-hook 'yaml-mode-hook 'highlight-indent-guides-mode)
