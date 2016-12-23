;; Core modules

(provide 'asg-core)

(require 'asg-common)

(asg-load-packages '(
        find-file-in-repository dired-details
				ace-jump-mode yasnippet window-numbering
				whitespace key-chord auto-complete pallet yaml-mode
				feature-mode tidy rainbow-delimiters key-chord
				markdown-mode slime yafolding multi-term json-mode
				flycheck spaceline cl))

(electric-pair-mode)

;; Put temporary and backup files elsewhere
(setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save/") t)))
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
(setq create-lockfiles nil)

;; Powerline
(require 'spaceline-config)
(spaceline-emacs-theme)

;; MultiTerm
(setq multi-term-program "/bin/zsh")

;; Window numbering
(window-numbering-mode 1)

;; Whitespace
(setq whitespace-line-column 120)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode +1)

(setq show-paren-delay 0)
(show-paren-mode 1)

;; Flycheck
(global-flycheck-mode)

;; Save on focus-out
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

(set-frame-font "Source Code Pro-18" nil t)

;; Exit emacs w/o prompts
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
           (flet ((process-list ())) ad-do-it))

(add-hook 'markdown-mode-hook (lambda () (electric-indent-local-mode -1)))

;; Control and mouse-wheel-up to increase font size in buffer, down to decrease
(global-set-key [C-wheel-up] '(lambda () (interactive) (text-scale-increase 1)))
(global-set-key [C-wheel-down] '(lambda () (interactive) (text-scale-decrease 1)))

(custom-set-variables
 '(markdown-command "/usr/local/bin/pandoc"))

;; YAML module
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(setq feature-default-language "ruby")

(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

(set-frame-parameter nil 'fullscreen 'fullboth)
