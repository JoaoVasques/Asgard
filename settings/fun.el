(provide 'fun)

(defun install-funny-packages ()
  (setq-local fun-packages '(pacmacs))
  (dolist (package fun-packages)
    (unless (package-installed-p package)
      (package-install package)))
  )

