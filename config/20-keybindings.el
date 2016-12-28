;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Comments
(global-set-key (kbd "C-x M-0") 'comment-or-uncomment-region)

;; Goto line
(global-set-key (kbd "M-p") 'goto-line)

;; Helm
(global-set-key (kbd "M-x") #'helm-smex)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

;; Ace window
(global-set-key (kbd "C-x w") 'ace-window) 
(global-set-key (kbd "C-x M-w") 'ace-window)

;; Various
(global-set-key (kbd "C-x C-b") 'ibuffer)
