;; Hooks for helm-gtags
; (add-hook 'scala-mode-hook 'helm-gtags-mode)
; (add-hook 'java-mode-hook 'helm-gtags-mode)

;; Scala Ensime Mode
;; (require 'ensime)
(autoload 'ensime-scala-mode-hook "ensime-mode")
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)


;; Fancy unicode arrows
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
 
 
(add-hook 'scala-mode-hook '(lambda () (interactive) 
			      (local-set-key (kbd "-") 'left-arrow)
			      (local-set-key (kbd ">") 'right-arrow)))

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

(with-eval-after-load 'ensime
  (define-key ensime-mode-map (kbd ".") 'scala/completing-dot))

(define-key ensime-mode-map (kbd "M-.") 'ensime-edit-definition)
(define-key ensime-mode-map (kbd "M-,") 'pop-tag-mark)
