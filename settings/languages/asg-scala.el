; Modules for scala
(provide 'asg-scala)

(require 'asg-common)

(defun load-asg-scala ()
  (cond ((asg-command-exists? "which sbt")
         (asg-load-packages '(multiple-cursors))

         ;; If necessary, make sure "sbt" and "scala" are in the PATH environment
         (setq exec-path (append exec-path '("/usr/local/bin/sbt")))

         (asg-load-packages '(ensime))

         ;; Start ensime with Super-e
         (global-set-key (kbd "C-c C-c c") 'ensime)

         (setq ensime-sem-high-faces
               '(
                 (var . (:foreground "#ff2222"))
                 (val . (:foreground "#dddddd"))
                 (varField . (:foreground "#ff3333"))
                 (valField . (:foreground "#dddddd"))
                 (functionCall . (:foreground "#84BEE3"))
                 (param . (:foreground "#ffffff"))
                 (class . font-lock-type-face)
                 (trait . (:foreground "#084EA8"))
                 (object . (:foreground "#026DF7"))
                 (package . font-lock-preprocessor-face)
                 ))

         (global-set-key (kbd "s-T") 'jump-to-test)
         )))

(load-asg-scala)
