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
;; wont ask if creating a new buffer
(setq confirm-nonexistent-file-or-buffer nil)

;; key binding where no package is required
(global-set-key (kbd "RET") 'newline-and-indent);return will indent now
(global-set-key [f5] 'revert-buffer)
(global-set-key (kbd "C--") 'split-window-below)
(global-set-key (kbd "C-\\") 'split-window-right)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "C-b") 'backward-word)
(global-set-key (kbd "C-j") 'switch-to-buffer)
(global-set-key (kbd "C-o") 'find-file) ; finding files
;; installing packages
(load-file "~/elisp/prelude.el")
(load-file "~/elisp/enable-modes.el")
