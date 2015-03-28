(setq-default c-basic-offset 4)
(setq-default sgml-basic-offset 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq inhibit-startup-screen t)
(setq ns-pop-up-frames nil)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key "\C-x\C-b" 'switch-to-buffer)

(if (display-graphic-p)
    (set-frame-size (selected-frame) 100 50))

(global-auto-revert-mode t)

(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")

(add-to-list 'load-path "~/.emacs.d/site-lisp/powerline")
(require 'powerline)
(powerline-default-theme)

;(require 'package)
;(package-initialize)
;        
;(add-to-list 'package-archives
;             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(require 'cask)
(cask-initialize)

(add-hook 'after-init-hook #'global-flycheck-mode)

(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto$" . protobuf-mode))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-to-list 'auto-mode-alist '("program$" . c++-mode))

(require 'haml-mode nil 't)
(require 'sass-mode)
(add-to-list 'auto-mode-alist '("\\.hml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))

;(require 'color-theme)
;(color-theme-initialize)
;(load-file "~/Library/Application Support/Aquamacs Emacs/site-lisp/color-theme-railscasts.el")
;(load-file "~/.emacs.d/site-lisp/themes/color-theme-railscasts.el")
;(color-theme-railscasts)

(setq my-theme-dir "~/.emacs.d/site-lisp/themes")
(add-to-list 'load-path my-theme-dir)
(setq custom-theme-directory my-theme-dir)

; The colors don't look right in a terminal (over SSH),
; and I haven't figured out why yet.
(if (display-graphic-p)
    ;(load-theme 'railscasts t))
    (load-theme 'solarized-dark t))

(require 'ido)
(ido-mode 1)
(setq ido-enable-flex-matching t)

(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;(autoload 'pymacs-apply "pymacs")
;(autoload 'pymacs-call "pymacs")
;(autoload 'pymacs-eval "pymacs" nil t)
;(autoload 'pymacs-exec "pymacs" nil t)
;(autoload 'pymacs-load "pymacs" nil t)
;(autoload 'pymacs-autoload "pymacs")
;(eval-after-load "pymacs"
;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

;(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")

(require 'python)


(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)


(if window-system
    (set-frame-size (selected-frame) 100 50))
(put 'upcase-region 'disabled nil)

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(global-set-key (kbd "C-x |") 'toggle-window-split)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-set-key (kbd "C-c d")
                (lambda ()
                  (interactive)
                  (shell-command "zsh -c \". ~/.zshrc; dev_since\"")))

(require 'xcscope)
