;;; init.el --- My Emacs configuration
;; Copyright (C) 2016-2017, 2022  Gabriel Szász
;; SPDX-License-Identifier: GPL-3.0-or-later
;;
;; Author: Gabriel Szász <gabriel.szasz1@gmail.com>
;; Homepage: https://github.com/gszasz/emacs-config
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software: you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see
;; <https://www.gnu.org/licenses/>.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; I combine RPM packages with MELPA while prefering Customize for
;; config whenever possible.
;;
;;; Code:

;; Load my functions
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'unfill)
(require 'set-fill-column)

;; List of installed Emacs-related RPM packages:
;;
;; emacs-filesystem, emacs-common, emacs, emacs-dash, emacs-deferred,
;; emacs-with-editor, emacs-async,emacs-ctable, emacs-epc, emacs-epl,
;; emacs-pkg-info, emacs-flycheck, emacs-json-reformat,
;; emacs-json-snatcher, emacs-popup, emacs-auto-complete, emacs-s,
;; emacs-transient, emacs-python-environment, emacs-auctex,
;; emacs-jedi, emacs-magit, emacs-dockerfile-mode, emacs-json-mode,
;; emacs-flycheck-pycheckers, emacs-cython-mode, emacs-gettext,
;; emacs-goodies, emacs-rpm-spec-mode, emacs-yaml-mode

;; Load packages installed via RPM
(require 'magit)
(require 'jedi)

;; Configure packages installed via RPM

;; Buffer Menu mode
(add-hook 'buffer-menu-mode-hook #'hl-line-mode)

;; Package Menu mode
(add-hook 'package-menu-mode-hook #'hl-line-mode)

;; AUCTeX mode
(add-hook 'LaTeX-mode-hook #'visual-line-mode)
(add-hook 'LaTeX-mode-hook #'flycheck-mode)
(add-hook 'LaTeX-mode-hook #'whitespace-cleanup-mode)

;; Load and configure MELPA packages

;; org-gtd mode
(use-package org-gtd
  :after org
  :demand t
  :custom
  (org-gtd-mode t)
  :bind
  (("C-c d c" . org-gtd-capture)
   ("C-c d e" . org-gtd-engage)
   ("C-c d p" . org-gtd-process-inbox)
   ("C-c d n" . org-gtd-show-all-next)
   ("C-c d s" . org-gtd-show-stuck-projects)
   :map org-gtd-process-map
   ("C-c c" . org-gtd-choose)))

;; Flycheck-grammarly
(use-package flycheck-grammarly
  :after flycheck
  :config (flycheck-grammarly-setup))

;; ElPy mode
(use-package elpy
  :ensure t
  :defer t
  :init (advice-add 'python-mode :before 'elpy-enable)
  :custom
  (elpy-mode-hook '(subword-mode display-fill-column-indicator-mode
		    whitespace-cleanup-mode set-fill-column-pep8)))

;; PHP mode
(use-package php-mode
  :config
  :custom
  (php-mode-coding-style 'psr2)
  (php-mode-hook '(display-fill-column-indicator-mode
		   flyspell-prog-mode whitespace-cleanup-mode)))

;; CSV mode
(use-package csv-mode
  :custom (csv-header-lines 1))

;; Markdown mode
(use-package markdown-mode
  :hook ((markdown-mode . display-fill-column-indicator-mode)
	 (markdown-mode . whitespace-cleanup-mode)))

;; PyGN mode
(use-package pygn-mode
  :bind (:map pygn-mode-map
	      ("C-c C-n" . pygn-mode-next-game)
	      ("C-c C-p" . pygn-mode-previous-game)
	      ("M-f" . pygn-mode-next-move-follow-board)
	      ("M-b" . pygn-mode-previous-move-follow-board)
	      ("C-c SPC". pygn-mode-display-gui-board-at-pos)
	      ("C-h $" . pygn-mode-describe-annotation-at-pos))
  :hook ((pygn-mode . whitespace-cleanup-mode)
	 (pygn-mode . visual-line-mode))
  :custom
  (pygn-mode-pythonpath
   (concat "~/.emacs.d/elpa/pygn-mode-"
           (mapconcat 'number-to-string (pkg-info-package-version 'pygn-mode) ".")
           "/lib/python/site-packages"))

;; YaScroll
(use-package yascroll
  :custom  (global-yascroll-bar-mode t)
  :custom-face
  (yascroll:thumb-fringe ((t (:background "gray62"
			      :foreground "gray62"))))
  (yascroll:thumb-text-area ((t (:background "gray62")))))

;; Load options set through Custom
(load "~/.emacs.d/custom.el")

;;; init.el ends here
