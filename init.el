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
(if (eq system-type 'darwin)
    (set-default-font "Monaco-13")
    (set-default-font "Consolas-11")
)
;; Get rid of the butt ugly scrollbars in GUI
(when (display-graphic-p) (set-scroll-bar-mode nil))

;; Set default starting directory
(if (eq system-type 'windows-nt)
(setq default-directory "C:/Users/srki/Desktop/OrgMode/"))

(if (eq system-type 'gnu/linux)
(setq default-directory "/home/srki/Documents/orgmode/"))

(if (eq system-type 'darwin)
(setq default-directory "/Users/srki/Documents/orgmode/"))

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
(load-file "~/.emacs.d/elisp/gnus.cfg")


;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" system-name))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#ad7fa8" "#8cc4ff" "#eeeeec"])
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#073642")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(org-agenda-span (quote month))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(send-mail-function (quote mailclient-send-it))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(user-full-name "Srki Rakic")
 '(user-mail-address "srki@strsoftware.com")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
