;; Start emacs server

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(server-start)
;; Disable gui parts
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; changes cursor from block to bar
(setq-default cursor-type 'bar)
;; saves opened files on exit
(desktop-save-mode 1)
;; no need to type full yes
(fset 'yes-or-no-p 'y-or-n-p)
(server-start)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(windmove-default-keybindings)		;move windows with shift and arrow keys
(setq confirm-nonexistent-file-or-buffer nil)
(setq make-backup-files nil);stop making bakcup files
;; wont ask if creating a new buffer
(setq confirm-nonexistent-file-or-buffer nil)
;; doesn't ask if killinga buffer with process attached
;; source https://www.masteringemacs.org/article/disabling-prompts-emacs
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
	kill-buffer-query-functions))
;; delets the highlighed text
(delete-selection-mode 1)

;; key binding where no package is required
(global-set-key (kbd "RET") 'newline-and-indent);return will indent now
(global-set-key [f5] 'revert-buffer)
(global-set-key (kbd "C--") 'split-window-below)
(global-set-key (kbd "C-\\") 'split-window-right)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "C-b") 'backward-word)
(global-set-key (kbd "C-f") 'forward-word)
(global-set-key (kbd "C-j") 'switch-to-buffer)
(global-set-key (kbd "C-o") 'find-file) ; finding files
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-a") 'beginning-of-buffer)
(global-set-key (kbd "M-b") 'backward-char)
(global-set-key (kbd "M-d") 'delete-char)
(global-set-key (kbd "M-e") 'end-of-buffer)
(global-set-key (kbd "M-f") 'forward-char)

;; defining functions
(load-file "~/elisp/functions.el")
;; installing packages
(load-file "~/elisp/prelude.el")
(load-file "~/elisp/enable-modes.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode transpose-frame tern smartparens projectile magit keyfreq js2-refactor ido-vertical-mode hungry-delete groovy-mode flx-ido fill-column-indicator epc elpy diminish dash-functional color-theme-sanityinc-tomorrow beacon auto-package-update auto-complete aggressive-indent ac-js2))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
