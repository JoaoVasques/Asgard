; Elixir Emacs mode

(provide 'my-elixir)

(setq-local my-elixir-packages '(elixir-mode alchemist))

(dolist (package my-elixir-packages)
  (unless (package-installed-p package)
    (package-install package)))

(require 'alchemist)
(require 'elixir-mode)

;; Mix setup
(setq alchemist-mix-command "/usr/local/bin/mix")
(setq alchemist-iex-program-name "/usr/local/bin/iex")
(setq alchemist-execute-command "/usr/local/bin/elixir")
(setq alchemist-compile-command "/usr/local/bin/elixirc")

;; Test mode
(setq alchemist-test-display-compilation-output t)
