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
    (load-theme 'railscasts t))

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
