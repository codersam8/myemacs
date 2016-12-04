;; configuration for auto complete mode
(global-auto-complete-mode t)
(setq ac-ignore-case nil)
(ac-config-default)
(setq ac-delay 0)
(add-to-list 'ac-modes 'fundamental-mode
	     'markdown-mode)
(global-set-key (kbd "<backtab>") 'auto-complete)
;; ido mode
(ido-mode 1)
(ido-everywhere t)
(setq ido-use-faces nil)
(flx-ido-mode t)			;enables fuzzy matching
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
;; ido vertical mode
(ido-vertical-mode 1)

;; magit mode
(global-set-key (kbd "C-x g") 'magit-status)
;; projectile
(projectile-global-mode)
(global-set-key (kbd "C-h") 'projectile-find-file)

;; smartparens
;; gets the default config
(require 'smartparens-config)
;; enables smartparens everywhere
(smartparens-global-mode t)
;; shows parens when at parens
(show-smartparens-global-mode +1)
;; (setq sp-pair-overlay-face ((t (:inherit nil))))

;; swiper mode
(global-set-key "\C-s" 'swiper)
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))
