(require 'dash)
(require 'all-the-icons)
(require 'dired+)
(require 'whitespace)

(rainbow-mode 1)

(add-hook 'ruby-mode-hook 'ruby-electric-mode)

(global-undo-tree-mode)

(projectile-rails-global-mode)

(defun set-project-title ()
  (setq frame-title-format
	(list
	 "%b - "
	 (if (projectile-project-p) (s-concat (upcase (projectile-project-name)) " - ") "")
	 "Emacs"
	 )
	)
  )

(add-hook 'projectile-after-switch-project-hook
	  'set-project-title
	  )

(global-diff-hl-mode)

(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
(add-to-list 'all-the-icons-icon-alist
	     '("^Rakefile$" all-the-icons-octicon "ruby" v-adjust 0.0 :face all-the-icons-lred))
(add-to-list 'all-the-icons-icon-alist
	     '("^Gemfile$" all-the-icons-octicon "ruby" v-adjust 0.0 :face all-the-icons-blue))
(add-to-list 'all-the-icons-icon-alist
	     '("^Gemfile.lock$" all-the-icons-octicon "ruby" v-adjust 0.0 :face all-the-icons-dsilver))
(add-to-list 'all-the-icons-icon-alist
	     '("\\.vue\\'" all-the-icons-fileicon "vue" :face all-the-icons-lgreen ))


(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.es6\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.handlebars\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

(defun whitespace-lite ()
  (message "Loading whitespace mode")
  (make-local-variable 'whitespace-style)
  (setq whitespace-style
        (-remove-item 'lines-tail whitespace-style))
  (whitespace-mode 1)
  )

(add-hook 'ruby-mode-hook 'whitespace-mode)
(add-hook 'python-mode-hook 'whitespace-mode)

(add-hook 'slim-mode-hook 'whitespace-lite)
(add-hook 'haml-mode-hook 'whitespace-lite)
(add-hook 'web-mode-hook 'whitespace-lite)

(provide '30-var-modes)
;;; 30-var-modes ends here
