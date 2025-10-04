;; ------------------------------------------------------------
;; Basic Emacs initialization
;; ------------------------------------------------------------
(require 'package)
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))
(package-initialize)

;; ------------------------------------------------------------
;; Install essential packages (auto if missing)
;; ------------------------------------------------------------
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t)

;; ------------------------------------------------------------
;; UI tweaks
;; ------------------------------------------------------------
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-message t
      visible-bell t
      line-spacing 0.2
      mac-option-modifier 'meta
      mac-command-modifier 'super)
(global-display-line-numbers-mode 1)
(column-number-mode 1)
; modus-vivendi — modern, accessible, official GNU default
; wombat — classic soft dark 
; tango-dark — warm dark
; deeper-blue - stron contrast
(load-theme 'modus-vivendi t) 

;; ------------------------------------------------------------
;; Fonts (macOS)
;; ------------------------------------------------------------
(when (display-graphic-p)
  (set-face-attribute 'default nil :family "Fira Code" :height 180)
  (set-face-attribute 'fixed-pitch nil :family "Fira Code" :height 180)
  (set-face-attribute 'variable-pitch nil :family "Helvetica Neue" :height 180))

;; ------------------------------------------------------------
;; Org Mode setup
;; ------------------------------------------------------------
(setq org-directory "~/org"
      org-default-notes-file (concat org-directory "/notes.org")
      org-startup-indented t
      org-hide-leading-stars t
      org-pretty-entities t
      org-latex-compiler "xelatex") ;; for math fonts/unicode

(use-package org-latex-impatient
  :hook (org-mode . org-latex-impatient-mode))

;; ------------------------------------------------------------
;; LaTeX (AUCTeX)
;; ------------------------------------------------------------
(setq TeX-auto-save t
      TeX-parse-self t
      TeX-save-query nil
      TeX-PDF-mode t
      TeX-source-correlate-mode t
      reftex-plug-into-AUCTeX t)

(add-hook 'LaTeX-mode-hook #'visual-line-mode)
(add-hook 'LaTeX-mode-hook #'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook #'turn-on-reftex)

;; ------------------------------------------------------------
;; Typst
;; ------------------------------------------------------------
(use-package typst-mode
  :ensure nil
  :load-path "~/.emacs.d/lisp/typst-mode"
  :mode "\\.typ\\'")

;; ------------------------------------------------------------
;; Programming languages
;; ------------------------------------------------------------
(add-hook 'rust-mode-hook #'cargo-minor-mode)
(add-hook 'haskell-mode-hook #'interactive-haskell-mode)

;; ------------------------------------------------------------
;; Git
;; ------------------------------------------------------------
(global-set-key (kbd "C-x g") #'magit-status)

;; ------------------------------------------------------------
;; Misc
;; ------------------------------------------------------------
(when (display-graphic-p)
  (mac-auto-operator-composition-mode))


; OLD config
; (require 'package)
; (custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
; '(package-selected-packages '(haskell-mode magit org org-latex-impatient rust-mode)))
; (require 'package)
; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
; (package-initialize)
; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;  )
