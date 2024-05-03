;;; ansible-extras.el --- functions to extend ‘ansible.el’  -*- lexical-binding: t; -*-

;; Copyright (C) 2022, 2024 Gabriel Szász

;; Author: Gabriel Szász
;; Version: 1.1

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

(defun smart-ansible-mode ()
  "Smart ansible minor mode hook function for yaml-mode."
  (when (string-match "\\.yml$" (or (buffer-file-name) (buffer-name)))
    (ansible 1)))

(provide 'ansible-extras)
