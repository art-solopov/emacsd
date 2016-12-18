(rbenv-use-global)

(add-hook 'projectile-after-switch-project-hook
	  'rbenv-use-corresponding)

(setq flycheck-ruby-rubocop-executable
      (concat (file-name-as-directory (alist-get 'shims-path rbenv-binary-paths)) "rubocop")
      )
