;; Hightlight symbol
(use-package highlight-symbol
  :ensure t
  :init
  (setq highlight-symbol-idle-delay 0.35)
  (define-globalized-minor-mode global-highlight-symbol-mode highlight-symbol-mode
    (lambda () (highlight-symbol-mode 1)))
  (global-highlight-symbol-mode 1))

;; Highlight indentation
(use-package highlight-indentation)
