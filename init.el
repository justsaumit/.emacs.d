(setq user-full-name "Saumit Dinesan")
;; Disable splashscreen
(setq inhibit-startup-message t)
;; Disable menu menu-bar and tool-bar and scrollbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 10)

;; Set JetBrains mono as default font
(add-to-list 'default-frame-alist
	     '(font . "JetBrainsMono Nerd Font Mono-14"))

;; Save History
(savehist-mode +1)
(setq savehist-additional-variables '(kill-ring search-ring regexp-search-ring))

;; Set the default directory
;;(setq default-directory "/home/saumit/")

;; Package directory
(add-to-list 'load-path "/home/saumit/.emacs.d/Packages")

;; Basic modes
(blink-cursor-mode -1)
(column-number-mode +1)
(global-goto-address-mode +1) ;; allows access to urls within text files like https://draconyan.xyz
(global-visual-line-mode +1) ;; better wrapping around words
(delete-selection-mode +1)    ;; replace selected text on typing
(save-place-mode +1)          ;; save cursor location in every file

;; Set UTF-8 encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)

;; Backups
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq delete-old-versions -1)
(setq version-control t)
(setq vc-make-backup-files t)
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; relativenumberline
(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; Quickly access init.el
(global-set-key (kbd "C-c d")
		(lambda()
		  (interactive)
		  (find-file "~/.emacs.d/init.el")))

;; Recent files
(recentf-mode 1)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Global keys
;; If you use a window manager be careful of possible key binding clashes
(setq recenter-positions '(top middle bottom))
(global-set-key (kbd "C-1") 'kill-this-buffer)
(global-set-key (kbd "C-<down>") (kbd "C-u 1 C-v")) ;; scroll w ctrl<up/down>
(global-set-key (kbd "C-<up>") (kbd "C-u 1 M-v"))
(global-set-key (kbd "C-<tab>") 'other-window) ;; change window
(global-set-key (kbd "C-c c") 'calendar)
(global-set-key (kbd "C-x C-b") 'ibuffer)


 ;;;;;;;;;;;;;;
 ;; packages ;;
 ;;;;;;;;;;;;;;


;; Melpa setup
(require 'package)
(setq package-enable-at-startup nil)

(add-to-list 'package-archives
             '(("melpa" . "https://melpa.org/packages/")
               ("elpa" . "https://elpa.gnu.org/packages/")
               ("org" . "https://orgmode.org/elpa/")))
(package-initialize)

;; Easy Package Management
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Custom Startup Dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-startup-banner "~/.emacs.d/dracon.png")
  (setq dashboard-banner-logo-title "while(!(succeed = try() ) );"))

;;Smex - M-x enhancer
(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

;;LSP - Language Server Protocol
(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :commands lsp
  :ensure t)
(use-package lsp-ui :ensure t)

;; Vertico - Emacs completion(Uses GNU elpa)
(use-package vertico
  :ensure t
  :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous)
         ("C-f" . vertico-exit)
         :map minibuffer-local-map
         ("M-h" . backward-kill-word))
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))
;; Marginalia - Extra info for completion buffer by Vertico
(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

;;Auto written by emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(lsp-java lsp-mode dashboard use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
