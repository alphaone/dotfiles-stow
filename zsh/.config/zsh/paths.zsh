# homebrew coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# binstubs
# export PATH="./bin:$PATH"

# rbenv
export PATH="$HOME/.rbenv/shims:$PATH"

# go
export GOPATH="$HOME/code/go"
export PATH="$GOPATH/bin:$PATH"

# python / miniconda
export PATH="/Users/tmangner/miniconda3/bin:$PATH"

# libpq (postgres client / pg_dump)
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# bob / neovim version manager
export PATH="$HOME/.local/share/bob/nvim-bin:$PATH"

