;; Core modules

(provide 'my-core)

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
