(package-initialize)

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
            '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
            '("elpa" . "http://elpa.gnu.org/packages/") t)
(defvar prelude-packages
  '(ace-window avy auto-complete hungry-delete diminish
               org web-mode
                  projectile epc ido-vertical-mode
                  js2-mode js2-refactor ac-js2
                  tern transpose-frame tide elpy
                  flx-ido beacon
                  dash dash-functional keyfreq
                  groovy-mode smartparens magit
                  yaml-mode
                  zerodark-theme)
  "A list of packages to ensure are installed at launch.")

(defun prelude-packages-installed-p ()
  (cl-loop for p in prelude-packages
	   when (not (package-installed-p p)) do (cl-return nil)
	   finally (cl-return t)))

(unless (prelude-packages-installed-p)
  ;; check for new packages (package versions)
  (message "%s" "Emacs Prelude is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ;; install the missing packages
  (dolist (p prelude-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(provide 'prelude-packages)
;; prelude end
