;; Start emacs server
(server-start)
;; Disable gui parts
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; changes cursor from block to bar
(setq-default cursor-type 'bar)
;; saves opened files on exit
(desktop-save-mode 1)

;; key binding where no package is required
(global-set-key (kbd "RET") 'newline-and-indent);return will indent now
(global-set-key [f5] 'revert-buffer)
(global-set-key (kbd "C--") 'split-window-below)
(global-set-key (kbd "C-\\") 'split-window-right)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "C-b") 'backward-word)
