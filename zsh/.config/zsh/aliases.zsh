# LISTING
alias ls='ls -h --color --time-style=long-iso'
alias l='eza --long --git --no-user --no-permissions --no-quotes --icons=always'
alias ll='eza --long --all --git --no-quotes --icons=always'
alias lm='ll --sort=modified'
alias lt='ll --tree --level=3'


alias grep="ggrep"

# BUNDLER
alias bi='bundle install --path=vendor/bundle'
alias be='bundle exec'

# DOCKER
alias d='docker'
alias dc='docker compose'

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

