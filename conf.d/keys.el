;; ===== Custom keybindings ====
;;
;; Buffer and window switching
;;(global-set-key (kbd "C-,") 'previous-buffer)
;;(global-set-key (kbd "C-.") 'next-buffer)

;; Expand-region
(global-set-key (kbd "C-=") 'er/expand-region)

;; Join lines
(global-set-key (kbd "C-c q") 'join-line)

;; Fullscreen on Mac
(global-set-key (kbd "C-x 9") 'toggle-frame-fullscreen)

;; Magit
(global-set-key (kbd "C-x g s") 'magit-status)
(global-set-key (kbd "C-x g l") 'magit-log)
(global-set-key (kbd "C-x g L") 'magit-log-buffer-file)
(global-set-key (kbd "C-x g b") 'magit-blame)
(global-set-key (kbd "C-x g r") 'magit-rebase)
(global-set-key (kbd "C-x g R") 'magit-rebase-interactive)
(global-set-key (kbd "C-x g c") 'magit-checkout)
(global-set-key (kbd "C-x g B") 'magit-branch-manager)

;; Helm AG
(global-set-key (kbd "C-x a") 'projectile-helm-ag)

;; Ace Jump Mode
(require 'ace-jump-mode)
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

;; Keybindings for custom hacks
(require 'custom-hack)
(global-set-key (kbd "C-o") 'start-newline-next)
(global-set-key (kbd "M-o") 'start-newline-prev)
(global-set-key (kbd "C-:") 'toggle-clj-keyword-string)
(global-set-key (kbd "C-*") 'helm-occur)

;; Git
(global-set-key (kbd "C-x g u") 'git/browse-repo)

;; Custom key bindings
(global-set-key (kbd "A-<left>")        'backward-word)
(global-set-key (kbd "A-<right>")       'forward-word)
(global-set-key (kbd "A-<backspace>")   'backward-kill-word)

(global-set-key (kbd "M-w")             'delete-window)
(global-set-key (kbd "M-z")             'undo)
(global-set-key (kbd "M-s")             'save-buffer)
(global-set-key (kbd "M-c")             'kill-ring-save)
(global-set-key (kbd "M-v")             'yank)

(global-set-key (kbd "M-<left>")        'move-beginning-of-line)
(global-set-key (kbd "M-<right>")       'move-end-of-line)
(global-set-key (kbd "C-<left>")        'backward-sentence)
(global-set-key (kbd "C-<right>")       'forward-sentence)

(global-set-key (kbd "M-a")             'move-beginning-of-line)
(global-set-key (kbd "M-e")             'move-end-of-line)
(global-set-key (kbd "C-a")             'move-beginning-of-line)
(global-set-key (kbd "C-e")             'move-end-of-line)

(global-set-key (kbd "C-d")             'backward-char)
; (global-set-key (kbd "M-d")             'backward-word)

(global-set-key (kbd "M-<return>")      'start-newline-next)

(global-set-key (kbd "M-<backspace>")   'backward-kill-line)
(global-set-key (kbd "C-S-k")             'kill-whole-line)
; (global-set-key (kbd "C-j")             'delete-char)

(global-set-key (kbd "M-<down>")        'scroll-up-command)
(global-set-key (kbd "M-<up>")          'scroll-down-command)
(global-set-key (kbd "C-v")             'scroll-up-command)
(global-set-key (kbd "C-S-v")           'scroll-down-command)

(global-set-key (kbd "M-x")             'helm-M-x)
(global-set-key (kbd "M-O")             'helm-find-files)
(global-set-key (kbd "M-o")             'helm-projectile-find-file)
(global-set-key (kbd "M-P")             'helm-projectile-switch-project)
(global-set-key (kbd "M-y")             'helm-show-kill-ring)
(global-set-key (kbd "C-x b")           'helm-mini)

(global-set-key (kbd "C-S-s")           'helm-projectile-ag)

;; Split selections into lines
(global-set-key (kbd "M-S-l")           'load-library)

;; Isearch mode
(define-key isearch-mode-map (kbd "M-v")           'isearch-yank-pop)
(define-key isearch-mode-map (kbd "M-<backspace>") 'isearch-delete-char)
