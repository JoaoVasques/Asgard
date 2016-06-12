; Elixir Emacs mode

(provide 'asg-elixir)

(require 'asg-common)

(defun load-asg-elixir ()
  (cond ((asg-command-exists? "which iex")
         (asg-load-packages '(elixir-mode alchemist))
         (setq-local my-elixir-packages '(elixir-mode alchemist))

         ;; Mix setup
         (setq alchemist-mix-command "/usr/local/bin/mix")
         (setq alchemist-iex-program-name "/usr/local/bin/iex")
         (setq alchemist-execute-command "/usr/local/bin/elixir")
         (setq alchemist-compile-command "/usr/local/bin/elixirc")

         ;; Test mode
         (setq alchemist-test-display-compilation-output t))
	))

(load-asg-elixir)

