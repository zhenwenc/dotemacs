;; Window Numbering
(window-numbering-mode)
(require 'window-numbering)

(setq window-numbering-assign-func
      (lambda () (when (equal (buffer-name) "*Calculator*") 5)))
