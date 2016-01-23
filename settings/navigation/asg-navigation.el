; Key definitions
(provide 'asg-navigation)

(setq-local keysets-packages '(ace-jump-mode expand-region))

;; install the packages that are missing, if any
(dolist (package keysets-packages)
	(unless (package-installed-p package)
		(package-install package)))

(global-linum-mode 1)
(global-set-key [f7] 'kill-whole-line)
(global-set-key (kbd "M-s M-m") 'magit-status)
(global-set-key (kbd "M-s M-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-x C-M-f") 'find-file-in-repository)
(global-set-key (kbd "C-c C-r r") 'ensime-refactor-rename)
(global-set-key (kbd "C-c C-o i") 'ensime-refactor-organize-imports)
(global-set-key (kbd "C-c C-i l") 'ensime-refactor-inline-local)
(global-set-key (kbd "C-c C-t i") 'ensime-inspect-by-path)
(put 'dired-find-alternate-file 'disabled nil)

;;Uncomment the below to hide the menu
(menu-bar-mode -1)

;; Uncomment below if you want to disable compile on save
;; (setq ensime-sbt-compile-on-save nil)

;; Some general-purpose key bindings
(global-set-key [kp-subtract] 'undo) ; [Undo]
(global-set-key (kbd "S-z") 'undo)
(global-set-key [insert]    'overwrite-mode) ; [Ins]
(global-set-key [kp-insert] 'overwrite-mode) ; [Ins]
(global-set-key (kbd "C-l") 'goto-line) ; [Ctrl]-l]
(global-set-key (kbd "C-L") 'recenter-top-bottom)
(global-set-key [f2] 'split-window-vertically)
(global-set-key [f1] 'remove-split)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".scala" ".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))



(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
 t)
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back:-)"
 t)

(define-key global-map (kbd "RET") 'newline-and-indent)

(defun search-to-brace ()
  "Jump to the next open brace"
  (interactive)
  (search-forward "{"))
(define-key global-map (kbd "M-s {") 'search-to-brace)

(defun search-to-prev-brace ()
    "Jump to the previous brace"
    (interactive)
    (search-backward "{"))
(define-key global-map (kbd "M-S {") 'search-to-prev-brace)

(defun search-to-close-brace ()
  "Jump to the next close brace"
  (interactive)
  (search-forward "}"))
(define-key global-map (kbd "M-s }") 'search-to-close-brace)

(defun search-to-prev-close-brace ()
  "Jump to the previous close brace"
  (interactive)
  (search-backward "}"))
(define-key global-map (kbd "M-S }") 'search-to-prev-brace)

(defun search-to-next-def ()
  "Jump to the next def"
  (interactive)
  (search-forward "def "))
(define-key global-map (kbd "M-s d") 'search-to-next-def)

(defun search-to-prev-def ()
  "Jump to the previous def"
  (interactive)
  (search-backward "def "))
(define-key global-map (kbd "M-S d") 'search-to-prev-def)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(define-key global-map (kbd "<backtab>") 'scala-indent:indent-with-reluctant-strategy)

;; window command shortcuts
(global-set-key (kbd "s-|") 'split-window-horizontally)
(global-set-key (kbd "C-x 9") 'split-window-horizontally)
(global-set-key (kbd "s--") 'split-window-vertically)
(global-set-key (kbd "s-+") 'remove-split)
(global-set-key (kbd "s-<up>") 'enlarge-window)
(global-set-key (kbd "s-<down>") 'shrink-window)
(global-set-key (kbd "s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-k") 'kill-whole-line)

(global-set-key (kbd "s-1") 'ace-jump-line-mode)
(global-set-key (kbd "s-2") 'ace-jump-word-mode)

(global-set-key (kbd "s-f") 'find-file-in-repository)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(defun save-all () (interactive) (save-some-buffers t))
(global-set-key (kbd "S-s") 'save-all)

(global-set-key (kbd "s-R") 'ensime-inf-eval-buffer)
(global-set-key (kbd "s-r") 'ensime-inf-eval-region)
