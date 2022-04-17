(scroll-bar-mode -1)

(load-theme 'tango-dark t)

(defun build ()
  "Build project"
  (interactive)
  (if (file-exists-p "build.bat") (compile "build.bat")))
(define-key global-map "\em" 'build)

(defun cpp-style ()
  (c-set-offset 'case-label '+)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0))

(add-hook 'c++-mode-hook 'cpp-style)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-to-list 'load-path (expand-file-name "~/emacs_packages/"))

(load "highlight-indent-guides.el")
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'character)