;;; init.el --- init file  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; warning対策
(setq byte-compile-warnings '(not cl-functions obsolete))

;; leaf init
(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("org"   . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu"   . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    ;(leaf diminish :ensure t)
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))


;; leaf basic
(leaf cus-edit
  :doc "tools for customizing Emacs and Lisp packages"
  :tag "builtin" "faces" "help"
  :custom
  `(custom-file . ,(expand-file-name "var/custom.el" user-emacs-directory)))

;; imenu
(leaf imenu-list
  :bind
  ("<f10>" . imenu-list-smart-toggle)
  :custom
  (imenu-list-position . 'right)
  (imenu-list-size . 30)
  (imenu-list-focus-after-activation . t)
  (imenu-list-auto-resize . t))


(leaf hide-mode-line
  :ensure t
  :hook
  (imenu-list-minor-mode-hook . hide-mode-line-mode)
  (neotree-mode-hook . hide-mode-line-mode))

(leaf leaf
  :config
  (leaf leaf-convert :ensure t)
  (leaf leaf-tree
    :ensure t))

(leaf macrostep
  :ensure t
  :bind (("C-c e" . macrostep-expand)))


;; global-set-key
(leaf *global-set-key
  :leaf-autoload nil
  :bind
  ([up]    . previous-line)
  ([right] . right-char)
  ([down]  . next-line)
  ([left]  . left-char)
  ((kbd "C-h")  . delete-backward-char)
  ("\C-cc" . compile)
  ("\C-c <left>"  . windmove-left)
  ("\C-c <right>" . windmove-right)
  ("\C-c <up>"    . windmove-up)
  ("\C-c <down>"  . windmove-down)
  )


;; bracket highlight
(setq show-paren-delay 0)
(show-paren-mode t)

;; Tab indent
(setq-default indent-tabs-mode nil)

;; Backup Files
(setq make-backup-files   t)
(setq version-control     t)  ;; 実行の有無
(setq kept-new-versions   5)  ;; 最新の保持数
(setq kept-old-versions   1)  ;; 最古の保持数
(setq delete-old-versions t)  ;; 範囲外を削除
(setq backup-directory-alist `((".*" . ,(expand-file-name "var/backup" user-emacs-directory))))

;; buffer history
(savehist-mode 1)
(setq savehist-file (expand-file-name "var/history" user-emacs-directory))

;; cursor
(column-number-mode t)
(line-number-mode t)

;; bell off
(setq ring-bell-function 'ignore)

;; Theme
(load-theme 'wombat t)

;; (leaf doom-themes
;;   :ensure t
;;   :config
;;   (load-theme 'doom-vibrant t))

(leaf doom-modeline
  :ensure t
  :global-minor-mode t)

;; cua
(cua-mode t)
(setq cua-enable-cua-keys nil)
(define-key global-map (kbd "C-x SPC") 'cua-set-rectangle-mark)

;; ディスク上でファイルが変化したとき自動で再読み込み
(leaf autorevert
  :doc "revert buffers when files on disk change"
  :tag "builtin"
  :custom ((auto-revert-interval . 0.1))
  :global-minor-mode global-auto-revert-mode)

;; 最近使ったファイル
(leaf recentf
  :ensure t
  :custom
  (recentf-max-saved-items . 100)
  `((recentf-save-file . ,(expand-file-name "var/recentf" user-emacs-directory)))
  )

(leaf recentf-ext
  :ensure t)

;; 括弧の色
(leaf rainbow-delimiters
  :ensure t
  :hook
  (prog-mode-hook . rainbow-delimiters-mode)
  :config
  (set-face-attribute 'rainbow-delimiters-depth-1-face nil
                      :foreground "#78c5d6")
  (set-face-attribute 'rainbow-delimiters-depth-2-face nil
                      :foreground "#bf62a6")
  (set-face-attribute 'rainbow-delimiters-depth-3-face nil
                      :foreground "#459ba8")
  (set-face-attribute 'rainbow-delimiters-depth-4-face nil
                      :foreground "#e868a2")
  (set-face-attribute 'rainbow-delimiters-depth-5-face nil
                      :foreground "#79c267")
  (set-face-attribute 'rainbow-delimiters-depth-6-face nil
                      :foreground "#f28c33")
  (set-face-attribute 'rainbow-delimiters-depth-7-face nil
                      :foreground "#c5d647")
  (set-face-attribute 'rainbow-delimiters-depth-8-face nil
                      :foreground "#f5d63d")
  (set-face-attribute 'rainbow-delimiters-depth-9-face nil
                      :foreground "#78c5d6")
  (set-face-attribute 'rainbow-delimiters-unmatched-face nil
                      :foreground 'unspecified
                      :inherit 'show-paren-mismatch
                      :strike-through t)
  )


;; keyのhelp
(leaf which-key
  :ensure t
  :custom
  (which-key-idle-delay . 0.1)
  :config
  (which-key-setup-side-window-right-bottom)
  :global-minor-mode t)

;; ファイル名にパスを付与
(leaf uniquify
  :custom
  ((uniquify-buffer-name-style . 'forward)
   (uniquify-min-dir-content   . 2))
  )

;; highlight
(leaf auto-highlight-symbol
  :ensure t
  :global-minor-mode global-auto-highlight-symbol-mode)


(leaf highlight-indent-guides
  :ensure t
  :hook
  ((prog-mode-hook yaml-mode-hook) . highlight-indent-guides-mode)
  :custom
  (highlight-indent-guides-method . 'column)
  (highlight-indent-guides-responsive . 'top)

  (highlight-indent-guides-auto-odd-face-perc . 15)
  (highlight-indent-guides-auto-even-face-perc . 10)
  
  (highlight-indent-guides-auto-top-odd-face-perc . 40)
  (highlight-indent-guides-auto-top-even-face-perc . 40))

;; flycheck
(leaf flycheck
  :ensure t
  :bind (("M-n" . flycheck-next-error)
         ("M-p" . flycheck-previous-error))
  :global-minor-mode global-flycheck-mode)


;; 入力補間

(leaf lsp-mode
  :init
  (setq read-process-output-max (* 1024 1024))
  (setq lsp-keymap-prefix "C-c l")
  :custom
  (lsp-auto-guess-root . t)
  (lsp-prefer-capf . t)
  
  :hook
  ;; if you want which-key integration
  (lsp-mode-hook . lsp-enable-which-key-integration)
  :commands lsp)

(leaf lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :bind
  (:lsp-ui-mode-map
   ("C-c r" . lsp-ui-peek-find-references)
   ("C-c d" . lsp-ui-peek-find-definitions)
   ("C-c i"   . lsp-ui-peek-find-implementation)))

(leaf lsp-ivy :ensure t :commands lsp-ivy-workspace-symbol)
(leaf lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)


;; (leaf eglot
;;   :ensure t
;;   :hook
;;   (ruby-mode-hook . eglot-ensure)
;;   )

(leaf company
  :ensure t
  :config
  (setq company-selection-wrap-around t)
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.1)
  :global-minor-mode global-company-mode)

(leaf company-quickhelp
  :ensure t
  :global-minor-mode t)

;; (set-face-attribute 'company-tooltip nil
;;                     :foreground "black"
;;                     :background "lightgray")
;; (set-face-attribute 'company-preview-common nil
;;                     :foreground "dark gray"
;;                     :background "black"
;;                     :underline t)
;; (set-face-attribute 'company-tooltip-selection nil
;;                     :background "steelblue"
;;                     :foreground "white")
;; (set-face-attribute 'company-tooltip-common nil
;;                     :foreground "black"
;;                     :underline t)
;; (set-face-attribute 'company-tooltip-common-selection nil
;;                     :foreground "white"
;;                     :background "steelblue"
;;                     :underline t)
;; (set-face-attribute 'company-tooltip-annotation nil
;;                     :foreground "red")

;; yasnippet
(leaf yasnippet
  :ensure t
  :init (yas-global-mode 1))
;  :custom
;  `(yas-snippet-dirs . ,(expand-file-name "yasnippets" user-emacs-directory)))

(leaf ivy-yasnippet
  :ensure t
  :after (yasnippet)
  :bind ("C-c y" . ivy-yasnippet))
  
(leaf yasnippet-snippets
  :ensure t)

(leaf dumb-jump
  :ensure t
  :hook (xref-backend-functions . dumb-jump-xref-activate))

;; 切り替え時にカーソルを強調表示
(leaf beacon
  :ensure t
  :blackout t
  :config
  (beacon-mode 1))

;; undo
(leaf undo-tree
  :ensure t
  :blackout t
  :global-minor-mode global-undo-tree-mode
;  :custom
;  `(undo-tree-history-directory-alist . ,(("." . (concat user-emacs-directory "undo-tree/"))))
  ;; (undo-tree-visualizer-timestamps . t)
  )

;; Git
(leaf git-gutter
  :ensure t
  :blackout t
  :custom
  (git-gutter:update-interval . 2)
  (global-git-gutter-mode . t))

(leaf magit
  :ensure t
  :init
  (leaf transient
    :custom
    `(transient-history-file . ,(expand-file-name "var/transient-history.el" user-emacs-directory))
    `(transient-levels-file . ,(expand-file-name "var/transient-levels.el" user-emacs-directory))
    `(transient-values-file . ,(expand-file-name "var/transient-values.el" user-emacs-directory))
    (transient-force-fixed-pitch . t)))

(leaf gitignore-mode :ensure t)

;; Dashboard
(leaf dashboard
  :ensure t
  :defun (dashboard-setup-startup-hook)
  :require t
  :config
  (add-to-list 'dashboard-item-generators
               '(bindings . (lambda (list-size)
                              (dashboard-insert-heading "Bindings:")
                              (mapc (lambda (el) (insert "\n" el))
                                    '("neo tree: F8"
                                      "imenu-list: F10"
                                      "tramp: /ssh:root@hostname:filename"
                                      "counsel-projectile-switch-project: C-c p p"
                                      "bookmark  set: C-x r m   jump: C-x r b"
                                      "xref  definitions: M-.  references: M-?  pop-stack: M-,"
                                      "lsp-ui-peek  definitions: C-c d  references: C-c r  implementation: C-c i"
                                      )))))
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)))
;                        (agenda . 5)
;                        (registers . 5)))
  (add-to-list 'dashboard-items '(bindings) t)
  (setq dashboard-set-footer nil)
  (dashboard-setup-startup-hook))


;; Projectile
(leaf projectile
  :ensure t
  :custom
  `(projectile-known-projects-file . ,(expand-file-name "var/projectile-bookmarks.eld" user-emacs-directory))
  :bind-keymap ("C-c p" . projectile-command-map)
  :global-minor-mode t)

;; ivy
(leaf ivy
  :ensure t
  :blackout t
  :custom
  ;; プロンプトの表示が長い時に折り返す（選択候補も折り返される）
  (ivy-truncate-lines . nil)
  ;; `ivy-switch-buffer' (C-x b) のリストに recent files と bookmark を含める．
  (ivy-use-virtual-buffers . t)
  ;; minibufferのサイズを拡大
  (ivy-height . 30)
  (enable-recursive-minibuffers . t)
  :global-minor-mode t
  :config
  (setq ivy-extra-directories nil)
  
  (leaf swiper
    :ensure t
    :bind
    ("C-s" . swiper))

  (leaf counsel
    :ensure t
    :blackout t
    :custom
;    `(counsel-find-file-ignore-regexp . ,(rx-to-string '(or "./" "../") 'no-group))
    :global-minor-mode t)

  (leaf ivy-rich
    :ensure t
    :config
    (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
    :global-minor-mode t)
  ;; (leaf all-the-icons-ivy-rich
  ;;   :ensure t
  ;;   :global-minor-mode t)
  :bind
  (ivy-minibuffer-map ("<left>" . counsel-up-directory))
  (ivy-minibuffer-map ("<right>" . ivy-alt-done))
  )

(leaf prescient
  :ensure t
  :custom ((prescient-aggressive-file-save . t))
  :global-minor-mode prescient-persist-mode)

(leaf ivy-prescient
  :ensure t
  :after prescient ivy
  :custom
  `(prescient-save-file . ,(expand-file-name "var/prescient-save.el" user-emacs-directory))
  (ivy-prescient-retain-classic-highlighting . t)
  (ivy-prescient-mode . t)
  (prescient-persist-mode . t))

(leaf counsel-projectile
  :ensure t
  :bind
  ("M-s"     . counsel-projectile-rg)
  ("C-x C-d" . counsel-projectile-find-file))

;; neotree
(leaf neotree
  :ensure t
  :commands
  (neotree-show neotree-hide neotree-dir neotree-find)
  :custom
  (neo-smart-open . t)
  (neo-autorefresh . t)
  (neo-show-hidden-files . t)
  :bind
  ("<f8>" . neotree-toggle))

;; コンパイルモード時とかに色がちゃんと出るように
(leaf ansi-color
  :ensure t
  :hook
  (compilation-filter-hook . my/ansi-colorize-buffer)
  :config
  (defun my/ansi-colorize-buffer ()
    (let ((buffer-read-only nil))
      (ansi-color-apply-on-region (point-min) (point-max)))))

;;
(leaf ediff
  :setq
  ;; コントロール用のバッファを同一フレーム内に表示する
  (ediff-window-setup-function . 'ediff-setup-windows-plain)

  ;; ediff のバッファを左右に並べる
  (ediff-split-window-function . 'split-window-horizontally))


;;
;; Modes
;;

(leaf vterm
  :ensure t)

(leaf ruby
  :hook
  (ruby-mode-hook . lsp))

(leaf sh-mode
  :hook
  (sh-mode-hook . lsp))

(leaf yaml-mode
  :ensure t)

(leaf web-mode
  :ensure t)

(leaf clang-format
  :ensure t)

(leaf powershell
  :ensure t)

(leaf markdown-mode
  :ensure t)

;;;;;;;;;;;;;;;;;
;; leaf finish
;;;;;;;;;;;;;;;;;
(provide 'init)

;;; init.el ends here
