;;; org-extras.el --- functions to extend org mode  -*- lexical-binding: t; -*-

;; Copyright (C) 2023-2024 Gabriel Szász

;; Author: Gabriel Szász
;; Version: 1.3

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

(defun highlight-current-table-line ()
  "Highlight current line if the cursor is in an org table."
  (interactive)
  (if (org-at-table-p)
      (hl-line-mode 1)
    (hl-line-mode -1)))

(defun setup-table-highlighting ()
  "Hook function to setup line highlighting for org tables."
  (add-hook 'post-command-hook #'highlight-current-table-line nil t))

(defun set-date-header-arg-as-time-stamp ()
  "Hook function to set DATE header argument as time stamp."
  (setq time-stamp-pattern "^#\\+\\(DATE\\|date\\): %Y-%m-%d$"))

(provide 'org-extras)
