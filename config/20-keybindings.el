;; Magit
(global-set-key (kbd "C-x g") 'magit-status)

;; Comments
(global-set-key (kbd "C-x M-0") 'comment-or-uncomment-region)

;; Goto line
(global-set-key (kbd "M-p") 'goto-line)

;; Helm smex
(global-set-key (kbd "M-x") #'helm-smex)

;; Ace window
(global-set-key (kbd "C-x w") 'ace-window) 
