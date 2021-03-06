;;;;;;; EVIL MODE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(push '("marmalade" . "https://marmalade-repo.org/packages/")
    package-archives )
(push '("melpa" . "http://melpa.milkbox.net/packages/")
    package-archives)
(package-initialize)

(require 'evil)
(evil-mode 1)

;; Give us back Ctrl+U for vim emulation
(setq evil-want-C-u-scroll t)

;; Save buffers with Ctrl+S
(global-set-key (kbd "C-s") 'evil-write)

;; Escape as universal cance (caps-lock)
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
    (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

;; Don't display the ugly startup message (particularly ugly in the GUI)
(setq inhibit-startup-message t)

;; Set cursor colors depending on mode
(when (display-graphic-p)
  (setq evil-emacs-state-cursor '("red" box))
  (setq evil-normal-state-cursor '("green" box))
  (setq evil-visual-state-cursor '("orange" box))
  (setq evil-insert-state-cursor '("red" bar))
  (setq evil-replace-state-cursor '("red" bar))
  (setq evil-operator-state-cursor '("red" hollow))
)

;;;;;;;;;; END EVIL MODE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; No toolbar
(tool-bar-mode -1)

;; No menu-bar
(menu-bar-mode -1)

;; Set default font
;;(set-default-font "Consolas-11")

;; Get rid of the butt ugly scrollbars in GUI
(when (display-graphic-p) (set-scroll-bar-mode nil))

;; Theme
(load-theme 'solarized-dark t)

;; Highlight current line
(require 'hl-line)
(global-hl-line-mode 1)

;; Projectile
(setq projectile-competion-system 'grizzl)
(global-set-key (kbd "C-y") 'projectile-find-file)

;; Ido
(require 'ido)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Tab width
(setq-default tab-width 4)

;; Set C style syntax
(setq c-default-style "linux" c-basic-offset 4)

;; Tabs as spaces
(setq-default indent-tabs-mode nil)

;; set C-tab to switch frames
(global-set-key [(control tab)] `other-window)

;; Enable line numbers
(add-to-list 'load-path "~/.emacs.d/linenum")
(autoload 'linum-mode "linum" "toggle line numbers /on/off" t)
(global-set-key (kbd "C-1") 'linum-mode)

;; Auto-complete
(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; auto-pair the brackets, braces, parens.
(add-to-list 'load-path "~/.emacs.d/autopair") ;; comment if autopair.el is in standard load path 
   (require 'autopair)
   (autopair-global-mode) ;; enable autopair in all buffers 

;; Yasnippet
(add-to-list 'load-path "~/.emacs.d/yasnippet")
(require 'yasnippet-bundle)

;; Set UNIX encoding to default
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; Default width of fill mode 80 chars
(setq-default fill-column 80)

;; ERC hide status messages
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

;; Always end a file with a newline
(setq require-final-newline t)

;; Disable the bell
(setq visible-bell t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;; set up syntax highlighting
(require 'font-lock)
(setq font-lock-mode-maximum-decoration t)

;; Show matching parens
(show-paren-mode)

;; Enable wheelmouse support by default
(require 'mwheel)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
(setq transient-mark-mode t)

;; Flyspell auto spell check
;;(dolist (hook '(text-mode-hook))
;;  (add-hook hook (lambda () (flyspell-mode 1))))
;;(dolist (hook '(change-log-mode-hook log-edit-mode-hook))
;;  (add-hook hook (lambda () (flyspell-mode -1))))

;;(dolist (hook '(org-mode-hook))
;;  (add-hook hook (lambda () (flyspell-mode 1))))

;; Source code comments flyspell
;; (add-hook 'c++-mode-hook
;;          (lambda ()
;;            (flyspell-prog-mode)
;            ; ...
;;          ))


;;;;;;;;;;;; ORG MODE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; TODO closing timestamp
(setq org-log-done 'time)

;; Auto-fill-mode for text and org files
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; Org-Mode
;; Standard key bindings
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; To do keywords as workflow states
(setq org-todo-keywords
      '((sequence "TODO" "IN PROGRESS" "HOLD" "|" "DONE" "CANCELLED")))
             
(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "red" :weight bold)
              ("IN PROGRESS" :foreground "orange" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold))))
			  
;; Org-mode capture settings
(setq org-default-notes-file "c:/Users/srki/OrgMode/notes.org")
(define-key global-map "\C-cc" 'org-capture)

;; Org-mode source code syntax highlighting
;;(require 'org-latex)
;;(setq org-export-latex-listings 'minted)
;;(add-to-list 'org-export-latex-packages-alist '("" "minted"))
;;(setq org-src-fontify-natively t)
;;;;;;;;; END ORG MODE ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))
