; Python Mode

(provide 'asg-python)

(require 'asg-common)

(defun elpy-setup ()
  (elpy-enable)
  (define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)
  (define-key global-map (kbd "C-c o") 'iedit-mode)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq elpy-rpc-backend "jedi"))

(defun anaconda-setup ()
  (add-hook 'python-mode-hook 'anaconda-mode)
  (add-hook 'python-mode-hook 'anaconda-eldoc-mode))

(defun load-asg-python ()
  (asg-load-packages '(anaconda-mode elpy))
  (setq py-python-command "python3")
  (anaconda-setup)
  (elpy-setup))


(load-asg-python)
