eval "$(starship init zsh)"

export EDITOR='nvim'

source $ZDOTDIR/functions.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/java_paths.zsh
source $ZDOTDIR/paths.zsh
source $ZDOTDIR/awsrc.zsh
source $ZDOTDIR/kube-drest.zsh

# autocorrect is more annoying than helpful
unsetopt correct_all

# zoxide for autojump
eval "$(zoxide init zsh)"

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh

# vi mode
bindkey -v

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' history-incremental-search-backward
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true

setopt share_history
setopt hist_ignore_all_dups
