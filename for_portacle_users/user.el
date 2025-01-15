(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("845103fcb9b091b0958171653a4413ccfad35552bc39697d448941bcbe5a660d" default)))
 '(package-selected-packages
   (quote
    (evil ag expand-region multiple-cursors sublime-themes magit slime-company company-quickhelp company paredit sly slime neotree helpful doom-modeline doom-themes smex)))
 '(portacle-ide (quote sly)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

 ;; Set default font
(add-to-list 'default-frame-alist '(font . "Cascadia Code-10"))
(set-frame-font "Cascadia Code-10" nil t)

;; Load theme
(load-theme 'leuven t)

(ensure-installed 'evil)
(ensure-installed 'treemacs)
(ensure-installed 'treemacs-evil)

(require 'treemacs)
(require 'treemacs-evil) ;; Enables evil-mode keybindings in treemacs

(require 'evil)
(require 'linum) 

(evil-mode 1)

;; Enable relative line numbers globally
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

;; Load and enable linum-mode everywhere except treemacs
(defun enable-linum-mode ()
  "Enable linum-mode globally to display absolute line numbers alongside relative numbers,
   but disable them in treemacs buffers."
  (require 'linum) ;; Load linum library
  (global-linum-mode t) ;; Enable linum-mode globally

  ;; Disable linum-mode in treemacs
  (add-hook 'treemacs-mode-hook (lambda () (linum-mode -1))))

;; Call this function after Portacle loads
(add-hook 'after-init-hook #'enable-linum-mode)
