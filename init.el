;; This file is a simplify emacs + evil config.


;; Automathically install packages.
;; Change the source to china's source

; From https://stackoverflow.com/questions/10092322/how-to-automatically-install-emacs-packages-by-specifying-a-list-of-package-name

; list the packages you want

(setq package-list '(package1 package2))



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


