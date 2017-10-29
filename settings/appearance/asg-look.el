; Look and feels modules

(provide 'asg-look)

(require 'asg-common)

;; Use M-x customize-variable frame-background-mode to change
(setq frame-background-mode 'dark)

;; allow the use of curly brackets on Mac OS
(defun setup-mac-os-settings ()
  (when (is-mac-osx?)
    (setq mac-option-modifier nil
          mac-command-modifier 'meta
          x-select-enable-clipboard t)
    (put 'erase-buffer 'disabled nil)))

;Setup emacs terminal colors
(defun setup-terminal-color ()
  (let ((term-background-color "#040000")
        (term-letters-color "#06d4f2"))
    (setq term-default-bg-color term-background-color) ; background
    (setq term-default-fg-color term-letters-color) ; letters
    ))

(defun asgard-theme ()
  (if (package-installed-p 'doom-themes)
      (load-theme 'doom-one t)
    (progn
      (package-install 'doom-themes)
      (load-theme 'doom-one t))))

(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t)
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))

(defun init-asg-look ()
  (setup-mac-os-settings)
  (setup-terminal-color)
  (asgard-theme)
  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme
  (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!
  (scroll-bar-mode -1)   ; Disable scroll bar
  (set-face-attribute 'default nil :height 110) ;Set font size
  (require 'rainbow-delimiters)
  (add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
  (require 'all-the-icons)
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  )

(init-asg-look)

