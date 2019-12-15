source <(antibody init)
antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure

antibody bundle zsh-users/zsh-syntax-highlighting
antibody bundle zsh-users/zsh-autosuggestions
antibody bundle zsh-users/zsh-history-substring-search
antibody bundle zsh-users/zsh-completions

# Set config directory
export XDG_CONFIG_HOME=$HOME/.config

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

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Scale up GUI elements
export GDK_SCALE=2

# Scale down text in GUI elements
export GDK_DPI_SCALE=0.5

# Use ripgrep for FZF
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'

alias ls="ls --color=auto"
alias vim="nvim"
alias vi="nvim"

export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/bin/go
export PATH=$PATH:$HOME/.cargo/bin
