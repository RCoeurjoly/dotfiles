  (setq global-visual-line-mode t)

  (setq user-full-name "Roland Coeurjoly"
        user-mail-address "rolandcoeurjoly@gmail.com")

  (global-hl-line-mode)

  (setq org-ellipsis "⤵")

     ;; Setting for GPG encryption in org mode
     (custom-set-variables '(epg-gpg-program  "/usr/bin/gpg2"))

     (require 'org-crypt)
     (org-crypt-use-before-save-magic)
     (setq org-tags-exclude-from-inheritance (quote ("crypt")))
     ;;  set to nil to use symmetric encryption.
     (setq org-crypt-key nil)
     (setq org-tag-alist '(("crypt" . ?c)))
     ;; Auto-saving does not cooperate with org-crypt.el: so you need
     ;; to turn it off if you plan to use org-crypt.el quite often.
     ;; Otherwise, you'll get an (annoying) message each time you
     ;; start Org.

     ;; To turn it off only locally, you can insert this:
     ;;
     ;; # -*- buffer-auto-save-file-name: nil; -*-
     ;; Better yet would be to leave auto-save on globally but set it on only in org mode
     ;; This is annoying
     ;; Set again when org crypt encrypts when saving
     (add-hook 'org-mode-hook
               'auto-save-mode)
     (add-hook 'org-mode-hook '(lambda()
                                 (set (make-local-variable 'auto-save) nil)))
     ;; ;; Global Tags

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (gnuplot . t)
     ;;(arduino . t)
     ;(verilog . t)
     (clojure . t)
     (C . t)
     (shell . t)
     (python . t)))

  (setq org-src-fontify-natively t)

(defadvice org-edit-src-code (around set-buffer-file-name activate compile)
  (let ((file-name (buffer-file-name))) ;; (1)
    ad-do-it                            ;; (2)
    (setq buffer-file-name file-name))) ;; (3)

  (setq org-src-tab-acts-natively t)

  (setq org-confirm-babel-evaluate nil)

  (setq org-src-preserve-indentation t)

  (setq org-log-done 'time)

  (setq org-export-with-smart-quotes t)

  (add-hook 'markdown-mode-hook #'flycheck-mode)
  (add-hook 'gfm-mode-hook #'flycheck-mode)
  (add-hook 'text-mode-hook #'flycheck-mode)
  (add-hook 'org-mode-hook #'flycheck-mode)
  (add-hook 'verilog-mode-hook #'flycheck-mode)
  (add-hook 'arduino-mode-hook #'flycheck-mode)

   (add-hook 'after-init-hook 'global-flycheck-mode)

    (add-hook 'after-init-hook 'global-company-mode)

(defun* get-closest-pathname (&optional (file "Makefile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (expand-file-name file
		      (loop
			for d = default-directory then (expand-file-name ".." d)
			if (file-exists-p (expand-file-name file d))
			return d
			if (equal d root)
			return nil))))
 (require 'compile)
 (add-hook 'verilog-mode-hook (lambda () (set (make-local-variable 'compile-command) (format "make -f %s " (get-closest-pathname)))))

     (autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
     (add-hook 'verilog-mode-hook
               'auto-complete-mode
               'company-mode)
     (add-to-list 'auto-mode-alist '("\\.[ds]?vh?\\'" . verilog-mode))
     (setq verilog-tool 'verilog-linter)
     (setq verilog-linter "vlint ... ")
     (setq verilog-coverage "coverage ... ")
     (setq verilog-simulator "verilator ... ")
     (setq verilog-compiler "verilator ... " )
     (setq backup-directory-alist
           `((".*" . ,temporary-file-directory)))
     (setq auto-save-file-name-transforms
           `((".*" ,temporary-file-directory t)))

  (add-hook 'python-mode-hook 'company-jedi:setup)
  (setq company-jedi:complete-on-dot t)
  (setq elpy-rpc-backend "company-jedi")

      ;; This doesn't work in Ubuntu
      ;; (use-package arduino-mode)
      ;; (autoload 'arduino-mode "arduino-mode" "Arduino mode" t )
      ;; (add-hook 'arduino-mode-hook
      ;;          'auto-complete-mode
      ;;          'company-mode)

  (find-file "/home/rcl/Exocortex/Exocortex.org")
