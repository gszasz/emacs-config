;;; unfill.el --- set of functions for unfilling paragraphs

;; Copyright (C) 2016-2017, 2022 Gabriel Szász
;; Based on code at Emacs Wiki:
;; <https://www.emacswiki.org/emacs/UnfillParagraph>
;;   Copyright (C) 2018 Tom Baker
;;   Original Author: Stefan Monnier

;; Author: Gabriel Szász 
;; Version: 2.0

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

(defun unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line
    of text."
  (interactive (progn (barf-if-buffer-read-only) '(t)))
  (let ((fill-column (point-max))
    ;; This would override `fill-column' if it's an integer.
    (emacs-lisp-docstring-fill-column t))
    (fill-paragraph nil region)))

(define-key global-map "\M-Q" 'unfill-paragraph)

(provide 'unfill)
