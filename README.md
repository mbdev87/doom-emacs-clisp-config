My common-lisp setup. 

One trick you might find useful is displaying absolute and relative line numbers at the same time. 
You can try adding this at the end of  your `config.el`:

```common-lisp
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

```

And you shoulud see: 

```
1 3
2 2
3 1
4 4
5 1
6 2
```
😎



### For Portacle users (see portacle folder): 

``` 
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

```
