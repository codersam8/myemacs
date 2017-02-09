;; Start emacs server

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; (setq url-proxy-services '(("no_proxy" . "localhost,127.0.0.1,*.oracle.com")
;;                            ("http" . "www-proxy.us.oracle.com:80")
;; ("https" . "www-proxy.us.oracle.com:80")))

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
(global-set-key [f5] 'revert-buffer)
(global-set-key (kbd "C--") 'split-window-below)
(global-set-key (kbd "C-\\") 'split-window-right)
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "C-b") 'backward-word)
(global-set-key (kbd "C-f") 'forward-word)
(global-set-key (kbd "C-j") 'switch-to-buffer)
(global-set-key (kbd "C-k") 'query-replace)
(global-set-key (kbd "C-l") 'goto-line) 
(global-set-key (kbd "C-o") 'find-file) ; finding files
(global-set-key (kbd "C-q") 'rgrep) ; finding files
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "M-/") 'comment-dwim);for commenting and uncommenting
(global-set-key (kbd "M-a") 'beginning-of-buffer)
(global-set-key (kbd "M-b") 'backward-char)
(global-set-key (kbd "M-d") 'delete-char)
(global-set-key (kbd "M-e") 'end-of-buffer)
(global-set-key (kbd "M-f") 'forward-char)

(global-set-key (kbd "C-S-a") 'mark-whole-buffer)
(global-set-key (kbd "C-S-b") 'windmove-left)
(global-set-key (kbd "C-S-e") 'delete-window)
(global-set-key (kbd "C-S-f") 'windmove-right)
(global-set-key (kbd "C-S-n") 'windmove-down)
(global-set-key (kbd "C-S-p") 'windmove-up)

;; defining functions
(load-file "~/.emacs.d/elisp/functions.el")
;; installing packages
(load-file "~/.emacs.d/elisp/prelude.el")
(load-file "~/.emacs.d/elisp/enable-modes.el")
;; theme path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-modes
   (quote
    (emacs-lisp-mode lisp-mode lisp-interaction-mode slime-repl-mode nim-mode c-mode cc-mode c++-mode objc-mode swift-mode go-mode java-mode malabar-mode clojure-mode clojurescript-mode scala-mode scheme-mode ocaml-mode tuareg-mode coq-mode haskell-mode agda-mode agda2-mode perl-mode cperl-mode python-mode ruby-mode lua-mode tcl-mode ecmascript-mode javascript-mode js-mode js-jsx-mode js2-mode js2-jsx-mode coffee-mode php-mode css-mode scss-mode less-css-mode elixir-mode makefile-mode sh-mode fortran-mode f90-mode ada-mode xml-mode sgml-mode web-mode ts-mode sclang-mode verilog-mode qml-mode apples-mode fundamental-mode org-mode)))
 '(custom-safe-themes
   (quote
    ("e12ba1e45e55c1bb4c2727d1d861e94b0e5e93a38524c9e4505ca629269738a4" default)))
 '(package-selected-packages
   (quote
    (yaml-mode tide multiple-cursors adaptive-wrap zerodark-theme markdown-mode swiper magit web-mode transpose-frame tern smartparens projectile keyfreq js2-refactor ido-vertical-mode hungry-delete groovy-mode flx-ido fill-column-indicator epc elpy diminish dash-functional beacon auto-complete aggressive-indent ac-js2)))
 '(url-proxy-services (quote (("no_proxy" . "localhost,127.0.0.1,*.oracle.com")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
