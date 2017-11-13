;;; init.el --- Initialize Gabriel Szasz's Emacs Environment

;; Copyright (C) 2016, 2017 Gabriel Szasz

;; Author: Gabriel Szasz <gabriel.szasz1@gmail.com>
;; Version: 1.0

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see
;; <http://www.gnu.org/licenses/>.

;; Add my lisp directory to load-path
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; Workarounds for 'emacsclient -c' issues (Emacs 25.3.1)
(when (daemonp)
  ;; Issue: Custom buffers do not display graphic buttons.
  (setq custom-raised-buttons t)
  ;; Issue: Cursor is not blinking.
  (blink-cursor-mode 1))

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; Load variables & faces added by Custom
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

;; Fill column indicator
(require 'fill-column-indicator)

;; Autocomplete
(require 'auto-complete)

;; Emacs-Lisp mode
(add-hook 'emacs-lisp-mode-hook
          (lambda () (set-fill-column 70)
            (add-hook 'before-save-hook 'whitespace-cleanup nil t)))

;; YAML mode
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook
          (lambda () (define-key yaml-mode-map (kbd "C-m") 'newline-and-indent)
            (add-hook 'before-save-hook 'whitespace-cleanup nil t)))

;; CSV mode
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode" "Major mode for editing comma-separated value files." t)

;; MediaWiki mode
(require 'mediawiki)
(add-to-list 'auto-mode-alist '("\\.wiki\\'" . mediawiki-mode))
(add-hook 'mediawiki-mode-hook
      (lambda () (local-unset-key (kbd "M-g"))
        (local-unset-key (kbd "C-x C-s"))
        (remove-hook 'outline-minor-mode-hook 'mediawiki-outline-magic-keys)))

;; PYTHON IDE
(elpy-enable)
(add-hook 'python-mode-hook
          (lambda () (fci-mode 1)
            (add-hook 'before-save-hook 'whitespace-cleanup nil t)))

;; PHP Mode
(require 'php-mode)
;; To use abbrev-mode, add lines like this:
(add-hook 'php-mode-hook
          (lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")
            (auto-fill-mode -1)
            (fci-mode 1)
            (add-hook 'before-save-hook 'whitespace-cleanup nil t)))

;; GitHub Flavored Markdown Mode
(autoload 'gfm-mode "markdown-mode" "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-hook 'gfm-mode-hook
          (lambda () (fci-mode 1)
            (add-hook 'before-save-hook 'whitespace-cleanup nil t)))

;; AUCTeX mode
(require 'tex-mode)
(require 'auto-complete-auctex)
(TeX-global-PDF-mode t)
(add-hook 'LaTeX-mode-hook
      (lambda ()  (flyspell-prog-mode)
        (auto-fill-mode -1)
        (fci-mode 1)
        (add-hook 'before-save-hook 'whitespace-cleanup nil t)))

;; Gnuplot mode
(require 'gnuplot-mode)
(add-hook 'gnuplot-mode-hook
          (lambda ()
            (flyspell-prog-mode)
            (add-hook 'before-save-hook 'whitespace-cleanup nil t)))

;; Define key for Magit mode
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

;; Define keys for global clipboard access
(global-set-key (kbd "S-<delete>") 'clipboard-kill-region)
(global-set-key (kbd "C-<insert>") 'clipboard-kill-ring-save)
(global-set-key (kbd "S-<insert>") 'clipboard-yank)

;; Map right mouse button to open mode-specific menu
(global-set-key [mouse-3] 'mouse-popup-menubar-stuff)

;; Define keys for windmove control
(global-set-key (kbd "M-s-<left>") 'windmove-left)
(global-set-key (kbd "M-s-<right>") 'windmove-right)
(global-set-key (kbd "M-s-<up>") 'windmove-up)
(global-set-key (kbd "M-s-<down>") 'windmove-down)

;; Switch to previous window with C-x O
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))

;; Unfill paragraph with s-q
(require 'unfill)
(global-set-key (kbd "s-q") 'unfill-paragraph)
