(require 'direx)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory)

(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
