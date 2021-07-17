(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room
(menu-bar-mode -1)          ; Disable the menu bar

(tab-bar-mode)
(setq tab-bar-close-button-show nil)
(setq tab-bar-new-button-show nil)

(set-face-attribute 'default nil :font "DejaVuSansMono Nerd Font" :height 120)
(load-theme 'wombat)

;; Don't create backup and autosave files
(setq temporary-file-directory "~/.emacs.d/tmp/")
(unless (file-exists-p "~/.emacs.d/tmp")
  (make-directory "~/.emacs.d/tmp"))

(setq backup-inhibited t
      make-backup-files nil  ; don't create backup~ files
      create-lockfiles nil
      auto-save-default nil) ; don't create #autosave# files

;; Don't write custom setting
(setq custom-file null-device)

(setq confirm-kill-emacs 'y-or-n-p)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

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

(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-width-start t)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package general
  :config
  (general-create-definer alex/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix ","
    :global-prefix "C-SPC")

  (alex/leader-keys
    "," 'save-buffer))

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :init
  (ivy-mode 1))

;; NOTE: The first time this configuration is loaded on a new machine, you'll
;; need to run the following command interactively so that mode line icons
;; display correctly:
;;
;; M-x all-the-icons-install-fonts

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :init (load-theme 'doom-dracula t))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("k" text-scale-increase "in")
  ("j" text-scale-decrease "out")
  ("r" (text-scale-adjust 0) "reset")
  ("esc" nil "finished" :exit t))

(alex/leader-keys
  "t" '(:ignore t :which-key "text")
  "ts" '(hydra-text-scale/body :which-key "scale text"))

(use-package org
  :hook ((org-mode . visual-line-mode)
	 (org-mode . (lambda () (setq show-trailing-whitespace t))))
  :config
  (setq org-ellipsis " ▾")
  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-cycle-separator-lines 1)
  (setq org-startup-folded 'content)
  (setq org-agenda-files '("~/org"))

  (require 'org-habit)
  (add-to-list 'org-modules 'org-habit)

  (setq org-habit-graph-column 60))

(alex/leader-keys
  "o" '(:ignore t :which-key "org")
  "oa" '(org-agenda :which-key "agenda"))

(alex/leader-keys
  "w" '(whitespace-cleanup :which-key "whitespace cleanup"))

(add-hook 'prog-mode-hook
  (lambda ()
    (setq show-trailing-whitespace t)))
