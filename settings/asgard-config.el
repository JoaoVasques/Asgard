(provide 'asgard-config)

(setq-local config-paths '("settings" "settings/languages" "settings/appearance" "settings/tools" "settings/navigation"))

(dolist (path config-paths)
  (add-to-list 'load-path (concat user-emacs-directory path)))

(defun load-languages ()
  "Load languages"
  (require 'asg-elixir)
  (require 'asg-scala)
  (require 'asg-clojure))

(load-languages)

(require 'asg-common)
(require 'asg-http)
(require 'asg-git)
(require 'asg-core)
(require 'find-file-in-repository)
(require 'asg-navigation)
(require 'dired-details)
(dired-details-install)
(require 'livedown)

;; Always pick up the most recent file from the filesystem
(global-auto-revert-mode 1)

(global-set-key (kbd "s-j") 'dired-jump)

(setq server-socket-dir "~/.emacs.d/server")

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(require 'asg-look)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "870a63a25a2756074e53e5ee28f3f890332ddc21f9e87d583c5387285e882099" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" default)))
 '(markdown-command "/usr/local/bin/pandoc")
 '(send-mail-function (quote mailclient-send-it))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'spark)
(require 'asg-docker)
