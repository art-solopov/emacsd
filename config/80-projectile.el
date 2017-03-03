(add-hook 'projectile-after-switch-project-hook 'load-project-virtualenv)
(add-hook 'projectile-after-switch-project-hook
	  'set-ruby)
