;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-gruvbox)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type 'relative) ;; Set relative line numbers
;; Add the hybrid type for absolute on the current line

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; Enable prettify-symbols-mode globally
;;
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 12))

(global-prettify-symbols-mode 1)
(setq prettify-symbols-alist
      '(("lambda" . ?λ)
        ("->" . ?→)
        ("=>" . ?⇒)
        ("<=" . ?≤)
        (">=" . ?≥)
        ("!=" . ?≠)))

(add-hook 'lisp-mode-hook
          (lambda ()
            (when (or (string-suffix-p ".lisp" buffer-file-name) ; Check if the file is a .lisp file
                      (string-suffix-p ".lisp" (or buffer-file-name "")))
              (setq prettify-symbols-alist
                    '(("lambda" . ?λ)
                      ("defun" . ?ƒ)
                      ("->" . ?→)))
              (prettify-symbols-mode 1))))


(defun my/install-nerd-icons-fonts ()
  "Install Nerd Icons fonts if they are not already installed."
  (interactive)
  (unless (file-directory-p (expand-file-name "~/.local/share/fonts"))
    (nerd-icons-install-fonts t))) ;; Pass 't' for no confirmation

(add-hook 'after-init-hook #'my/install-nerd-icons-fonts)


;; If you prefer slime: 
;;(load (expand-file-name "~/.roswell/lisp/quicklisp/slime-helper.el"))
;;;; Replace "sbcl" with the path to your implementation
;;(setq inferior-lisp-program "sbcl")
(setq inferior-lisp-program "ros -Q run")

;;(slime-setup '(slime-fancy slime-repl slime-autodoc))

;; Enable company-mode globally
(after! company
  (global-company-mode))

;; Add SLY backend to company-mode
(after! sly
  (setq sly-company-backend 'sly-company)
  (add-hook 'sly-mode-hook 'company-mode)
  (add-hook 'sly-mrepl-mode-hook 'company-mode))

(setq company-idle-delay 0.2)  ;; Time before suggestions pop up
(setq company-minimum-prefix-length 1)  ;; Show suggestions after 1 character
(setq company-tooltip-align-annotations t)

(setq doom-font (font-spec :family "Fira Code" :size 14);; :weight 'light)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 12));; :weight 'light))

;; Enable relative line numbers globally
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Load and enable linum-mode everywhere
(defun enable-linum-mode ()
  "Enable linum-mode globally to display absolute line numbers alongside relative numbers."
  (require 'linum) ;; Load linum library
  (global-linum-mode t)) ;; Enable linum-mode globally

;; Call this function after Doom Emacs loads
(add-hook 'doom-init-ui-hook #'enable-linum-mode)


