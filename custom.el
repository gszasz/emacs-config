(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-save-query nil)
 '(before-save-hook '(copyright-update))
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(copyright-year-ranges t)
 '(csv-header-lines 1)
 '(custom-enabled-themes '(adwaita))
 '(custom-file "~/.emacs.d/custom.el")
 '(dired-mode-hook '(hl-line-mode))
 '(emacs-lisp-mode-hook
   '(eldoc-mode flyspell-prog-mode whitespace-cleanup-mode set-fill-column-lisp))
 '(fill-column 80)
 '(font-use-system-font t)
 '(git-commit-setup-hook
   '(git-commit-save-message git-commit-setup-changelog-support git-commit-turn-on-auto-fill git-commit-turn-on-flyspell git-commit-propertize-diff bug-reference-mode with-editor-usage-message display-fill-column-indicator-mode set-fill-column-git-commit))
 '(git-commit-summary-max-length 50)
 '(global-yascroll-bar-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ivy-mode t)
 '(mouse-autoselect-window t)
 '(org-babel-load-languages '((emacs-lisp . t) (shell . t)))
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(yascroll whitespace-cleanup-mode use-package pygn-mode php-mode org-gtd markdown-mode magit-section gnuplot flycheck-grammarly emacsql-sqlite elpy ein csv-mode apache-mode))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(yaml-mode-hook
   '(yaml-set-imenu-generic-expression flyspell-prog-mode whitespace-cleanup-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(yascroll:thumb-fringe ((t (:background "gray62" :foreground "gray62"))))
 '(yascroll:thumb-text-area ((t (:background "gray62")))))
