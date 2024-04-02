;;; init.el --- My Emacs configuration  -*- lexical-binding: t; -*-

;; Copyright (C) 2016-2017, 2022-2024 Gabriel Szász

;; Author: Gabriel Szász
;; URL: https://github.com/gszasz/emacs-config

;; SPDX-License-Identifier: GPL-3.0-or-later

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see
;; <https://www.gnu.org/licenses/>.

;;; Commentary:

;; I combine RPM packages with MELPA while preferring Customize for
;; config whenever possible.

;;; Code:

;; Global key bindings

;; Set s-k to instantly kill current buffer
(global-set-key (kbd "s-k") 'kill-this-buffer)

;; Add Czech/Slovak letters and Euro sign to C-x 8 map
(dolist (binding '(("vC" . [?Č])
                   ("vc" . [?č])
                   ("vD" . [?Ď])
                   ("vd" . [?ď])
                   ("vE" . [?Ě])
                   ("ve" . [?ě])
                   ("vL" . [?Ľ])
                   ("vl" . [?ľ])
                   ("vN" . [?Ň])
                   ("vn" . [?ň])
                   ("vR" . [?Ř])
                   ("vr" . [?ř])
                   ("vS" . [?Š])
                   ("vs" . [?š])
                   ("vT" . [?Ť])
                   ("vt" . [?ť])
                   ("vZ" . [?Ž])
                   ("vz" . [?ž])
                   ("o" . nil) ; First unbind "o" from the map
                   ("oU" . [?Ů])
                   ("ou" . [?ů])
                   ("E" . [?€])
                   ))
  (define-key iso-transl-ctl-x-8-map (kbd (car binding)) (cdr binding)))

;; Emacs frames no longer follow X.Org defaults in Wayland.  I
;; workaround this issue by explicitly setting the frame size to 80x35
;; after new frame creation.
(add-hook 'after-make-frame-functions
          (lambda (frame) (set-frame-size frame 80 35)))

;; Emacs 29.2 does not define the untrusted-content buffer local
;; variable (introduced in Emacs 29.3, not yet part of Fedora 39);
;; however, some MELPA packages already expect it to be defined.  This
;; setting workarounds the issue.
(make-variable-buffer-local 'untrusted-content)

;; Load my functions
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'org-extras)
(require 'ansible-extras)
(require 'set-fill-column)
(require 'sort-extras)
(require 'unfill)

;; List of installed Emacs-related RPM packages:
;;
;; emacs emacs-ansible emacs-auctex emacs-dockerfile-mode
;; emacs-gettext emacs-goodies emacs-jedi emacs-json-mode emacs-magit
;; emacs-rpm-spec-mode emacs-yaml-mode

;; Load packages installed via RPM
(require 'ansible)
(require 'jedi)
(require 'magit)

;; Configure packages installed via RPM

;; Buffer Menu mode
(add-hook 'Buffer-menu-mode-hook #'hl-line-mode)

;; Package Menu mode
(add-hook 'package-menu-mode-hook #'hl-line-mode)

;; Bookmark Menu mode
(add-hook 'bookmark-bmenu-mode-hook #'hl-line-mode)

;; Shell Script mode
(add-to-list 'auto-mode-alist '("\\.bashrc\\'" . shell-script-mode))

;; Desktop Entry mode
(add-hook 'desktop-entry-mode-hook #'font-lock-fontify-buffer)

;; Conf mode
(add-to-list 'auto-mode-alist '("\\.repo\\'" . conf-unix-mode))

;; AUCTeX mode
(add-hook 'LaTeX-mode-hook #'flyspell-mode)
(add-hook 'LaTeX-mode-hook #'visual-line-mode)
(add-hook 'LaTeX-mode-hook #'adaptive-wrap-prefix-mode)
(add-hook 'LaTeX-mode-hook #'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; Org mode
(add-hook 'org-mode-hook #'flyspell-mode)
(add-hook 'org-mode-hook #'auto-fill-mode)
(add-hook 'org-mode-hook #'display-fill-column-indicator-mode)
(add-hook 'org-mode-hook #'set-date-header-arg-as-time-stamp)
(add-hook 'org-mode-hook #'setup-table-highlighting)
(add-hook 'orgtbl-mode-hook #'setup-table-highlighting)

;; Load and configure MELPA packages

;; projectile
(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :custom
  (counsel-projectile-mode t nil (counsel-projectile))
  (projectile-project-search-path '("~/src/"))
  :bind (:map projectile-mode-map
              ("s-p" . projectile-command-map)
              ("C-c p" . projectile-command-map)))

;; whitespace-cleanup-mode
(use-package whitespace-cleanup-mode
  :ensure t
  :custom
  (global-whitespace-cleanup-mode t))

;; flyspell-correct-ivy
(use-package flyspell-correct-ivy
  :ensure t
  :bind ("C-M-;" . flyspell-correct-wrapper)
  :init
  (setq flyspell-correct-interface #'flyspell-correct-ivy))

;; ob-async
(use-package ob-async
  :init
  (setq ob-async-no-async-languages-alist '("ipython"))
  :after org
  :demand t)

;; org-gtd mode
(use-package org-gtd
  :init
  (setq org-gtd-update-ack "3.0.0")
  :after org
  :demand t
  :custom
  (org-gtd-directory "~/org-gtd")
  (org-edna-use-inheritance t)
  (org-gtd-organize-hooks '(org-gtd-set-area-of-focus
                            org-set-tags-command))
  (org-log-buffer-setup-hook '(set-fill-column-org-note
                               display-fill-column-indicator-mode
                               auto-fill-mode))
  :config
  (org-edna-mode)
  :bind
  (("C-c d c" . org-gtd-capture)
   ("C-c d e" . org-gtd-engage)
   ("C-c d p" . org-gtd-process-inbox)
   :map org-gtd-clarify-map
   ("C-c c" . org-gtd-organize)))

;; hledger-mode
(use-package hledger-mode
  :ensure t
  :mode ("\\.journal\\'" "\\.hledger\\'")
  :bind (("C-c j" . hledger-run-command)
         :map hledger-mode-map
         ("C-c e" . hledger-jentry)
         ("C-c i" . hledger/indent-to-amount-column)
         ("M-p" . hledger/prev-entry)
         ("M-n" . hledger/next-entry))
  :hook ((hledger-mode . hledger/set-company-backend)
         (hledger-mode . company-mode)
         (hledger-mode . flycheck-mode))
  :custom
  (hledger-currency-string "CZK")
  (hledger-jfile "~/Documents/Finance/Accounting/2024.journal")
  (hledger-year-of-birth 1982)
  :preface
  (defun hledger/set-company-backend ()
    (setq-local company-backends '((hledger-company))))

  (defun hledger/indent-to-amount-column ()
    "Indent to the column with aligned amounts (now set to 31)."
    (interactive)
    (delete-horizontal-space)
    (indent-to-column 31))

  (defun hledger/next-entry ()
    "Move to next entry and pulse."
    (interactive)
    (hledger-next-or-new-entry)
    (hledger-pulse-momentary-current-entry))

  (defun hledger/prev-entry ()
    "Move to last entry and pulse."
    (interactive)
    (hledger-backward-entry)
    (hledger-pulse-momentary-current-entry))

  (defface hledger-warning-face
    '((((background dark))
       :background "Red" :foreground "White")
      (((background light))
       :background "Red" :foreground "White")
      (t :inverse-video t))
    "Face for warning"
    :group 'hledger))

;; flycheck-hledger
(use-package flycheck-hledger
  :after (flycheck hledger-mode)
  :demand t)

;; ElPy mode
(use-package elpy
  :ensure t
  :defer t
  :init (advice-add 'python-mode :before 'elpy-enable)
  :custom
  (elpy-mode-hook '(subword-mode display-fill-column-indicator-mode
                    set-fill-column-pep8)))

;; PHP mode
(use-package php-mode
  :ensure t
  :custom
  (php-mode-coding-style 'psr2)
  (php-mode-hook '(display-fill-column-indicator-mode
                   flyspell-prog-mode)))

;; CSV mode
(use-package csv-mode
  :ensure t
  :custom
  (csv-header-lines 1)
  (stripes-unit 1)
  :hook (csv-mode . stripes-mode))

;; Markdown mode
(use-package markdown-mode
  :ensure t
  :hook ((markdown-mode . display-fill-column-indicator-mode)
         (markdown-mode . whitespace-cleanup-mode)))

;; Syslog mode
(use-package syslog-mode
  :ensure t
  :mode ("\\/var/log/.*\\'" . syslog-mode))

;; PyGN mode
(use-package pygn-mode
  :ensure t
  :bind (:map pygn-mode-map
              ("C-c C-n" . pygn-mode-next-game)
              ("C-c C-p" . pygn-mode-previous-game)
              ("M-f" . pygn-mode-next-move-follow-board)
              ("M-b" . pygn-mode-previous-move-follow-board)
              ("C-c SPC". pygn-mode-display-gui-board-at-pos)
              ("C-h $" . pygn-mode-describe-annotation-at-pos))
  :hook ((pygn-mode . visual-line-mode)
         (pygn-mode . font-lock-fontify-buffer))
  :custom
  ;; pygn-mode-pythonpath is not automatically updated after pygn-mode
  ;; package update.  To workaround this issue I set the variable
  ;; here.
  (pygn-mode-pythonpath
   (concat (getenv "HOME")
           "/.emacs.d/elpa/pygn-mode-"
           (mapconcat 'number-to-string
                      (pkg-info-package-version 'pygn-mode) ".")
           "/lib/python/site-packages/")))

;; YaScroll
(use-package yascroll
  :ensure t
  :custom  (global-yascroll-bar-mode t)
  :custom-face
  (yascroll:thumb-fringe ((t (:background "gray62"
                              :foreground "gray62"))))
  (yascroll:thumb-text-area ((t (:background "gray62")))))

;; Load options set through Custom
(load "~/.emacs.d/custom.el")

;;; init.el ends here

;; Local Variables:
;; no-byte-compile: t
;; End:
