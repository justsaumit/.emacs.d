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
(global-visual-line-mode +1)  ;; better wrapping around words
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
(global-display-line-numbers-mode t) ;; only for textfiles not shell buffers
(setq display-line-numbers-type 'relative)
;;Disable line numbers for certain modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

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

(setq package-archives
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

;; Rainbow delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

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

;; doom-modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline height 15))
(use-package all-the-icons
  :ensure t)
;; doom-themes
(use-package doom-themes
  :if window-system
  :ensure t
  :config
  (load-theme 'doom-tokyo-night t)
  (doom-themes-org-config))

;; which-key
(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

;;Auto written by emacs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(which-key rainbow-delimiters lsp-java lsp-mode dashboard use-package))
'(custom-safe-themes
   '("bf948e3f55a8cd1f420373410911d0a50be5a04a8886cabe8d8e471ad8fdba8e" "5586a5db9dadef93b6b6e72720205a4fa92fd60e4ccfd3a5fa389782eab2371b" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "adaf421037f4ae6725aa9f5654a2ed49e2cd2765f71e19a7d26a454491b486eb" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "60ada0ff6b91687f1a04cc17ad04119e59a7542644c7c59fc135909499400ab8" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "6945dadc749ac5cbd47012cad836f92aea9ebec9f504d32fe89a956260773ca4" "7a424478cb77a96af2c0f50cfb4e2a88647b3ccca225f8c650ed45b7f50d9525" "be84a2e5c70f991051d4aaf0f049fa11c172e5d784727e0b525565bb1533ec78" "944d52450c57b7cbba08f9b3d08095eb7a5541b0ecfb3a0a9ecd4a18f3c28948" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "1a1ac598737d0fcdc4dfab3af3d6f46ab2d5048b8e72bc22f50271fd6d393a00" default))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
