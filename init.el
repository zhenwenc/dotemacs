(setq gc-cons-threshold 100000000)
;; Better defaults
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(setq inhibit-startup-screen t)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq x-select-enable-clipboard t
      x-select-enable-primary t
      save-interprogram-paste-before-kill t
      apropos-do-all t
      mouse-yank-at-point t
      require-final-newline t
      visible-bell t
      ediff-window-setup-function 'ediff-setup-windows-plain
      save-place-file (concat user-emacs-directory "places"))

;; Package Manager

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "http://stable.melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(defvar my-packages
  '(helm
    helm-ag
    helm-projectile
    helm-gtags
    magit
    projectile
    ace-jump-mode
    autopair
    company
    company-go
    flycheck
    geiser
    org
    bm
    markdown-mode+
    nrepl-eval-sexp-fu
    nyan-mode
    neotree
    yasnippet
    undo-tree
    expand-region
    exec-path-from-shell
    zencoding-mode
    ack
    php-mode
    web-mode
    go-mode
    dockerfile-mode
    puppet-mode
    powerline
    whitespace-cleanup-mode))

(when (boundp 'package-pinned-packages)
  (setq package-pinned-packages
        '((go-mode            . "melpa-stable")
          (rainbow-delimiters . "melpa-stable")
          (flycheck           . "melpa-stable")
          (helm               . "melpa")
          (helm-projectile    . "melpa")
          (projectile         . "melpa"))))

(package-initialize)

;; install use-package
(when (not package-archive-contents)
  (package-refresh-contents)
  (package-install 'use-package))

;; use-package is not required at runtime
(eval-when-compile
 (require 'use-package))
;; (require 'diminish)
(require 'bind-key)
(setq use-package-always-ensure t)

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

(add-to-list 'load-path (concat user-emacs-directory "lib") t)

(defvar my-conf-dir (concat user-emacs-directory "conf.d"))
(byte-recompile-directory my-conf-dir 0)

(mapc (lambda (filename)
        (load filename nil nil t))
      (directory-files my-conf-dir t "\\.elc$"))

(put 'downcase-region 'disabled nil)

(setq gc-cons-threshold 1000000)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#1d1f21"))
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" "f5eb916f6bd4e743206913e6f28051249de8ccfd070eae47b5bde31ee813d55f" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "4904daa168519536b08ca4655d798ca0fb50d3545e6244cefcf7d0c7b338af7e" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" default)))
 '(fci-rule-color "#373b41")
 '(helm-gtags-auto-update t)
 '(helm-gtags-ignore-case t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#67930F" . 20)
     ("#349B8D" . 30)
     ("#21889B" . 50)
     ("#968B26" . 60)
     ("#A45E0A" . 70)
     ("#A41F99" . 85)
     ("#49483E" . 100))))
 '(magit-diff-use-overlays nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
; '(helm-gtags-suggested-key-mapping t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ensime-implicit-highlight ((t (:underline "gray35")))))
