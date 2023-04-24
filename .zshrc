source <(antibody init)
antibody bundle denysdovhan/spaceship-prompt

antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Enable autocompletion
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
    compinit -i
else
    compinit -C -i
fi

zmodload -i zsh/complist

# Setup history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZE

# Remove older duplicate entries from history
setopt hist_ignore_all_dups

# Remove superfluous blanks from history items
setopt hist_reduce_blanks

# Save history entries as soon as they are entered
setopt inc_append_history

# Share history between different instances of the shell
setopt share_history

# Automatically list choices on ambiguous completion
setopt auto_list

# Automatically use menu completion
setopt auto_menu

# Move cursor to end if word had one match
setopt always_to_end

bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# Fix backspace bug when switching modes
bindkey -v '^?' backward-delete-char

autoload -U select-word-style
select-word-style bash

bindkey -v
# Reduce the lag between ESC and entering VI mode
export KEYTIMEOUT=1

# Scale up GUI elements
export GDK_SCALE=2

# Scale down text in GUI elements
export GDK_DPI_SCALE=0.5

# Use ripgrep for FZF
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'

# Start pyenv every time a shell is opened
eval "$(pyenv init --path)"

alias vim="nvim"
alias vi="nvim"
alias n="nvim"
alias ls="ls --color=auto"

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_PREFIX=''
SPACESHIP_GIT_PREFIX=''
SPACESHIP_CHAR_SYMBOL=''

SPACESHIP_PROMPT_ORDER=(
  #time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  #hg            # Mercurial section (hg_branch  + hg_status)
  #package       # Package version
  #node          # Node.js section
  #ruby          # Ruby section
  #elixir        # Elixir section
  #xcode         # Xcode section
  #swift         # Swift section
  #golang        # Go section
  #php           # PHP section
  #rust          # Rust section
  #haskell       # Haskell Stack section
  #julia         # Julia section
  #docker        # Docker section
  aws           # Amazon Web Services section
  #venv          # virtualenv section
  #conda         # conda virtualenv section
  #pyenv         # Pyenv section
  #dotnet        # .NET section
  #ember         # Ember.js section
  #kubectl       # Kubectl context section
  #terraform     # Terraform workspace section
  #exec_time     # Execution time
  #line_sep      # Line break
  #battery       # Battery level and status
  #vi_mode       # Vi-mode indicator
  #jobs          # Background jobs indicator
  #exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
    exec_time     # Execution time
    git           # Git section (git_branch + git_status)
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    time          # Time stamps section
)

autoload -U promptinit; promptinit
