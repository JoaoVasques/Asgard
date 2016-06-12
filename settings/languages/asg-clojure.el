; Clojure Emacs mode

(provide 'asg-clojure)

(require 'asg-common)

(defun load-asg-clojure ()
  (cond ((asg-command-exists? "which lein") 
         (asg-load-packages '(clojure-mode cider))
         (add-hook 'clojure-mode-hook #'subword-mode)
         (add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
         )
        ))

(load-asg-clojure)
