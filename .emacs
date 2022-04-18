(scroll-bar-mode -1)

(load-theme 'tango-dark t)

(defun build ()
  "Build project"
  (interactive)
  (if (file-exists-p "build.bat") (compile "build.bat")))
(define-key global-map (kbd "M-m") 'build)

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

(set-frame-font "Consolas 11" nil t)

; fill-column is a buffer-level variable, so setq-default is required here
(setq-default fill-column 100)
(add-hook 'prog-mode-hook 'display-fill-column-indicator-mode)

; do this just for C++ right now
(defun kill-trailing-whitespace ()
  (when (or (derived-mode-p 'c++-mode) (derived-mode-p 'c-mode))
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'kill-trailing-whitespace)
