;; Disable splashscreen
(setq inhibit-startup-message t)
;; Disable menu menu-bar and tool-bar and scrollbar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Set JetBrains mono as default font
(add-to-list 'default-frame-alist
	     '(font . "JetBrainsMono Nerd Font Mono-14"))
