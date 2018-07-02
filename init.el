;; This file is a simplify emacs + evil config.


;; Automathically install packages.
;; Change the source to china's source

; From https://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name

; list the packages you want

(setq package-list '(evil-org cnfonts irony org-plus-contrib elpy  org-evil org-link-minor-mode atom-one-dark-theme evil  linum-relative org-bullets))



; list the repositories containing them

(setq package-archives '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))



; activate all the packages (in particular autoloads)

(package-initialize)



; fetch the list of packages available 

(unless package-archive-contents

  (package-refresh-contents))



; install the missing packages

(dolist (package package-list)

  (unless (package-installed-p package)

    (package-install package)))


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(use-package try
	:ensure t)

(use-package which-key
	:ensure t 
	:config
	(which-key-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(package-selected-packages
   (quote
    (irony-eldoc evil-org cnfonts org-plus-contrib ## org-evil org-link-minor-mode atom-one-dark-theme evil jedi linum-relative org-bullets which-key try use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono for Powerline" :foundry "outline" :slant normal :weight normal :height 162 :width normal)))))


;; enable backspace usage.
(define-key key-translation-map [?\C-h] [?\C-?])


(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(define-key global-map "\C-ca" 'org-agenda)     ;; by convention: "C-c a" opens agenda
(define-key global-map "\C-cc" 'org-capture)    ;; by convention: "C-c c" captures stuff
(define-key global-map "\C-cl" 'org-store-link) ;; by convention: "C-c l" stores a link to this heading
(setq org-log-done t) ;; if you want to log DONE-states to the :LOGBOOK:-drawer


;; enable evil mode and org-mode-evil
(require 'evil)
(evil-mode 1)
(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

(setq evil-want-C-i-jump nil)


;; Python autocomplete
;(add-hook 'python-mode-hook 'jedi:setup)
;(setq jedi:complete-on-dot t)
(elpy-enable)

;; C++ autocomplete
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)



;; enable linum package
(require 'linum-relative)
;(use-package org-bullets
;  :ensure t
;  :config
;    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
;(linum-on)
(setq linum-relative-backend 'display-line-numbers-mode)
(setq linum-relative-current-symbol t)


;; use F3 to enable line number display
;; use F4 to enable the evil mode
;(global-unset-key (kbd "<f2>")
(global-set-key (kbd "<f3>") 'linum-relative-toggle)
(global-set-key (kbd "<f4>") 'evil-mode)


;; enable theme atom-one-dark
;(load-theme 'atom-one-dark t)


;; Set the shell

;; Windows
(setq explicit-shell-file-name "C:\\msys64\\usr\\bin\\bash.exe")
(setq shell-file-name "bash")
(setq explicit-bash.exe-args '("--noediting" "--login" "-i"))
(setenv "SHELL" shell-file-name)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
(global-set-key (kbd "<f1>") 'shell)
;; Linux and Mac will come on soon.


(require 'cnfonts)
;; 让 cnfonts 随着 Emacs 自动生效。
;;(cnfonts-enable)
;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
;; (cnfonts-set-spacemacs-fallback-fonts)


