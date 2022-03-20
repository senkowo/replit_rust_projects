;
; Helpful sites:
;	https://melpa.org/#/getting-started
;

; Hide welcome screen
(setq inhibit-startup-screen t)

; Sets up evil-mode
(add-to-list 'load-path "~/DarksalmonEllipticalDrawings/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; Sets up Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

; Sets up powerline
(require 'powerline-evil)
(powerline-default-theme)

; Sets up theme
(load-theme 'inkpot t)



