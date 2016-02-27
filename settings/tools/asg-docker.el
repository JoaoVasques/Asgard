; Emacs docker mode

(provide 'asg-docker)

(setq-local my-docker-packages '(docker))

(dolist (package my-docker-packages)
  (unless (package-installed-p package)
    (package-install package)))


(require 'docker)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))
;; Use "docker-machine env box" command to find out your environment variables
(setenv "DOCKER_TLS_VERIFY" "1")
(setenv "DOCKER_HOST" "tcp://192.168.99.100:2376")
(setenv "DOCKER_CERT_PATH" "/Users/joaovasques/.docker/machine/machines/default")
(setenv "DOCKER_MACHINE_NAME" "default")

