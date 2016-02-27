; Clojure Emacs mode

(provide 'asg-clojure)

(setq-local my-clojure-packages '(clojure-mode))

(dolist (package my-clojure-packages)
  (unless (package-installed-p package)
    (package-install package)))

(require 'clojure-mode)

; Clojure setup

(add-hook 'clojure-mode-hook #'subword-mode)
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
