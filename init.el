(x-focus-frame nil)
(setq mac-command-modifier 'super)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

(package-initialize)

;; Fetch list of packages available
(when (not package-archive-contents)
  (package-refresh-contents))

;(unless package-archive-contents
;	(package-refresh-contents))

(add-to-list 'load-path (concat user-emacs-directory "settings"))

(require 'asgard-config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "0aa12caf6127772c1a38f7966de8258e7a0651fb6f7220d0bbb3a0232fba967f" "e24679edfdea016519c0e2d4a5e57157a11f928b7ef4361d00c23a7fe54b8e01" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "870a63a25a2756074e53e5ee28f3f890332ddc21f9e87d583c5387285e882099" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" default)))
 '(markdown-command "/usr/local/bin/pandoc")
 '(send-mail-function (quote mailclient-send-it))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
