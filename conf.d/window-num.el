;; Window Numbering
(use-package window-numbering
  :init
  (window-numbering-mode)
  (setq window-numbering-assign-func
        (lambda () (when (equal (buffer-name) "*Calculator*") 5))))
