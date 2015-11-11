;; Load shell environment variable into emacs
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; Color theme
(load-theme 'sanityinc-tomorrow-eighties t)

;  (setq evil-default-cursor t)

;; Setting fonts for GUI emacs
(if (and (eq system-type 'gnu/linux) (display-graphic-p))
    (progn
      (set-face-attribute
       'default nil :font "Source Code Pro Bold 9")))

(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family "WenQuanYi Micro Hei Mono Light"
                               :size 14)))

;; Save backups in ./auto-save-list
(defvar my-backup-dir (concat temporary-file-directory "emacs-backup"))

(setq backup-directory-alist
      `((".*" . ,my-backup-dir)))
(setq auto-save-file-name-transforms
      `((".*" ,my-backup-dir t)))

(if (not (file-accessible-directory-p my-backup-dir))
    (make-directory my-backup-dir))

;; Save backups in ~/.local/share/emacs-saves
; (setq backup-by-copying t ; don't clobber symlinks
;  backup-directory-alist
;  '(("." . "~/.local/share/emacs-saves")) ; don't litter my fs tree
;  delete-old-versions t
;  kept-new-versions 6
;  kept-old-versions 2
;  version-control t) ; use versioned backup

;; Undo tree
(global-undo-tree-mode)

;; Delete selected text
(delete-selection-mode t)

;; TextMate minor mode
; (eval-after-load 'textmate
;   '(progn
;      (define-key *textmate-mode-map* [(meta return)] nil)
;      (define-key *textmate-mode-map* [(control c) (control k)] nil)
;      (define-key *textmate-mode-map* [(control c) (control t)] nil)))
;
; (textmate-mode)
; (add-to-list '*textmate-project-roots* "project.clj")
; (add-to-list '*textmate-project-roots* "setup.py")
; (add-to-list '*textmate-project-roots* ".ropeproject")
; (add-to-list '*textmate-project-roots* ".project")
; (add-to-list '*textmate-project-roots* "build.xml")
; (add-to-list '*textmate-project-roots* "pom.xml")
; (add-to-list '*textmate-project-roots* "build.gradle")
; (add-to-list '*textmate-project-roots* "build.sbt")

;; Ack. use textmate project root as ack root dir

;; IDO hacks
;; Display ido results vertically, rather than horizontally
;(setq ido-decorations
;      (quote ("\n-> "
;              """\n   " "\n   ..." "[" "]"
;              " [No match]" " [Matched]"
;              " [Not readable]" " [Too big]"
;              " [Confirm]")))
;(defun ido-disable-line-trucation ()
;  (set (make-local-variable 'truncate-lines) nil))
;(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-trucation)


;; RET to newline-and-indent
(defun set-newline-and-indent-key ()
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent))

(mapc (lambda (hook) (add-hook hook 'set-newline-and-indent-key))
      '(c-mode-common-hook
        js-mode-hook))

;; Turn on auto pair for certain modes
(defun turn-on-autopair-mode ()
  (autopair-mode 1))

(mapc (lambda (hook) (add-hook hook 'turn-on-autopair-mode))
      '(python-mode-hook
        c-mode-common-hook
        ruby-mode-hook
        js-mode-hook
        scala-mode-hook
        go-mode-hook))

;; Company Mode
(add-hook 'after-init-hook 'global-company-mode)
(require 'company)
(setq company-tooltip-limit 10) ; bigger popup window
(setq company-idle-delay 0)    ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)     ; remove annoying blinking

;; Flycheck
;(add-hook 'after-init-hook 'global-flycheck-mode)

;; Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Zen-coding
(require 'zencoding-mode)
(setq zencoding-indentation 2)
(add-hook 'sgml-mode-hook 'zencoding-mode)

;; Cleanup spaces on save
;;(add-hook 'before-save-hook 'whitespace-cleanup)
(global-whitespace-cleanup-mode)

;; XML indentation
(setq nxml-child-indent 4)

;; Auto revert
(global-auto-revert-mode t)

;; Magit
(setq magit-last-seen-setup-instructions "1.4.0")

;; Smooth scrolling
(setq scroll-margin 10
      scroll-step 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      redisplay-dont-pause t)
(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)

;; Keep isearch highlight, and use a keybinding to clear it manually
(setq lazy-highlight-cleanup nil)
(global-set-key (kbd "C-&") 'lazy-highlight-cleanup)

;; Nyan da cat!!
(require 'nyan-mode)
(nyan-mode 1)
(nyan-start-animation)
