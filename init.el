(require 'package)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-by-copying t)
 '(backup-directory-alist (quote (("." . "~/.emacs-file-bak"))))
 '(column-number-mode t)
 '(custom-enabled-themes (quote (ample-zen)))
 '(custom-safe-themes
   (quote
    ("1db337246ebc9c083be0d728f8d20913a0f46edc0a00277746ba411c149d7fe5" default)))
 '(global-linum-mode t)
 '(helm-smex-show-bindings t)
 '(kept-new-versions 6)
 '(package-selected-packages
   (quote
    (coffee-mode scss-mode undo-tree ruby-electric web-mode yaml-mode uuidgen flycheck magit magit-gitflow rbenv rjsx-mode ruby-tools helm-c-yasnippet helm-rails ace-jump-helm-line ace-jump-mode ace-window slim-mode markdown-mode markdown-mode+ js2-mode json-mode react-snippets yasnippet ample-zen-theme rainbow-mode helm-projectile projectile projectile-git-autofetch projectile-rails helm helm-ag helm-git helm-smex smex s f dash)))
 '(ruby-align-chained-calls t)
 '(show-paren-mode t)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :slant normal :weight normal :height 125 :width normal :foundry "adobe" :family "Source Code Pro")))))

(setq config-dir
      (concat user-emacs-directory "config/")
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
)

(add-hook 'after-init-hook 'after-init-packages)
