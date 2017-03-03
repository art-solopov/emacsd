(global-rbenv-mode)
(rbenv-use-global)

(defun set-ruby ()
  (interactive)
  (rbenv-use-corresponding)
  (setq flycheck-ruby-rubocop-executable
	(concat (file-name-as-directory (alist-get 'shims-path rbenv-binary-paths)) "rubocop")
	)  
  )


