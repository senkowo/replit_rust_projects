;
; Helpful sites:
;	https://melpa.org/#/getting-started
;	https://www.emacswiki.org/emacs/InstallingPackages
;	https://www.emacswiki.org/emacs/LoadPath
;	https://www.emacswiki.org/emacs/LoadingLispFiles
;


;; Primary Load Path:




;------------;
;; General: ;;
;------------;

; Hide welcome screen
(setq inhibit-startup-screen t)

; Sets up evil-mode
(add-to-list 'load-path "~/DarksalmonEllipticalDrawings/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

; Sets up Melpa
;(require 'package)
;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;(package-initialize)




;------------------;
;; Customization: ;;
;------------------;

; Sets up powerline
(add-to-list 'load-path "~/DarksalmonEllipticalDrawings/.emacs.d/extensions/powerline-fork/")
(require 'powerline)
(powerline-default-theme)

; Sets up theme
(add-to-list 'custom-theme-load-path "~/DarksalmonEllipticalDrawings/.emacs.d/themes/")
(load-theme 'inkpot t)


;----------;
;; Tools: ;;
;----------;





;-----------------;
;; Lang Support: ;;
;-----------------;





;------------------;
;; Misc packages: ;;
;------------------;

; 2048
(add-to-list 'load-path "~/DarksalmonEllipticalDrawings/.emacs.d/extensions/2048-game")
(load "~/DarksalmonEllipticalDrawings/.emacs.d/extensions/2048-game/2048-game.el")




