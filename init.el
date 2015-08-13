(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))
;; No toolbar
(tool-bar-mode -1)

;; No menu-bar
(menu-bar-mode -1)

;; Set default font
(set-default-font "Consolas-11")

;; Get rid of the butt ugly scrollbars in GUI
(when (display-graphic-p) (set-scroll-bar-mode nil))

;; Set default starting directory
(if (eq system-type 'windows-nt)
(setq default-directory "C:/Users/srki/Desktop/OrgMode/"))

;; Theme
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'solarized t)

;; Highlight Current LinE
(require 'hl-line)
(global-hl-line-mode 1)

;; Tab width
(setq-default tab-width 4)

;; Tabs as spaces
(setq-default indent-tabs-mode nil)

;; set C-tab to switch frames
(global-set-key [(control tab)] `other-window)

;; Enable line numbers
(autoload 'linum-mode "linum" "toggle line numbers /on/off" t)
(global-set-key (kbd "C-1") 'linum-mode)
(require 'linum-relative)

;; Set UNIX encoding to default
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(prefer-coding-system 'utf-8-unix)
(set-default default-buffer-file-coding-system 'utf-8-unix)

;; Default width of fill mode 100 chars
(setq-default fill-column 100)

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

;; Enable visual feedback on selections
(setq transient-mark-mode t)

;; Load other configuration modules 
(load-file "~/.emacs.d/elisp/orgmode.cfg")
(load-file "~/.emacs.d/elisp/spellcheck.cfg")
(load-file "~/.emacs.d/elisp/evilmode.cfg")
(load-file "~/.emacs.d/elisp/programming.cfg")


;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 ;;'(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(org-agenda-span (quote month))
 '(send-mail-function (quote mailclient-send-it))
 '(user-full-name "Srki Rakic")
 '(user-mail-address "srki@strsoftware.com"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
