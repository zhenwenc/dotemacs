;; Hooks for helm-gtags
; (add-hook 'scala-mode-hook 'helm-gtags-mode)
; (add-hook 'java-mode-hook 'helm-gtags-mode)

;; Scala Ensime Mode
;; (require 'ensime)
;; (autoload 'ensime-scala-mode-hook "ensime-mode")
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

(defun right-arrow ()
  (interactive)
  (cond ((looking-back "=")
         (backward-delete-char 1) (insert "⇒"))
	((looking-back "-")
	 (backward-delete-char 1) (insert "→"))
	(t (insert ">"))))

(defun left-arrow ()
  (interactive)
  (if (looking-back "<")
      (progn (backward-delete-char 1)
	     (insert "←"))
    (insert "-")))

(defun ensime-edit-definition-with-fallback ()
  "Variant of `ensime-edit-definition` with ctags if ENSIME is not available."
  (interactive)
  (if (ensime-connection-or-nil)
      (ensime-edit-definition)
    (helm-gtags-find-tag-from-here)))

(defun ensime-set-company-backend ()
  "Company backend for ctags if ENSIME is not available."
  (set (make-local-variable 'company-backends)
       '(ensime-company
         (company-keywords company-dabbrev-code company-gtags company-yasnippet))))

(defun scala-newline-and-indent ()
  "My Scala newline and indent"
  (interactive)
  (newline-and-indent)
  (scala-indent:insert-asterisk-on-multiline-comment))

(defun scala-mode-keybinding-hook ()
  "My Scala mode keybinding hook"
  (interactive)
  (local-set-key (kbd "-") 'left-arrow)
  (local-set-key (kbd ">") 'right-arrow)
  (local-set-key (kbd "RET") 'scala-newline-and-indent))

(use-package scala-mode
  :ensure t
  :ensure smartparens
  :pin melpa-stable
  :bind (:map scala-mode-map
              ("-" . left-arrow)
              (">" . right-arrow))
  :init
  (setq show-trailing-whitespace t)
  (setq scala-indent:use-javadoc-style t)
  (add-hook 'scala-mode-hook 'helm-gtags-mode)
  :config
  (require 'company 'company-mode)
  (require 'smartparens))

(use-package scala-mode2)

(use-package ensime
  :ensure t
  :pin melpa-stable
;;  :bind (:map ensime-mode-map
;;              ("M-." . 'ensime-edit-definition-with-fallback)
;;              ("M-," . 'pop-tag-mark))
  :init
  (setq show-trailing-whitespace t)
  (setq ensime-default-buffer-prefix "ENSIME-"
        ensime-prefer-noninteractive t)
  (add-hook 'ensime-mode-hook 'ensime-set-company-backend)
  :config
  (ensime-mode 1))

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
