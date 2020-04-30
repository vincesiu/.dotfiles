;; sets backup directory
;; I get backups contained in one area
;; setq sets the variable to a value
(setq backup-directory-alist
      `(("." . ,"~/.emacsbackups/")))

;; downloads melpa
(require 'package)
(add-to-list 'package-archives
	     '("melpha" . "https://melpa.org/packages/") t)
(package-initialize)
(package-refresh-contents)

;; see https://github.com/rust-lang/rust-mode
;; add rust major mode
;; set rust major mode to use spaces instead of tabs
;; set rust major mode to use rustfmt when saving
(require 'rust-mode)
(add-hook 'rust-mode-hook
	  (lambda () (setq indent-tabs-mode nil)))
(setq rust-format-on-save t)

;; add php major mode
;;(require 'php-mode)
(autoload 'php-mode "php-mode" "Major mode for editing PHP code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;; sets the color schema as wheatgrass
(load-theme 'wheatgrass)

;; turns off the useless menu bar at the top
(menu-bar-mode -1)

;; add line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; set column number
(column-number-mode 1)

;; set ido mode
(ido-mode 1)
;; so ido works on ctrl-x ctrl-f
(setq ido-everywhere t)
;; so ido works with fuzzy matching
(setq ido-enable-flex-matching t)

;; sets line numbers on
(display-line-numbers-mode 1)
(setq display-line-numbers 'relative)


;;https://emacs.stackexchange.com/questions/33388/how-show-full-path-to-file
(setq frame-title-format
      '("" invocation-name ": "
	(:eval
	 (if buffer-file-name
	     (abbreviate-file-name buffer-file-name)
	                  "%b"))))


;; flymake goodness
(require 'flycheck)
(require 'flycheck-rust)

(add-hook 'after-init-hook #'global-flycheck-mode)

(with-eval-after-load 'rust-mode
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
;;(with-eval-after-load 'flycheck
;;  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))
;; (require 'flycheck-phpstan)
(require 'flycheck-pyflakes)

;; Personal functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun lintlint ()
  (indent-region (point-min) (point-max))
)

;; AUTOMATION SET EVERYTHING BELOW DO NOT TOUCH
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-pyflakes flycheck-pyre flycheck-inline flycheck-phpstan flymake-rust php-mode rust-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


