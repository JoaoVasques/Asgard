; modules for swift

(provide 'asg-swift)

;(setq flycheck-swift-sdk-path "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk/")
;(setq swift "/usr/bin/swift")

(setq swift-packages '(swift-mode))

;; install the ruby packages that are missing, if any
(dolist (package swift-packages)
	(unless (package-installed-p package)
		(package-install package)))

(require 'swift-mode)

