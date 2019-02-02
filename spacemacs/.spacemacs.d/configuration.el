  (setq global-visual-line-mode t)

  (setq user-full-name "Roland Coeurjoly"
        user-mail-address "rolandcoeurjoly@gmail.com")

  (global-hl-line-mode)

  (setq org-ellipsis "⤵")

  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     (gnuplot . t)
     ;;(arduino . t)
     ;;(verilog . t)
     (clojure . t)
     (C . t)
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
  ;;(add-hook 'arduino-mode-hook #'flycheck-mode)

   (add-hook 'after-init-hook 'global-flycheck-mode)

    (add-hook 'after-init-hook 'global-company-mode)

(defun compile-next-makefile ()
  (interactive)
  (let* ((default-directory (or (upward-find-file "Makefile") "."))
         (compile-command (concat "cd " default-directory " && "
                                  compile-command)))
    (compile compile-command)))
(defun upward-find-file (filename &optional startdir)
  "Move up directories until we find a certain filename. If we
  manage to find it, return the containing directory. Else if we
  get to the toplevel directory and still can't find it, return
  nil. Start at startdir or . if startdir not given"

  (let ((dirname (expand-file-name
		  (if startdir startdir ".")))
	(found nil) ; found is set as a flag to leave loop if we find it
	(top nil))  ; top is set when we get
		    ; to / so that we only check it once

    ; While we've neither been at the top last time nor have we found
    ; the file.
    (while (not (or found top))
      ; If we're at / set top flag.
      (if (string= (expand-file-name dirname) "/")
	  (setq top t))

      ; Check for the file
      (if (file-exists-p (expand-file-name filename dirname))
	  (setq found t)
	; If not, move up a directory
	(setq dirname (expand-file-name ".." dirname))))
    ; return statement
    (if found dirname nil)))
(defun desperately-compile (command)
  "Traveling up the path, find a Makefile and `compile'."
  (interactive)
  (when (locate-dominating-file default-directory "Makefile")
  (with-temp-buffer
    (cd (locate-dominating-file default-directory "Makefile"))
    (list (compilation-read-command command))
    (compile command))))

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

  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  (setq elpy-rpc-backend "jedi")

      ;; This doesn't work in Ubuntu
      ;; (use-package arduino-mode)
      ;; (autoload 'arduino-mode "arduino-mode" "Arduino mode" t )
      ;; (add-hook 'arduino-mode-hook
      ;;          'auto-complete-mode
      ;;          'company-mode)

  '(initial-buffer-choice "/home/rcl/Exocortex/Exocortex.org")
