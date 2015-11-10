(require 'diminish)

;;; Code:
(eval-after-load "projectile"
  '(diminish 'projectile-mode " Ⓟ"))

(eval-after-load "undo-tree"
  '(diminish 'undo-tree-mode))

(eval-after-load "paredit"
  '(diminish 'paredit-mode))

(eval-after-load "company"
  '(diminish 'company-mode " Ⓒ"))

(eval-after-load "abbrev"
  '(diminish 'abbrev-mode))

(eval-after-load "helm"
  '(diminish 'helm-mode " Ⓗ"))

(eval-after-load "helm-gtags"
  '(diminish 'helm-gtags-mode " Ⓖ"))

(eval-after-load "clj-refactor"
  '(diminish 'clj-refactor-mode " Ⓡ"))

(eval-after-load "elpy"
  '(diminish 'elpy-mode " Ⓔ"))

(eval-after-load "clj-refactor"
  '(diminish 'clj-refactor-mode " Ⓡ"))

(eval-after-load "smartparens"
  '(diminish 'smartparens-mode " Ⓢ"))

(eval-after-load "autopair"
  '(diminish 'autopair-mode))

(eval-after-load "outline"
  '(diminish 'outline-minor-mode))

(eval-after-load "eldoc"
  '(diminish 'eldoc-mode))

(eval-after-load "ensime"
  '(diminish 'ensime-mode " Ⓔ"))

; (with-eval-after-load 'ensime
;   (assq-delete-all 'ensime-mode minor-mode-alist)
;   (add-to-list 'minor-mode-alist '(ensime-mode " Ⓔ")))

;;; z-diminish.el ends here
