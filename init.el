(x-focus-frame nil)
(setq mac-command-modifier 'super)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; List the package we want
;(setq package-list '(ensime magit multiple-cursors move-text find-file-in-repository dired-details ace-jump-mode yasnippet window-numbering expand-region neotree monokai-theme tidy rainbow-delimiters key-chord markdown-mode slime yafolding))

(package-initialize)

;; Fetch list of packages available
(unless package-archive-contents
	(package-refresh-contents))

;; install the packages that are missing, if any
;(dolist (package package-list)
;	(unless (package-installed-p package)
;		(package-install package)))

(add-to-list 'load-path (concat user-emacs-directory "settings"))

;(require 'my-golang)
;(require 'my-clang)
(require 'my-core)
(require 'my-elixir)
(require 'my-scala)

(require 'find-file-in-repository)

(require 'my-keysets)

(require 'dired-details)
(dired-details-install)

(require 'livedown)

;; Always pick up the most recent file from the filesystem
(global-auto-revert-mode 1)

(global-set-key (kbd "s-j") 'dired-jump)

(setq server-socket-dir "~/.emacs.d/server")

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

(setq inferior-lisp-program "/usr/local/bin/sbcl")

(require 'my-look)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "870a63a25a2756074e53e5ee28f3f890332ddc21f9e87d583c5387285e882099" "0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" default)))
 '(markdown-command "/usr/local/bin/pandoc")
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

(require 'my-ruby)
