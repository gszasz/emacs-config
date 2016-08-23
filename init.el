;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Gabriel Szasz's Emacs Environment
;; http://physics.muni.cz/~gszasz/
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ----------------------------------------
;;  Load variables & faces added by Custom
;; ----------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-insert-mode t)
 '(before-save-hook (quote (copyright-update time-stamp)))
 '(calendar-week-start-day 1)
 '(column-number-mode t)
 '(fill-column 80)
 '(frame-background-mode (quote dark))
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(indicate-buffer-boundaries (quote right))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(org-footnote-auto-label (quote plain))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tab-width 4)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 '(tool-bar-mode nil))

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal))))
 '(calendar-today ((t :background "red")) t)
 '(term-color-blue ((t (:background "dodgerblue" :foreground "dodgerblue")))))

;; ---------------------------
;;  Add my elisp to load-path
;; ---------------------------
(add-to-list 'load-path "~/.emacs.d/lisp/")

;; ---------------------------------
;;  Load sublime-text-2 color theme
;; ---------------------------------
(require 'sublime-text-2)
(sublime-text-2)

;; -----------------------
;;  Set line highlighting
;; -----------------------
(require 'hl-line+)
;(toggle-hl-line-when-idle 1)
(global-hl-line-mode t)
(setq hl-line-inhibit-highlighting-for-modes (quote (Info-mode help-mode custom-mode view-mode term-mode shell-mode eshell-mode magit-status-mode calendar-mode)))

;; -----------------------
;;  Fill column indicator
;; -----------------------
(require 'fill-column-indicator)
(setq fci-rule-color "#555753")

;; --------------
;;  Set SpeedBar
;; --------------
(require 'sr-speedbar)
(setq sr-speedbar-skip-other-window-p t)
(setq speedbar-show-unknown-files t)
(setq speedbar-use-images nil)
(global-set-key (kbd "C-x M-o") (lambda ()
                                  (interactive)
                                 (unless (sr-speedbar-exist-p) (sr-speedbar-open))
                                  (sr-speedbar-select-window)))

(global-set-key (kbd "C-x M-c") (lambda ()
                                  (interactive)
                                  (sr-speedbar-close)))

;; -----------------
;;  Emacs-Lisp mode
;; -----------------
(add-hook 'emacs-lisp-mode-hook (lambda () (set-fill-column 70)))

;; -----------
;;  YAML mode
;; -----------
(require 'yaml-mode)
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; -----------
;; Python IDE
;; -----------
(package-initialize)
(elpy-enable)

;; -----------
;; PHP Mode
;; -----------
(require 'php-mode)
;; To use abbrev-mode, add lines like this:
(add-hook 'php-mode-hook 
          (lambda () (define-abbrev php-mode-abbrev-table "ex" "extends")
             (auto-fill-mode -1)
             (fci-mode 1)))

;; -------------------------------
;;  GitHub Flavored Markdown Mode
;; -------------------------------
(autoload 'gfm-mode "markdown-mode" "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
(add-hook 'gfm-mode-hook 
          (lambda () (fci-mode 1)))

;; -----------------------------------------
;;  Turn off linum-mode in some major modes
;; -----------------------------------------
;(require 'linum-off)
;(add-hook 'find-file-hook (lambda () (linum-mode -1)))

;; ------------
;; AUCTeX mode
;; ------------
(require 'tex)
(TeX-global-PDF-mode t)
(add-hook 'LaTeX-mode-hook 
          (lambda ()  (auto-fill-mode -1)
            (fci-mode 1)))

;; ----------------------------------------
;; Define keys for global clipboard access
;; ----------------------------------------
(global-set-key [(shift delete)] 'clipboard-kill-region)
(global-set-key [(control insert)] 'clipboard-kill-ring-save)
(global-set-key [(shift insert)] 'clipboard-yank)

;; ----------------
;; Git commit mode
;; ----------------
(require 'git-commit)
(add-hook 'git-commit-mode-hook
          (lambda () (set-fill-column 72)
            (auto-fill-mode 1)
            (fci-mode 1)))

;; -----------
;; magit mode
;; -----------
(require 'magit)
(global-set-key (kbd "C-x g") 'magit-status)
(add-hook 'magit-log-edit-mode-hook
          (lambda () (set-fill-column 72)
            (auto-fill-mode 1)
            (fci-mode 1)))

;; ------------------
;; Visual rectangles
;; ------------------
;(global-set-key (kbd "C-x r C-SPC") 'rm-set-mark)
;(global-set-key (kbd "C-x r C-x") 'rm-exchange-point-and-mark)
;(global-set-key (kbd "C-x r C-w") 'rm-kill-region)
;(global-set-key (kbd "C-x r M-w") 'rm-kill-ring-save)
(autoload 'rm-set-mark "rect-mark"
  "Set mark for rectangle." t)
(autoload 'rm-exchange-point-and-mark "rect-mark"
  "Exchange point and mark for rectangle." t)
(autoload 'rm-kill-region "rect-mark"
  "Kill a rectangular region and save it in the kill ring." t)
(autoload 'rm-kill-ring-save "rect-mark"
  "Copy a rectangular region to the kill ring." t)

;; -------------------------------------
;; Switch to previous window with C-x O
;; -------------------------------------
(global-set-key (kbd "C-x O") (lambda ()
                                (interactive)
                                (other-window -1)))


;; --------------------------------------
;; Define function for unfilling a block
;; --------------------------------------
(defun compact-uncompact-block ()
  "Remove or add line ending chars on current paragraph.
This command is similar to a toggle of `fill-paragraph'.
When there is a text selection, act on the region."
  (interactive)

  ;; This command symbol has a property “'stateIsCompact-p”.
  (let (currentStateIsCompact (bigFillColumnVal 90002000) (deactivate-mark nil))
    ;; 90002000 is just random. you can use `most-positive-fixnum'

    (save-excursion
      ;; Determine whether the text is currently compact.
      (setq currentStateIsCompact
            (if (eq last-command this-command)
                (get this-command 'stateIsCompact-p)
              (if (> (- (line-end-position) (line-beginning-position)) fill-column) t nil) ) )

      (if (use-region-p)
          (if currentStateIsCompact
              (fill-region (region-beginning) (region-end))
            (let ((fill-column bigFillColumnVal))
              (fill-region (region-beginning) (region-end))) )
        (if currentStateIsCompact
            (fill-paragraph nil)
          (let ((fill-column bigFillColumnVal))
            (fill-paragraph nil)) ) )

      (put this-command 'stateIsCompact-p (if currentStateIsCompact nil t)) ) ) )
