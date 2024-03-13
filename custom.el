(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-parse-self t)
 '(TeX-save-query nil)
 '(TeX-source-correlate-mode t)
 '(alert-default-style 'libnotify)
 '(before-save-hook '(copyright-update time-stamp))
 '(blink-cursor-mode t)
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(copyright-names-regexp "\\(Gabriel Sz[aá]sz\\|DTPA\\)")
 '(copyright-year-ranges t)
 '(csv-header-lines 1)
 '(csv-separators '("," "	" ";"))
 '(custom-enabled-themes '(adwaita))
 '(custom-file "~/.emacs.d/custom.el")
 '(custom-safe-themes
   '("e3c41651565cb624f772d25fbf12752b31610800041968d96c9aef5a3e8ead8e" default))
 '(cython-default-compile-format "python setup.py build_ext --inplace")
 '(delete-selection-mode t)
 '(dired-mode-hook '(hl-line-mode))
 '(emacs-lisp-mode-hook
   '(eldoc-mode flyspell-prog-mode whitespace-cleanup-mode set-fill-column-lisp))
 '(fill-column 80)
 '(font-use-system-font t)
 '(git-commit-setup-hook
   '(git-commit-save-message git-commit-setup-changelog-support git-commit-turn-on-auto-fill git-commit-turn-on-flyspell git-commit-propertize-diff bug-reference-mode with-editor-usage-message display-fill-column-indicator-mode set-fill-column-git-commit))
 '(git-commit-summary-max-length 50)
 '(global-whitespace-cleanup-mode t)
 '(global-yascroll-bar-mode t)
 '(hledger-currency-string "CZK")
 '(hledger-jfile "~/Documents/Finance/Accounting/all.journal")
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(ispell-dictionary "en_US")
 '(ivy-mode t)
 '(mouse-autoselect-window t)
 '(org-babel-load-languages '((emacs-lisp . t) (shell . t)))
 '(org-startup-folded nil)
 '(org-tags-column -80)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(hledger-mode flymake-hledger ob-async org-gtd elpy cython-mode ada-mode adaptive-wrap apache-mode counsel-projectile csv-mode flyspell-correct-ivy gnuplot ivy-bibtex markdown-mode olivetti php-mode pkg-info projectile pygn-mode speed-type stripes syslog-mode visual-fill-column whitespace-cleanup-mode yascroll))
 '(recentf-mode t)
 '(safe-local-variable-values '((bibtex-dialect . biblatex)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-allow-unsafe-temporary-files t)
 '(tramp-use-ssh-controlmaster-options nil)
 '(warning-suppress-log-types '((comp)))
 '(yaml-mode-hook
   '(yaml-set-imenu-generic-expression flyspell-prog-mode whitespace-cleanup-mode smart-ansible-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(yascroll:thumb-fringe ((t (:background "gray62" :foreground "gray62"))))
 '(yascroll:thumb-text-area ((t (:background "gray62")))))
