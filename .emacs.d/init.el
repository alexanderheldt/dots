(add-hook 'emacs-startup-hook
  (lambda ()
    (setq gc-cons-threshold (* 100 1024 1024) ; 16mb
          gc-cons-percentage 0.1)))

(setq read-process-output-max (* 1024 1024)) ;; 1mb

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; (use-package counsel
;;   :bind (("M-x" . counsel-M-x)
;;       ("C-x b" . counsel-ibuffer)
;;       ("C-x C-f" . counsel-find-file)
;;       :map minibuffer-local-map
;;       ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

;; (use-package ivy
;;   :bind (("C-s" . swiper)
;;       :map ivy-minibuffer-map
;;       ;("TAB" . ivy-alt-done)
;;       ;("C-l" . ivy-alt-done)
;;       ("C-j" . ivy-next-line)
;;       ("C-k" . ivy-previous-line)
;;       :map ivy-switch-buffer-map
;;       ("C-k" . ivy-previous-line)
;;       ;("C-l" . ivy-done)
;;       ("C-d" . ivy-switch-buffer-kill)
;;       :map ivy-reverse-i-search-map
;;       ("C-k" . ivy-previous-line)
;;       ("C-d" . ivy-reverse-i-search-kill))
;;   :init
;;   (ivy-mode 1))

;; (use-package ivy-rich
;;   :init
;;   (ivy-rich-mode 1))

(use-package company
  :init
  (setq company-idle-delay 0
        company-echo-delay 0
        company-minimum-prefix-length 1)
  :config
  (global-company-mode))


(use-package projectile
  :diminish projectile-mode
  :demand t
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/code")
    (setq projectile-project-search-path '("~/code"))
   )
  (setq projectile-switch-project-action #'projectile-dired)
)

;; (use-package counsel-projectile
;;   :after projectile
;;   :config (counsel-projectile-mode)
;;   )
(use-package consult-projectile
  :after projectile
)

(use-package marginalia
  ;; The :init configuration is always executed (Not lazy!)
  :init

  ;; Must be in the :init section of use-package such that the mode gets
  ;; enabled right away. Note that this forces loading the package.
  (marginalia-mode))

(use-package vertico
  :init
  (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :custom (completion-styles '(orderless)))

(use-package consult
  :general
  ("M-y" 'consult-yank-from-kill-ring
   "C-x b" 'consult-buffer))

(use-package affe
  :after
  consult
  :config
  ;; Manual preview key for `affe-grep'
  (consult-customize affe-grep :preview-key (kbd "M-p")))


(org-babel-load-file (expand-file-name "~/.emacs.d/tangle-init.org"))

