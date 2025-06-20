eval "$(starship init zsh)"

export XDG_CONFIG_HOME="$HOME/.config"
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

# install via brew install zsh-syntax-highlighting zsh-history-substring-search zsh-autosuggestions
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# vi mode
bindkey -v

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^R' history-incremental-search-backward
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=true
export HISTSIZE=100000
export SAVEHIST=100000

setopt share_history
setopt hist_ignore_all_dups
