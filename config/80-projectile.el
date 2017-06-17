(add-hook 'projectile-after-switch-project-hook 'load-project-virtualenv)
(add-hook 'projectile-after-switch-project-hook
	  'set-ruby)
(add-hook 'projectile-after-switch-project-hook 'add-project-node-modules-dir)
