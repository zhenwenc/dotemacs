;; Projectile
(projectile-global-mode)

(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'neotree-projectile-action)

(require 'helm-projectile)
(helm-projectile-on)
