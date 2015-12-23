; Look and feels modules

(provide 'my-look)

;; Use M-x customize-variable frame-background-mode to change
(setq frame-background-mode 'dark)

;; allow the use of curly brackets
(setq mac-option-modifier nil
      mac-command-modifier 'meta
      x-select-enable-clipboard t)
(put 'erase-buffer 'disabled nil)

;Setup emacs terminal colors
(setq term-default-bg-color "#040000") ; background
(setq term-default-fg-color "#06d4f2") ; letters

;; Color theme
;(require 'sublime-themes)
;(load-theme 'spolsky)

(if (package-installed-p 'noctilux-theme)
    (load-theme 'noctilux t)
  (package-install 'noctilux-theme)
    )

; Set font size
(set-face-attribute 'default nil :height 130)

