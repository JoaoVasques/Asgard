(provide 'asg-common)

(defun asg-load-packages (packages-list)
  "Load all packages in packages-list"
  (dolist (package packages-list)
    ;; (unless (package-installed-p package)
    ;;   (package-install package))
    (require 'package)))

(defun asg-require-list-modules (modules)
  (dolist (module modules)
    (require 'module)))

(defun is-mac-osx? ()
  "Checks if the current OS is Mac OS"
  (eq system-type 'darwin))

(defun asg-command-exists? (cmd)
  (eq (shell-command cmd) 0))
