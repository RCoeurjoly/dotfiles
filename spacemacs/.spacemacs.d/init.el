;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     javascript
     rust
     lua
     d
     ;; ;; ----------------------------------------------------------------
     ;; ;; Example of useful layers you may want to use right away.
     ;; ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; ;; <M-m f e R> (Emacs style) to install them.
     ;; ;; ----------------------------------------------------------------
     (c-c++ :variables c-c++-enable-clang-support t)
            ;; =c-c++-backend= 'lsp-clangd
            ;; c++-enable-organize-includes-on-save t
            ;; c-c++-enable-clang-format-on-save t
            ;; c-c++-enable-google-style t
            ;; c-c++-enable-google-newline t
     ;; c-c++-enable-auto-newline t)
     haskell
     lua
     org-roam
     html
     python
     imenu-list
     shell-scripts
     (auto-completion :variables
                      auto-completion-return-key-behavior 'complete
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-enable-snippets-in-popup t)
     yaml
     ;;myleetcode
     ruby
     helm
     better-defaults
     sql
     semantic
     cscope
     html
     csv
     syntax-checking
     emacs-lisp
     git
     gtags
     ess
     ;;cquery
     (colors :variables colors-enable-nyan-cat-progress-bar t)
     ;;extra-langs
     ;;cmake
     markdown
     org
     (shell :variables
             shell-default-height 30
             shell-default-position 'bottom)
     spell-checking
     github
     version-control
     cucumber
     docker
     coq
     pdf-tools
     ocaml
     go
     elixir
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         cyberpunk-2019
                         whiteboard)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-mode-line-theme '(all-the-icons :separator 'slant)
   dotspacemacs-default-font '("Inconsolata"
                               :size 24
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'trailing
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (add-to-list 'package-pinned-packages '(spaceline-all-the-icons . "melpa-stable"))
  (add-to-list 'package-pinned-packages '(all-the-icons . "melpa-stable"))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; Load babel configuration
   (org-babel-load-file "~/.spacemacs.d/configuration.org")
   )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(epg-gpg-program "/usr/bin/gpg2")
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-custom-commands
   (quote
    (("c" "Custom agenda, ignore IGNORE_FOR_AGENDA tag"
      ((agenda ""))
      ((org-agenda-tag-filter-preset
        (quote
         ("-IGNORE_FOR_AGENDA"))))))))
 '(org-agenda-files
   (quote
    ("/home/roland/Exocortex/20200623135805-analisis_estatico_de_programas_y_resolucion_de_restricciones.org" "/home/roland/Exocortex/2020-04-12.org" "/home/roland/Exocortex/20200412080753-tcr.org" "/home/roland/Exocortex/20200412081554-software.org" "/home/roland/Exocortex/20200412081621-flow.org" "/home/roland/Exocortex/20200412081745-bdd.org" "/home/roland/Exocortex/20200412081920-feedback.org" "/home/roland/Exocortex/20200412081933-automation.org" "/home/roland/Exocortex/20200412200734-literate_programming.org" "/home/roland/Exocortex/20200413105916-testing.org" "/home/roland/Exocortex/20200413110014-test_desiderata.org" "/home/roland/Exocortex/20200413161148-books.org" "/home/roland/Exocortex/20200413164744-cosmos_by_carl_sagan.org" "/home/roland/Exocortex/20200413165318-universe.org" "/home/roland/Exocortex/20200413165332-non_fiction.org" "/home/roland/Exocortex/20200413172512-enlightenment_now_the_case_for_reason_science_humanism_and_progress_by_steven_pinker.org" "/home/roland/Exocortex/20200413174437-reading.org" "/home/roland/Exocortex/20200413174508-readability_metric.org" "/home/roland/Exocortex/20200413204408-porting_python_2_code_to_python_3.org" "/home/roland/Exocortex/20200413205432-progress.org" "/home/roland/Exocortex/20200413205514-humanism.org" "/home/roland/Exocortex/20200413205532-reason.org" "/home/roland/Exocortex/20200413205542-science.org" "/home/roland/Exocortex/20200414200112-highlight_gathering.org" "/home/roland/Exocortex/20200414201108-android.org" "/home/roland/Exocortex/20200414201714-koreader.org" "/home/roland/Exocortex/20200414202243-big_reader.org" "/home/roland/Exocortex/20200414223013-problems_and_solutions.org" "/home/roland/Exocortex/20200415103912-org_roam.org" "/home/roland/Exocortex/20200416113538-haskell.org" "/home/roland/Exocortex/20200416123322-lua.org" "/home/roland/Exocortex/20200417174315-property_based_testing.org" "/home/roland/Exocortex/20200417174440-reading_list.org" "/home/roland/Exocortex/20200419220747-anger_management.org" "/home/roland/Exocortex/20200423134219-coq.org" "/home/roland/Exocortex/20200423134347-formal_methods.org" "/home/roland/Exocortex/20200425134105-emacs_lisp.org" "/home/roland/Exocortex/20200425230819-reverse_engineering.org" "/home/roland/Exocortex/20200425231131-hardware.org" "/home/roland/Exocortex/20200426123301-highlights.org" "/home/roland/Exocortex/20200427191126-moonshots.org" "/home/roland/Exocortex/20200428182901-org_mode.org" "/home/roland/Exocortex/20200428201752-thinking.org" "/home/roland/Exocortex/20200430101139-ocaml.org" "/home/roland/Exocortex/20200501200506-lucid_dreaming.org" "/home/roland/Exocortex/20200501200557-spirituality.org" "/home/roland/Exocortex/20200501200638-journal.org" "/home/roland/Exocortex/20200501200926-meditation.org" "/home/roland/Exocortex/20200501221750-programming_language.org" "/home/roland/Exocortex/20200502133648-exercise.org" "/home/roland/Exocortex/20200502134008-health.org" "/home/roland/Exocortex/20200502134016-habits.org" "/home/roland/Exocortex/20200502134218-gtd.org" "/home/roland/Exocortex/20200502134409-in_basket.org" "/home/roland/Exocortex/20200502134602-someday_maybe.org" "/home/roland/Exocortex/20200502134927-projects.org" "/home/roland/Exocortex/20200502162440-monkey.org" "/home/roland/Exocortex/20200504001121-casa.org" "/home/roland/Exocortex/20200504204807-failure.org" "/home/roland/Exocortex/20200505231347-git.org" "/home/roland/Exocortex/20200508121551-entorno_colombiano.org" "/home/roland/Exocortex/20200509162702-mocho.org" "/home/roland/Exocortex/20200526210901-fread_ink.org" "/home/roland/Exocortex/20200527175115-libreboot.org" "/home/roland/Exocortex/20200604181934-jira.org" "/home/roland/Exocortex/20200604182235-scrum.org" "/home/roland/Exocortex/20200604182316-sprint_6.org" "/home/roland/Exocortex/20200604183422-drvinet_554.org" "/home/roland/Exocortex/20200604183520-sprint_10.org" "/home/roland/Exocortex/20200604183707-omstrd_2021.org" "/home/roland/Exocortex/20200605093929-drvmeff_65.org" "/home/roland/Exocortex/20200605191745-c.org" "/home/roland/Exocortex/20200605193323-python.org" "/home/roland/Exocortex/20200607173456-dbdrvinet_1.org" "/home/roland/Exocortex/20200608093703-watergate_28.org" "/home/roland/Exocortex/20200610133002-cmnflsvt_614.org" "/home/roland/Exocortex/20200612200028-sprint_9.org" "/home/roland/Exocortex/20200615141429-sprint_11.org" "/home/roland/Exocortex/20200615231444-drvinet_555.org" "/home/roland/Exocortex/20200617112442-drvinet_558.org" "/home/roland/Exocortex/20200617180720-ddrvallf_1.org" "/home/roland/Exocortex/20200618205542-poop.org" "/home/roland/Exocortex/20200618210000-handstands.org" "/home/roland/Exocortex/20200619100437-drvallfnds_69.org" "/home/roland/Exocortex/20200622164412-omstrd_1832.org" "/home/roland/Exocortex/20200622221523-master_en_metodos_formales_en_ingenieria_informatica.org" "/home/roland/Exocortex/20200622233537-desarrollo_formal_de_software_dirigido_por_modelos.org" "/home/roland/Exocortex/20200622234708-modelos_de_la_concurrencia.org" "/home/roland/Exocortex/20200623135459-metodos_formales_de_testing.org" "/home/roland/Exocortex/20200623135715-teoria_de_lenguajes_de_programacion.org" "/home/roland/Exocortex/20200623135926-verificacion_asistida_de_programas.org" "/home/roland/Exocortex/20200623140053-diseno_de_sistemas_correctos_por_construccion.org" "/home/roland/Exocortex/20200623140150-trabajo_fin_de_master.org" "/home/roland/Exocortex/20200623140245-practicas_en_empresas_o_grupos_de_investigacion.org" "/home/roland/Exocortex/20200629105940-bash.org" "/home/roland/Exocortex/20200630232836-sprint_12.org" "/home/roland/Exocortex/20200630232847-drvenxt_207.org" "/home/roland/Exocortex/20200702143603-cmnflsvt_624.org" "/home/roland/Exocortex/20200703132524-watergate_32.org" "/home/roland/Exocortex/20200706120338-watergate_31.org" "/home/roland/Exocortex/20200706122855-watergate_30.org" "/home/roland/Exocortex/20200706123021-watergate_29.org" "/home/roland/Exocortex/20200706123133-watergate_24.org" "/home/roland/Exocortex/20200713091439-watergate_47.org" "/home/roland/Exocortex/20200713091555-sprint_13.org" "/home/roland/Exocortex/20200717110104-omstrd_2082.org" "/home/roland/Exocortex/20200717114327-omscui_262.org" "/home/roland/Exocortex/20200720140604-drvallfnds_71.org" "/home/roland/Exocortex/20200720161405-omstrd_2052.org" "/home/roland/Exocortex/20200723162908-writing_therapy.org" "/home/roland/Exocortex/20200724104738-drvmeff_69.org" "/home/roland/Exocortex/20200724110146-ddrvmf_1.org" "/home/roland/Exocortex/20200727143826-sprint_14.org" "/home/roland/Exocortex/20200727143909-drvmeff_71.org" "/home/roland/Exocortex/20200728110721-drvinet_576.org" "/home/roland/Exocortex/20200728130804-omstrd_2095.org" "/home/roland/Exocortex/20200728211331-drvinet_579.org" "/home/roland/Exocortex/20200731140643-omsrbt_724.org" "/home/roland/Exocortex/20200805092058-drvinet_568.org" "/home/roland/Exocortex/20200805104732-drvallfnds_72.org" "/home/roland/Exocortex/20200805154010-drvinet_586.org" "/home/roland/Exocortex/20200805223434-drvinet_585.org" "/home/roland/Exocortex/20200810122915-sprint_15.org" "/home/roland/Exocortex/20200812113414-drvmeff_74.org" "/home/roland/Exocortex/20200827145753-omstrd_2114.org" "/home/roland/Exocortex/20200827183358-omstrd_2098.org" "/home/roland/Exocortex/20200827215314-drvsmr_715.org" "/home/roland/Exocortex/20200827220107-drvsmrrf_232.org" "/home/roland/Exocortex/20200902102400-drvenxt_212.org" "/home/roland/Exocortex/20200902215711-drvenxt_213.org" "/home/roland/Exocortex/20200908235116-dbdrvinet_6.org" "/home/roland/Exocortex/20200910184404-drvenxt_218.org" "/home/roland/Exocortex/20200912160542-sprint_16.org" "/home/roland/Exocortex/20200914121019-sprint_17.org" "/home/roland/Exocortex/20200914121341-drvmeff_79.org" "/home/roland/Exocortex/20200914121502-drvenxt_225.org" "/home/roland/Exocortex/20200916104516-now.org" "/home/roland/Exocortex/20200916132536-gdb.org" "/home/roland/Exocortex/20200916193931-drvinet.org" "/home/roland/Exocortex/20200919184053-primer_cuatrimestre.org" "/home/roland/Exocortex/20200919184102-ucm.org" "/home/roland/Exocortex/20200919184107-uam.org" "/home/roland/Exocortex/20200919194704-segundo_cuatrimestre.org" "/home/roland/Exocortex/20200922134029-drvinet_607.org" "/home/roland/Exocortex/20200923133820-drvinet_601.org" "/home/roland/Exocortex/20200928125735-smartphone.org" "/home/roland/Exocortex/20200928215553-drvinet_617.org" "/home/roland/Exocortex/20200929093137-sprint_18.org" "/home/roland/Exocortex/20200929093317-omsrbt_733.org" "/home/roland/Exocortex/20200929093549-vtgtwy_179.org" "/home/roland/Exocortex/20200929095845-vtfixbrdg_315.org" "/home/roland/Exocortex/20200929162753-drvallfnds_77.org" "/home/roland/Exocortex/20201001093557-vtfixbrdg_317.org" "/home/roland/Exocortex/20201001093759-migracion_a_refdata.org" "/home/roland/Exocortex/20201013115928-sprint_19.org" "/home/roland/Exocortex/20201013115950-omstrd_2119.org" "/home/roland/Exocortex/20201016152909-omsrbt_751.org" "/home/roland/Exocortex/Archive_Exocortex.org" "/home/roland/Exocortex/Exocortex.org" "/home/roland/Exocortex/good_economics.org" "/home/roland/Exocortex/tables.org")))
 '(package-selected-packages
   '(emacsql-sqlite3 go-mode maude-mode ob-elixir flycheck-credo alchemist elixir-mode org-noter-pdftools org-noter yafolding ox-hugo proof-general prop-menu company-coq company-math math-symbol-lists racer cargo utop tuareg caml ocp-indent merlin toml-mode flycheck-rust rust-mode intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode lua-mode emacsql-sqlite emacsql org-roam d-mode company-dcd flycheck-dmd-dub pdf-tools docker tablist dockerfile-mode docker-tramp imenu-list evil company-ycmd ycmd request-deferred deferred leetcode insert-shebang fish-mode company-shell cquery pyim web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern tern coffee-mode yaml-mode feature-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby pylint god-mode jedi company-jedi rainbow-mode rainbow-identifiers color-identifiers-mode nyan-mode helm-gtags ggtags helm-cscope xcscope stickyfunc-enhance srefactor sql-indent company-axiom ob-axiom axiom-environment disaster company-c-headers cmake-mode clang-format web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data ess-smart-equals ess-R-data-view ctable ess spacemacs-theme transient lv veri-kompass company-arduino arduino-mode xterm-color shell-pop multi-term magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht flyspell-correct-ivy flyspell-correct-helm flyspell-correct eshell-z eshell-prompt-extras esh-help auto-dictionary yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode company-anaconda anaconda-mode pythonic wgrep smex ivy-hydra counsel-projectile counsel swiper ivy engine-mode flycheck-pos-tip pos-tip flycheck-pony flycheck csv-mode unfill thrift stan-mode smeargle scad-mode qml-mode orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim mmm-mode matlab-mode markdown-toc markdown-mode magit-gitflow julia-mode htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy evil-magit magit magit-popup git-commit with-editor diff-hl company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete vhdl-tools ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))
 '(python-shell-virtualenv-root "/home/rcl/readability-metric/")
 '(safe-local-variable-values
   (quote
    ((org-list-two-spaces-after-bullet-regexp)
     (eval add-to-list
           (quote auto-mode-alist)
           (quote
            ("\\.v\\'" . verilog-mode)))
     (org-list-description-max-indent . 5)
     (org-roam-directory . "~/Exocortex/")
     (org-roam-directory . "/home/rcl/roam_babel/")
     (org-roam-directory . "/home/rcl/babel_sandbox/")
     (org-roam-directory . "/home/rcl/braindump/")
     (org-hugo-section . "zettels")
     (eval jethro/conditional-hugo-enable)
     (org-roam-directory . "/home/rcl/Exocortex/")
     (helm-make-build-dir . "~/inntech/desarrollo/oms/robot/build")
     (helm-make-build-dir . "~/inntech/desarrollo/oms/oms-trd/build")
     (helm-make-build-dir . "build")
     (eval setq visual-line-mode t)
     (eval setq global-visual-line-mode t)
     (eval setq org-hierarchical-todo-statistics t)
     (eval spacemacs/toggle-spelling-checking-off)
     (eval spacemacs/toggle-spelling-checking-off)
     (eval toggle-spelling-checking-off 1)
     (eval toggle-spelling-checking-off))))
 '(send-mail-function (quote mailclient-send-it)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(proof-eager-annotation-face ((t (:background "medium blue"))))
 '(proof-error-face ((t (:background "dark red"))))
 '(proof-warning-face ((t (:background "indianred3")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
)
