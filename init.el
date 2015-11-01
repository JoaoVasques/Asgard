(x-focus-frame nil)
(setq mac-command-modifier 'super)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))

;; List the package we want
(setq package-list '(ensime magit multiple-cursors move-text find-file-in-repository dired-details ace-jump-mode yasnippet window-numbering expand-region neotree monokai-theme tidy rainbow-delimiters key-chord markdown-mode slime yafolding))

(package-initialize)

;; Fetch list of packages available
(unless package-archive-contents
	(package-refresh-contents))

;; install the packages that are missing, if any
(dolist (package package-list)
	(unless (package-installed-p package)
		(package-install package)))

(add-to-list 'load-path (concat user-emacs-directory "settings"))

(require 'golang)
(require 'clang)
(require 'my-scala)
(require 'my-core)

(require 'find-file-in-repository)

(require 'my-keysets)

(require 'dired-details)
(dired-details-install)

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
