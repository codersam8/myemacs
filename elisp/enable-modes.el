;; ace-window
;; (global-set-key (kbd "M-p") 'ace-window)
(setq-default indent-tabs-mode nil)
;; configuration for auto complete mode
(global-auto-complete-mode t)
(setq ac-ignore-case nil)
(ac-config-default)
(setq ac-delay 0)
(setq ac-disable-faces nil)
(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp  (current-buffer))
              
    (auto-complete-mode 1)))
(define-key ac-mode-map (kbd "<backtab>") 'auto-complete)

(defadvice auto-complete-mode (around disable-auto-complete-for-python)
  (unless (eq major-mode 'python-mode) ad-do-it))

(ad-activate 'auto-complete-mode)
(beacon-mode 1)


;; for django
(add-to-list 'load-path "~/.emacs.d/custom/django-mode")
(require 'django-html-mode)
(require 'django-mode)
;; (yas/load-directory "path-to/django-mode/snippets")
(add-to-list 'auto-mode-alist '("\\.djhtml$" . django-html-mode))

;; diminish mode
(require 'diminish)
(diminish 'auto-complete-mode)
(diminish 'smartparens-mode)

;; This is for making elpy mode work
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
;; elpy mode for python

(elpy-enable)
(define-key python-mode-map (kbd "<backtab>") nil)

(pyvenv-activate "~/pymacs")

;; company mode
(setq company-dabbrev-ignore-case t)
(setq company-idle-delay 0)
(define-key company-mode-map (kbd "<backtab>") 'company-complete)

;; workaround for fci-mode
;; (defvar sanityinc/fci-mode-suppressed nil)
;; (defadvice popup-create (before suppress-fci-mode activate)
;;   "Suspend fci-mode while popups are visible"
;;   (set (make-local-variable 'sanityinc/fci-mode-suppressed) fci-mode)
;;   (when fci-mode
;;     (turn-off-fci-mode)))
;; (defadvice popup-delete (after restore-fci-mode activate)
;;   "Restore fci-mode when all popups have closed"
;;   (when (and (not popup-instances) sanityinc/fci-mode-suppressed)
;;     (setq sanityinc/fci-mode-suppressed nil)
;;     (turn-on-fci-mode)))
;; avy-mode
(global-set-key (kbd "C-;") 'avy-goto-char-timer)

;; hungry delete mode
(unless (fboundp 'hungry-delete-mode)
  (package-install 'hungry-delete))

(require 'hungry-delete)
(global-hungry-delete-mode)
;; ido mode
(ido-mode 1)
(ido-everywhere t)
(setq ido-use-faces nil)
(flx-ido-mode t)			;enables fuzzy matching
(setq ido-enable-flex-matching t)
(setq ido-create-new-buffer 'always)
;; ido vertical mode
(ido-vertical-mode 1)

;; js2-mode setup
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; Don't warn me about not having semicolon at the end
(setq js2-strict-missing-semi-warning nil)
;; Don't warn me about not having semicolon at the end of one line functions
(setq js2-missing-semi-one-line-override t)
;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

;; magit mode
(global-set-key (kbd "C-x g") 'magit-status)


;; projectile
(projectile-mode +1)
(projectile-global-mode)
(global-set-key (kbd "C-h") 'projectile-find-file)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(defun projectile-kill-buffers-forget-project()
  (interactive)
  (projectile-invalidate-cache nil)
  (projectile-remove-current-project-from-known-projects)
  (projectile-kill-buffers)
)

(global-set-key (kbd "C-,") 'projectile-kill-buffers-forget-project)

;; rust-mode
(add-hook 'rust-mode-hook 'cargo-minor-mode)

;; multiple-cursors mode
(require 'multiple-cursors)

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)

(add-hook 'prog-mode-hook 'subword-mode)

;; smartparens
;; gets the default config
(require 'smartparens-config)
;; enables smartparens everywhere
(smartparens-global-mode t)
(setq sp-escape-quotes-after-insert nil)
(setq sp-escape-wrapped-region nil)
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay t)
;; shows parens when at parens
(show-smartparens-global-mode +1)
(global-set-key (kbd "M-[") 'sp-unwrap-sexp)

;; (setq sp-pair-overlay-face ((t (:inherit nil))))

;; typescript-mode
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; swiper mode
;; (global-set-key "\C-s" 'swiper)
(add-to-list 'auto-mode-alist '("\\.gradle\\'" . groovy-mode))


;; web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-engines-alist
      '(("django"    . "\\.html\\'"))
      )

;; yaml mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))

;; yasnippet
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/myemacs/snippets/")))
(yas-global-mode 1)
(define-key yas-minor-mode-map [(tab)] nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-<tab>") 'yas-expand)

;; theme setup
(load-theme 'monokai t)
(set-face-attribute 'default nil :height 140)
(add-to-list 'default-frame-alist '(ns-appearance . dark)) ;To solve title bar issue in mac
