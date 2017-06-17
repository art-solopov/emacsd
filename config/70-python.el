;;; 70-python.el --- Various configurations for Python
(require 'f)
(require 's)

;;; Pyenv

(defun set-pyenv-project-version (project-path)
  (let (
	(python-version-path (f-join project-path ".python-version"))
	)
    (when (f-exists? python-version-path)
      (let (
	    (python-version (s-trim (f-read-text python-version-path)))
	    )
	(pyenv-mode-set python-version)
	)
      )
   )
    )

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
  (when (projectile-project-p)
    (let (
	  (venv-path (f-join (projectile-project-root) "venv"))
	  )
      (set-pyenv-project-version (projectile-project-root))
      (pythonic-activate venv-path)
      (set-flymake-python-paths)
      )
    )
  )

;;; Anaconda & Company

(add-hook 'python-mode-hook 'anaconda-mode)

(eval-after-load "company"
  '(add-to-list 'company-backends '(company-anaconda :with company-capf)))
