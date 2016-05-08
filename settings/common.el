(provide 'my-common)

(defun load-package(name)
  (unless (package-installed-p name)
    package-install name))
  

