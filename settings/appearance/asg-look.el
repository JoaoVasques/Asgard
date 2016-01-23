; Look and feels modules

(provide 'asg-look)

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
 ;; (if (package-installed-p 'base16-theme)
 ;;     (load-theme 'base16-eighties-dark t)
 ;;   (progn
 ;;     (package-install 'base16-theme)
 ;;     (load-theme 'base16-eighties-dark t)
 ;;     ))

 (if (package-installed-p 'spacemacs-theme)
     (load-theme 'spacemacs-dark t)
   (progn
     (package-install 'spacemacs-theme)
     (load-theme 'spacemacs-dark t)
     ))


; Disable scroll bar
(scroll-bar-mode -1)

;Set font size
(set-face-attribute 'default nil :height 130)

;System monitoring bar
(require 'symon)
(symon-mode)

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

(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
