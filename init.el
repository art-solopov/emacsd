(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-file-name-transforms
   (quote
    (("\\`/[^/]*:\\([^/]*/\\)*\\([^/]*\\)\\'" "/tmp/\\2" t)
     (".*" "~/.emacs-file-auto-save/\\1" t))))
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs-file-bak"))))
 '(coffee-tab-width 2)
 '(column-number-mode t)
 '(company-backends
   (quote
    (company-bbdb company-nxml company-css company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files
		  (company-dabbrev-code company-gtags company-etags company-keywords)
		  company-oddmuse company-dabbrev)))
 '(custom-enabled-themes (quote (ample-zen)))
 '(custom-safe-themes
   (quote
    ("1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" default)))
 '(global-company-mode t)
 '(global-flycheck-mode t)
 '(global-linum-mode t)
 '(helm-smex-show-bindings t)
 '(kept-new-versions 6)
 '(package-selected-packages
   (quote
    (pyenv-mode smartparens diff-hl anaconda-mode company-anaconda haml-mode company coffee-mode scss-mode undo-tree ruby-electric web-mode yaml-mode uuidgen flycheck magit magit-gitflow rbenv rjsx-mode ruby-tools helm-c-yasnippet helm-rails ace-jump-helm-line ace-jump-mode ace-window slim-mode markdown-mode markdown-mode+ js2-mode json-mode react-snippets yasnippet ample-zen-theme rainbow-mode helm-projectile projectile projectile-git-autofetch projectile-rails helm helm-ag helm-git helm-smex smex s f dash)))
 '(projectile-completion-system (quote helm))
 '(projectile-mode t nil (projectile))
 '(projectile-switch-project-action (quote projectile-dired))
 '(ruby-align-chained-calls t)
 '(ruby-insert-encoding-magic-comment nil)
 '(show-paren-mode t)
 '(visible-bell t))

(setq config-dir
      (concat user-emacs-directory "config/")
      )

(setq custom-pkg-dir
      (concat user-emacs-directory "custom-pkg")
      )

(defun after-init-packages ()
  (require 'f)
  (require 'dash)
  (require 's)
  (add-to-list 'load-path config-dir)
  
  (dolist (fn
           (-distinct
            (--map (f-base it)
                   (--filter (s-ends-with? ".el" it) (f-entries config-dir)))))
    (message fn)
    (load-library fn)
    )

  (--each (f-entries custom-pkg-dir) (package-install-file it))
)

(add-hook 'after-init-hook 'after-init-packages)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
