

; Sets up MELPA
(require 'package)
(add-to-list 'package-archives
    '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

; Sets up evil-mode
(unless (package-installed-p 'evil)
    (package-install 'evil))
(require 'evil)
(evil-mode 1)