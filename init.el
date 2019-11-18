;; add this in ~/.emacs                    ;
;; (load-file "~/myemacs/init.el")
;; Start emacs server

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(server-start)
;; Disable gui parts
(set-language-environment "UTF-8")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
;; changes cursor from block to bar
(setq-default cursor-type 'bar)
;; saves opened files on exit
(desktop-save-mode 1)
(global-auto-revert-mode)
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
;; no need to type full yes
(fset 'yes-or-no-p 'y-or-n-p)
(server-start)
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(fset 'yes-or-no-p 'y-or-n-p)
(windmove-default-keybindings)		;move windows with shift and arrow keys
(setq confirm-nonexistent-file-or-buffer nil)
;; changes directory of backup files
(setq backup-directory-alist `(("." . "~/.saves")))
;; (setq make-backup-files nil);stop making bakcup files
;; wont ask if creating a new buffer
(setq confirm-nonexistent-file-or-buffer nil)
(setq column-number-mode t)
;; doesn't ask if killinga buffer with process attached
;; source https://www.masteringemacs.org/article/disabling-prompts-emacs
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
	kill-buffer-query-functions))
;; delets the highlighed text
(delete-selection-mode 1)
;; sets the frame format
(setq-default frame-title-format "%f")

;; key binding where no package is required
(global-set-key (kbd "RET") 'newline-and-indent);return will indent now
;; (global-set-key [f5] 'revert-buffer)
(global-set-key (kbd "C--") 'split-window-below)
(global-set-key (kbd "C-\\") 'split-window-right)
(global-set-key (kbd "C-/") 'comment-line)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "C-b") 'backward-word)
(global-set-key (kbd "C-f") 'forward-word)
(global-set-key (kbd "C-j") 'switch-to-buffer)
(global-set-key (kbd "C-k") 'query-replace)
(global-set-key (kbd "C-l") 'goto-line) 
(global-set-key (kbd "C-o") 'find-file) ; finding files
(global-set-key (kbd "C-q") 'rgrep) ; finding files
(global-set-key (kbd "C-t") 'other-frame) ; finding files
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-/") 'comment-dwim);for commenting and uncommenting
(global-set-key (kbd "M-a") 'beginning-of-buffer)
(global-set-key (kbd "M-b") 'backward-char)
(global-set-key (kbd "M-d") 'delete-char)
(global-set-key (kbd "M-e") 'end-of-buffer)
(global-set-key (kbd "M-f") 'forward-char)
(global-set-key (kbd "M-o") 'ace-window)
(global-set-key (kbd "M-s") 'save-buffer)
;; (global-set-key (kbd "\s s") 'save-buffer)

(global-set-key (kbd "C-S-a") 'mark-whole-buffer)
;; (global-set-key (kbd "C-S-b") 'windmove-left)
;; (global-set-key (kbd "C-S-e") 'delete-window)
;; (global-set-key (kbd "C-S-f") 'windmove-right)
;; (global-set-key (kbd "C-S-n") 'windmove-down)
;; (global-set-key (kbd "C-S-p") 'windmove-up)

;; defining functions
;; (load-file "~/projects/hacktober/projectile/projectile.el")
(load-file "~/sampath/myemacs/elisp/functions.el")
;; installing packages
(load-file "~/sampath/myemacs/elisp/prelude.el")
(load-file "~/sampath/myemacs/elisp/enable-modes.el")
;; theme path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


