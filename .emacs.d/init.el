;
; Helpful sites:
;	https://melpa.org/#/getting-started
;	https://www.emacswiki.org/emacs/InstallingPackages
;	https://www.emacswiki.org/emacs/LoadPath
;	https://www.emacswiki.org/emacs/LoadingLispFiles
;	https://zhangda.wordpress.com/2016/02/15/configurations-for-beautifying-emacs-org-mode/
;maybe	https://orgmode.org/worg/org-tutorials/org4beginners.html
;	https://github.com/tecosaur/emacs-config/blob/master/config.org
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



;-------------;
;; Org mode: ;;
;-------------;

; font?

; uft coding?

; indentation
(add-hook 'org-mode-hook 'org-indent-mode)

; org bullet set:
(add-to-list 'load-path "~/DarksalmonEllipticalDrawings/.emacs.d/extensions/org-superstar-mode")
(require 'org-superstar)
(add-hook 'org-mode-hook (lambda () (org-superstar-mode 1)))

(setq org-superstar-headline-bullets-list '("◉" "☯" "○" "☯" "✸" "☯" "✿" "☯" "✜" "☯" "◆" "☯" "▶")
      org-superstar-prettify-item-bullets t )
(setq org-ellipsis " ▾ "
      org-hide-leading-stars t
      org-priority-highest ?A
      org-priority-lowest ?E
      org-priority-faces
      	'((?A . 'all-the-icons-red)
	(?B . 'all-the-icons-orange)
	(?C . 'all-the-icons-yellow)
	(?D . 'all-the-icons-green)
	(?E . 'all-the-icons-blue)))




