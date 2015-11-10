;; Go Mode
(require 'go-mode)
(require 'company)
(require 'company-go)

;;; Code:
(defun my-go-mode-hook ()
  (setq tab-width 2)
  ; Only use company-go in go-mode
  (set (make-local-variable 'company-backends) '(company-go))
  ; FlyCheck syntac
  (flycheck-mode t)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go generate && go build -v && go test -v && go vet"))
  ; Company-go autocomplate
  ; (local-key-set (kbd "<tab>") 'company-complete)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-,") 'pop-tag-mark))

(add-hook 'go-mode-hook 'my-go-mode-hook)

;;; golang.el ends here
