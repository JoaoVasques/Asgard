;; Core modules

(provide 'my-core)

(setq-local my-core-packages '(multiple-cursors move-text find-file-in-repository dired-details ace-jump-mode yasnippet window-numbering neotree whitespace key-chord cl auto-complete pallet yaml-mode magit feature-mode tidy rainbow-delimiters key-chord markdown-mode slime yafolding))

;; install the packages that are missing, if any
(dolist (package my-core-packages)
	(unless (package-installed-p package)
		(package-install package)))

;; Put temporary and backup files elsewhere
(setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save/") t)))
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
(setq create-lockfiles nil)

(require 'yasnippet)
(yas-global-mode 1)

(require 'window-numbering)
(window-numbering-mode 1)

(require 'neotree)
(global-set-key (kbd "s-d") 'neotree-toggle)

(require 'whitespace)
(setq whitespace-line-column 120)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode +1)

(setq show-paren-delay 0)
(show-paren-mode 1)

;; Save on focus-out
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

(require 'key-chord)
(key-chord-mode 1)
;;(key-chord-define-global "jx" 'smex)

(set-frame-font "Source Code Pro-18" nil t)

;; Exit emacs w/o prompts
(require 'cl)
(defadvice save-buffers-kill-emacs (around no-query-kill-emacs activate)
           (flet ((process-list ())) ad-do-it))

(add-hook 'markdown-mode-hook (lambda () (electric-indent-local-mode -1)))

;; Control and mouse-wheel-up to increase font size in buffer, down to decrease
(global-set-key [C-wheel-up] '(lambda () (interactive) (text-scale-increase 1)))
(global-set-key [C-wheel-down] '(lambda () (interactive) (text-scale-decrease 1)))

(require 'auto-complete)
(require 'pallet)

(custom-set-variables
 '(markdown-command "/usr/local/bin/pandoc"))

(require 'yaml-mode)
    (add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

; Adds suport for Dash
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

(require 'magit)

(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))
(setq feature-default-language "ruby")

(if (package-installed-p 'emamux)
    (require 'emamux)
  (package-install 'emamux)
  )
