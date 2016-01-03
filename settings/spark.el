; Emacs module for Apache Spark
(provide 'apache-spark)

(require 'cl)

(defstruct spark-config
  "A Spark Config structure."
  ip
  (port 7077)
  (ui-port 8080))

(setf *print-circle* t)

(setq spark_home (getenv "SPARK_HOME"))
(setq is_spark_running nil)

(defun build-spark-commands (cmd_path)
  (concat spark_home cmd_path))

(defun get-spark-config ()
  (message spark_config))

(defun get-spark-config-from-log (log_line)
  (defun extract-value (position)
    (car (cdr (split-string (nth position log_line) " "))))

  (setq spark-config (make-spark-config
   :ip (extract-value 1)
   :port (extract-value 2)
   :ui-port (extract-value 3))))

(defun read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" t)))

(defun start-spark-master ()
  "Start a spark master"
  (interactive)
  (setq-local cmd (build-spark-commands "/sbin/start-master.sh"))
  (setq-local log_path (nth 4 (split-string (shell-command-to-string cmd))))
  (setq-local first_line (car (read-lines log_path)))
  (setq-local splited (split-string first_line "--"))
  (get-spark-config-from-log splited)
  (setq is_spark_running t))

(defun stop-spark-master ()
  "Stops a running spark master"
  (interactive)
  (setq-local cmd (build-spark-commands "/sbin/stop-master.sh"))
  (shell-command cmd)
  (setq is_spark_running nil))

(defun start-spark-slave ()
  "Start a spark slave"
  (interactive)
  (if is_spark_running
      (progn
        ()
        (setq-local master-location (concat "spark://" (spark-config-ip spark_config) ":" (spark-config-ui-port spark-config)))
        (message master-location)
        (setq-local cmd (build-spark-commands (concat "/sbin/start-slave.sh" " " master-location)))
        (shell-command cmd))
    (message "Cannot start slave: Master is not running. Please run: start-spark-master")))

(defun stop-spark-slave ()
  "Stops a running spark slave"
  (interactive)
  (if is_spark_running
      (progn
        (setq-local cmd (build-spark-commands "/sbin/stop-slave.sh"))
        (shell-command cmd)
        )
    (message "Cannot stop slave: Master is not running")))

(defun open-spark-dashboard ()
  "Opens the default dashboard of Spark"
  (interactive)
  (if is_spark_running
      (progn
        (setq-local dashboard_url "http://localhost:8080")
        (browse-url dashboard_url))
    (message "Cannot launch Dashboard: Spark Master is not running")))
