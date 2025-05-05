# My new `stow` dotfiles setup

Setup using [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html) for
managing dotfiles in a clean and organized way.

To invoke the rollout, just do:

```bash

stow --verbose --target=$HOME --restow */

# or simply
make
```

It will create symlinks in the target directory (`$HOME`) for all the packages
in the current directory.
