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
 '(csv-separators '("," "\11" ";"))
 '(custom-enabled-themes '(adwaita))
 '(custom-file "~/.emacs.d/custom.el")
 '(custom-safe-themes
   '("e3c41651565cb624f772d25fbf12752b31610800041968d96c9aef5a3e8ead8e" default))
 '(cython-default-compile-format "python setup.py build_ext --inplace")
 '(dired-mode-hook '(hl-line-mode))
 '(doc-view-scale-internally nil)
 '(emacs-lisp-mode-hook
   '(eldoc-mode flyspell-prog-mode whitespace-cleanup-mode set-fill-column-lisp))
 '(fill-column 79)
 '(font-use-system-font t)
 '(git-commit-setup-hook
   '(git-commit-save-message git-commit-setup-changelog-support git-commit-turn-on-auto-fill git-commit-turn-on-flyspell git-commit-propertize-diff bug-reference-mode with-editor-usage-message display-fill-column-indicator-mode set-fill-column-git-commit))
 '(git-commit-summary-max-length 50)
 '(global-whitespace-cleanup-mode t)
 '(global-yascroll-bar-mode t)
 '(hledger-currency-string "CZK")
 '(hledger-jfile "~/Documents/Finance/Accounting/2024.journal")
 '(hledger-year-of-birth 1982)
 '(image-auto-resize 'fit-window)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-frame-alist '((vertical-scroll-bars)))
 '(ispell-dictionary "en_US")
 '(ivy-mode t)
 '(mouse-autoselect-window t)
 '(org-babel-load-languages '((emacs-lisp . t) (shell . t) (python . t)))
 '(org-export-backends '(ascii html icalendar latex md odt))
 '(org-startup-folded nil)
 '(org-tags-column -80)
 '(package-archives
   '(("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
 '(package-selected-packages
   '(ada-mode adaptive-wrap apache-mode csv-mode cython-mode elpy flycheck-hledger flyspell-correct-ivy git-modes gnuplot hledger-mode ivy-bibtex magit-section markdown-mode ob-async org-gtd php-mode pip-requirements pkg-info pygn-mode stripes syslog-mode visual-fill-column whitespace-cleanup-mode yascroll))
 '(python-fill-docstring-style 'pep-257-nn)
 '(python-skeleton-autoinsert t)
 '(recentf-mode t)
 '(safe-local-variable-values
   '((outline-minor-mode-highlight . t)
     (outline-minor-mode-cycle . t)
     (eval let
           ((inhibit-read-only t)
            (compilation-filter-start
             (point-min)))
           (save-excursion
             (goto-char
              (point-max))
             (grep-filter)
             (set-buffer-modified-p nil)))
     (etags-regen-ignores "test/manual/etags/")
     (etags-regen-regexp-alist
      (("c" "objc")
       "/[ \11]*DEFVAR_[A-Z_ \11(]+\"\\([^\"]+\\)\"/\\1/" "/[ \11]*DEFVAR_[A-Z_ \11(]+\"[^\"]+\",[ \11]\\([A-Za-z0-9_]+\\)/\\1/"))
     (bibtex-dialect . biblatex)))
 '(scroll-bar-mode nil)
 '(shift-select-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(tramp-allow-unsafe-temporary-files t)
 '(tramp-use-ssh-controlmaster-options nil)
 '(warning-suppress-log-types '((comp)))
 '(winner-mode t)
 '(yaml-mode-hook
   '(yaml-set-imenu-generic-expression flyspell-prog-mode whitespace-cleanup-mode smart-ansible-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(yascroll:thumb-fringe ((t (:background "gray62" :foreground "gray62"))))
 '(yascroll:thumb-text-area ((t (:background "gray62")))))
