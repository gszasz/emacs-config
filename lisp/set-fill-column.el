;;; set-fill-column.el --- functions to quick set ‘fill-column’ value

;; Copyright (C) 2022-2023 Gabriel Szász

;; Author: Gabriel Szász
;; Version: 2.1

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

(defun set-fill-column-default ()
  "Set ‘fill-column’ to default value."
  (set-fill-column 80))

(defun set-fill-column-lisp ()
  "Set ‘fill-column’ to common value for Lisp programming."
  (set-fill-column 70))

(defun set-fill-column-pep8 ()
  "Set ‘fill-column’ to follow PEP 8 standard."
  (set-fill-column 79))

(defun set-fill-column-git-commit ()
  "Set ‘fill-column’ to follow the git commit message convention."
  (set-fill-column 72))

(defun set-fill-column-org-note ()
  "Set 'fill-column' to match org-gtd note indentation."
  (set-fill-column 78))

(provide 'set-fill-column)
