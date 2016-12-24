;;; 90-python.el --- Various configurations for Python
(require 'f)

;;; Flycheck & virtualenv

(defun set-flymake-python-paths ()
  (interactive)
  (when pythonic-environment
    (setq flycheck-python-flake8-executable
	  (f-join pythonic-environment "bin" "flake8"))
    (setq flycheck-python-pylint-executable
	  (f-join pythonic-environment "bin" "pylint"))
    (setq flycheck-python-pycompile-executable
	  (f-join pythonic-environment "bin" "python"))
    )
  )

(defun load-project-virtualenv ()
  (interactive)
  (message "Switched to project")
  (message default-directory)
  (when (projectile-project-p)
    (let (
	  (venv-path (f-join (projectile-project-root) "venv"))
	  )
      (pythonic-activate venv-path)
      (set-flymake-python-paths)
      )
    )
  )

;; (setq projectile-switch-project-action
;;       (lambda () (progn (load-project-virtualenv) (projectile-find-file) )))

(add-hook 'projectile-before-project-action-hook 'load-project-virtualenv)
; (add-hook 'projectile-after-switch-project-hook 'load-project-virtualenv)

;;; Anaconda & Company

(add-hook 'python-mode-hook 'anaconda-mode)

(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda :with company-capf)))
