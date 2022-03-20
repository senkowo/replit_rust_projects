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

(use-package rustic
	       :mode ("\\.rs\\'" . rustic-mode)
	         :config
		   (setq rustic-lsp-client k|lsp
			         rustic-lsp-server 'rust-analyzer
				         rustic-analyzer-command '("rust-analyzer")
					         rustic-enable-detached-file-support t)
		     (define-key rustic-mode-map (kbd "[") (k|double-tap-to-insert ?\())
		       (define-key rustic-mode-map (kbd "]") (k|double-tap-to-insert ?\)))
		         ;; (add-hook 'rustic-mode-hook #'company-mode)
			   (add-hook 'rustic-mode-hook #'subword-mode)
			     (add-hook 'rustic-mode-hook #'electric-pair-mode)

			       ;; fix a bug
			         (defun rustic-cargo-doc ()
				       "Open the documentation for the current project in a browser.
				   The documentation is built if necessary."
				       (interactive)
				           (if (y-or-n-p "Open docs for dependencies as well?")
					             (shell-command (concat (rustic-cargo-bin) " doc --open"))
						           (shell-command (concat (rustic-cargo-bin) " doc --open --no-deps")))))

(use-package ob-rust
	       :after org)

(defun cargo-play (arg)
    (interactive "P")
      (let* ((release-flag (if arg "--release" ""))
	              (command (format "cargo play %s %s &" release-flag (buffer-file-name))))
	    (shell-command command "*Cargo Play*")))

(defun rust-show (flags mode)
    (let* ((command (format "rustc %s -o /tmp/emacs-output %s" (mapconcat #'identity flags " ") (buffer-file-name)))
	            (buffer (get-buffer-create "*Rust Show*")))
          (shell-command command " *Rust Show Output*")
	      (switch-to-buffer-other-window buffer)
	          (insert-file "/tmp/emacs-output")
		      (funcall mode)))

(defun rust-show-mir (arg)
    (interactive "P")
      (let* ((opt-flag (if arg "-O" "")))
	    (rust-show (list opt-flag "--emit=mir") #'fundamental-mode)))

(defun rust-show-asm (arg)
    (interactive "P")
      (let* ((opt-flag (if arg "-O" "")))
	    (rust-show (list opt-flag "--emit=asm") #'asm-mode)))

(defun rust-show-llvm-ir (arg)
    (interactive "P")
      (let* ((opt-flag (if arg "-O" "")))
	    (rust-show (list opt-flag "--emit=llvm-ir") #'fundamental-mode)))

(defun rust (arg)
    (interactive "P")
      (find-file "/tmp/play.rs"))

(provide 'prelude-lang-rust)



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




