;;; 70-node.el --- Various configurations for Node.JS
(require 'f)
(require 'dash)
(require 'nvm)

;;; NVM

;;; TODO: determine automatically
(setq default-nvm-version "v7.7.4")
(nvm-use default-nvm-version)

(defun set-nvm (project-path)
  (when (f-exists? (f-join project-path ".nvmrc"))
    (nvm-use-for project-path)
    )
  )

;;; Adding node_modules to $PATH

(defun add-node-modules-dir (project-path)
  (let (
        (node-modules-path (f-join project-path "node_modules" ".bin"))
        )
    (when (f-exists? node-modules-path)
      (setenv "PATH" (concat node-modules-path ":" (getenv "PATH")))
      (setq exec-path (-insert-at 0 node-modules-path exec-path))
      )
    )
  )

(defun add-project-node-modules-dir ()
  (interactive)
  (when (projectile-project-p)
    (set-nvm (projectile-project-root))
    (add-node-modules-dir (projectile-project-root))
    )
  )
