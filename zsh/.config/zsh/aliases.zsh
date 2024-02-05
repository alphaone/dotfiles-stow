# LISTING
alias ls='ls -h --color --time-style=long-iso'
alias l='ls -l'
alias ll='ls -lA'
alias lt='ls -lt'


# GIT
# even though the git plugin of oh-my-zsh brings these, i have to tweak them:
alias gup='git smart-pull'
alias gm='git smart-merge'
alias gl='git smart-log'
alias gp='git push'
alias gpf='git push --force'
alias gst='git status'
alias gss='git status --short'
alias gco='git checkout'
alias gcm='gco $(git_main_branch)'
alias gfrm='git fetch && git rebase $(git_main_branch)'

alias grep="ggrep"

# BUNDLER
alias bi='bundle install --path=vendor/bundle'
alias be='bundle exec'

# DOCKER
alias d='docker'
alias dc='docker-compose'

# TERRAFORM
alias tf='terraform'

# VIM
alias v='nvim'
alias vv='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'

# YARN
alias y='yarn'
alias yc='yarn tsc && yarn lint --fix && yarn test'
alias yd='yarn dev | roarr pretty-print'
alias yt='yarn test:watch'
alias yu='yarn upgrade-interactive --latest'

# GOLANG
alias air='$(go env GOPATH)/bin/air'
