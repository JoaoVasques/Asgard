; Modules for scala
(provide 'my-scala)

(require 'ensime)
;; Start ensime mode whenever we open scala mode, e.g. open a .scala file
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
;; Start ensime with Super-e
(global-set-key (kbd "C-c C-c c") 'ensime)

;; Don't show the magit instructions every time
(setq magit-last-seen-setup-instructions "1.4.0")

(require 'multiple-cursors)
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require 'move-text)
(move-text-default-bindings)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" default)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq ensime-sem-high-faces
  '(
  (var . (:foreground "#ff2222"))
    (val . (:foreground "#dddddd"))
    (varField . (:foreground "#ff3333"))
    (valField . (:foreground "#dddddd"))
    (functionCall . (:foreground "#84BEE3"))
    (param . (:foreground "#ffffff"))
    (class . font-lock-type-face)
    (trait . (:foreground "#084EA8"))
    (object . (:foreground "#026DF7"))
    (package . font-lock-preprocessor-face)
))

(add-hook 'scala-mode-hook #'rainbow-delimiters-mode)

;; Turn on yafolding-mode for scala files
(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))
;(add-hook 'scala-mode-hook
;          (lambda () (yafolding-mode) (yafolding-toggle-all)))


(defun jump-to-test ()
  "Jump to correspnding test file"
  (interactive)
  (find-file-other-window (format "%s%sTest.scala" (replace-regexp-in-string "app\/" "test\/" (file-name-directory buffer-file-name)) (file-name-nondirectory (file-name-sans-extension buffer-file-name)))))

(global-set-key (kbd "s-T") 'jump-to-test)


; Adds suport for Dash
(autoload 'dash-at-point "dash-at-point"
          "Search the word at point with Dash." t nil)
(global-set-key "\C-cd" 'dash-at-point)
(global-set-key "\C-ce" 'dash-at-point-with-docset)

(add-to-list 'dash-at-point-mode-alist '(scala-mode . "scala"))
(add-to-list 'dash-at-point-mode-alist '(playscala-mode . "playscala-mode"))
(add-to-list 'dash-at-point-mode-alist '(akka-mode . "akka"))
