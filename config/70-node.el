;;; 70-node.el --- Various configurations for Node.JS
(require 'f)
(require 'dash)

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
    (add-node-modules-dir (projectile-project-root))
    )
  )
