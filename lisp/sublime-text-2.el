;;; sublime-text-2.el --- Sublime Text 2 theme for Emacs

;; Copyright (C) 2016 Gabriel Szasz

;; Author: Gabriel Szasz <gabriel.szasz1@gmail.com>
;; Version: 0.1

;; This file is not part of GNU Emacs.

;; This program is free software: you can redistribute it and/or
;; Modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation, either version 3 of the
;; License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see
;; <http://www.gnu.org/licenses/>.

;;; Commentary:

;; To use the theme, add following lines to .emacs or init.el file:
;;
;;   (require 'sublime-text-2)
;;   (sublime-text-2)
;;
;; It's more convenient to invoke the theme only in graphic window:
;;
;;   (when (or (daemonp) (display-graphic-p))
;;     (require 'sublime-text-2)
;;     (sublime-text-2))

(defun sublime-text-2 ()
  (interactive)
  (color-theme-install
   '(sublime-text-2
      ((background-color . "#171717")
      (background-mode . light)
      (border-color . "#1a1a1a")
      (cursor-color . "#fce94f")
      (foreground-color . "#cfbfad")
      (mouse-color . "black"))
     (fringe ((t (:background "#1a1a1a"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
     (region ((t (:foreground "#404040" :background "#CC9900"))))
     (font-lock-builtin-face ((t (:foreground "#52e3f6"))))
     (font-lock-comment-face ((t (:foreground "#ffffff"))))
     (font-lock-function-name-face ((t (:foreground "#edd400"))))
     (font-lock-keyword-face ((t (:foreground "#ff007f"))))
     (font-lock-string-face ((t (:foreground "#ece47e"))))
     (font-lock-type-face ((t (:foreground"#8ae234"))))
     (font-lock-variable-name-face ((t (:foreground "#8ae234"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'sublime-text-2)
