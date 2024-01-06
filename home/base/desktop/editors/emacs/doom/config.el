;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 17 :weight 'light)
      doom-variable-pitch-font (font-spec :family "DejaVu Sans" :size 18)
      doom-symbol-font (font-spec :family "JuliaMono")
      doom-big-font (font-spec :family "JetBrainsMono Nerd Font" :size 28))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; other doom's official themes:
;;   https://github.com/doomemacs/themes
(setq doom-theme 'doom-one)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq warning-minimum-level :error)
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! nerd-icons)
;; :custom
;; The Nerd Font you want to use in GUI
;; "Symbols Nerd Font Mono" is the default and is recommended
;; but you can use any other Nerd Font if you want
;; (nerd-icons-font-family "Symbols Nerd Font Mono")


(use-package! lsp-bridge
  :config
  (setq lsp-bridge-enable-log nil)
  (global-lsp-bridge-mode))

(use-package! wakatime-mode :ensure t)
;; fully enable tree-sitter highlighting
(after! tree-sitter
  (setq +tree-sitter-hl-enabled-modes t))
;; fix: https://github.com/jrblevin/markdown-mode/issues/380
;; even add this one, editing a large markdown table is still very slow.
;; so avoid editing large markdown file in emacs, use neovim instead...
(after! markdown-mode
  (global-font-lock-mode 0))

;; use alejandra to format nix files
(use-package! lsp-nix
  :ensure lsp-mode
  :after
  (lsp-mode)
  :demand t
  :custom
  (lsp-nix-nil-formatter
   ["alejandra"]))
(use-package! nushell-mode
  :config
  (setq nushell-enable-auto-indent 1))

;; emacs-rime
(use-package! rime
  :custom
  (default-input-method "rime")
  (rime-librime-root "~/.local/share/librime"))

;; use parinfer for lisp editing
(use-package! parinfer-rust-mode
  :hook ((emacs-lisp-mode
          clojure-mode
          scheme-mode
          lisp-mode
          racket-mode
          fennel-mode
          hy-mode) . parinfer-rust-mode)
  :init
  ;; parinfer-rust library do not provide a apple silicon binary.
  ;; fix: https://github.com/doomemacs/doomemacs/issues/6163
  (setq parinfer-rust-auto-download 0)
  ;; we need to download it manually and put it in this path
  (setq parinfer-rust-library "~/.local/share/parinfer-rust/parinfer-rust.so")
  :config
  (map! :map parinfer-rust-mode-map
        :localleader
        "p" #'parinfer-rust-switch-mode
        "P" #'parinfer-rust-toggle-disable))

;; disable smatparens-mode here to void conflict with parinfer
;; https://discourse.doomemacs.org/t/disable-smartparens-or-parenthesis-completion/134
(add-hook 'clojure-mode-hook        #'turn-off-smartparens-mode)
(add-hook 'scheme-mode-hook         #'turn-off-smartparens-mode)
(add-hook 'lisp-mode-hook           #'turn-off-smartparens-mode)
(add-hook 'racket-mode-hook         #'turn-off-smartparens-mode)
(add-hook 'fennel-mode-hook         #'turn-off-smartparens-mode)
(add-hook 'hy-mode-hook             #'turn-off-smartparens-mode)








