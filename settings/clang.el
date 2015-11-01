; Modules for C programming

(provide 'clang)

(require 'cc-mode)
(ac-config-default)

(require 'auto-complete-clang)
(define-key c++-mode-map (kbd "C-S-<return>") 'ac-complete-clang)
