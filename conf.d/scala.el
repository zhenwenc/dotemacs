;; Hooks for helm-gtags
; (add-hook 'scala-mode-hook 'helm-gtags-mode)
; (add-hook 'java-mode-hook 'helm-gtags-mode)

;; Scala Ensime Mode
;; (require 'ensime)
;; (autoload 'ensime-scala-mode-hook "ensime-mode")
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(defun scala-right-arrow ()
  (interactive)
  (cond ((looking-back "=")
         (backward-delete-char 1) (insert "⇒"))
	((looking-back "-")
	 (backward-delete-char 1) (insert "→"))
	(t (insert ">"))))

(defun scala-left-arrow ()
  (interactive)
  (if (looking-back "<")
      (progn (backward-delete-char 1)
	     (insert "←"))
    (insert "-")))

(defun scala-newline-and-indent ()
  "What you want me to explain?"
  (interactive)
  (newline-and-indent)
  (scala-indent:insert-asterisk-on-multiline-comment))

(defun ensime-edit-definition-with-fallback ()
  "Variant of `ensime-edit-definition` with ctags if ENSIME is not available."
  (interactive)
  (if (ensime-connection-or-nil)
      (ensime-edit-definition)
    (helm-gtags-find-tag-from-here)))

(defun ensime-pop-stack-with-fallback ()
  "Variant of `pop-tag-mark` with ctags if ENSIME is not available."
  (interactive)
  (if (ensime-connection-or-nil)
      (pop-tag-mark)
    (helm-gtags-pop-stack)))

(defun ensime-set-company-backend ()
  "Company backend for ctags if ENSIME is not available."
  (set (make-local-variable 'company-backends)
       '(ensime-company
         (company-keywords company-dabbrev-code company-gtags company-yasnippet))))

(use-package scala-mode
  :ensure t
  :ensure scala-mode2
  :ensure smartparens
  :mode "\\.scala\\'"
  :pin melpa-stable
  :bind (:map scala-mode-map
              ("-" . scala-left-arrow)
              (">" . scala-right-arrow)
              ("RET" . scala-newline-and-indent))
  :init
  (require 'scala-mode2)
  (setq show-trailing-whitespace t)
  (setq scala-indent:use-javadoc-style t)
  :config
  (require 'company 'company-mode)
  (require 'smartparens)
  (add-hook 'scala-mode-hook 'helm-gtags-mode))

(use-package ensime
  :ensure t
  :pin melpa-stable
  :bind (:map ensime-mode-map
              ("M-." . ensime-edit-definition-with-fallback)
              ("M-," . ensime-pop-stack-with-fallback))
  :init
  (setq show-trailing-whitespace t)
  (setq ensime-default-buffer-prefix "ENSIME-"
        ensime-prefer-noninteractive t)
  :config
  (ensime-mode 1)
  (add-hook 'ensime-mode-hook 'ensime-set-company-backend))

;; Ensime auto suggest dropdown
;; (defun scala/completing-dot ()
;;   "Insert a period and show company completions."
;;   (interactive "*")
;;   (when (s-matches? (rx (+ (not space)))
;;                     (buffer-substring (line-beginning-position) (point)))
;;     (delete-horizontal-space t))
;;
;;   (cond (company-backend
;;          (company-complete-selection)
;;          (scala/completing-dot))
;;
;;         (t
;;          (insert ".")
;;          (company-complete))))
;;
;; (with-eval-after-load 'ensime
;;   (define-key ensime-mode-map (kbd ".") 'scala/completing-dot))
