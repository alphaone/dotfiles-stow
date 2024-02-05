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
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh" # This loads nvm
# [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

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
