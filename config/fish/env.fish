# Python: source pyenv config for fish
. (pyenv init - fish | psub)

# Set locale
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8

# Configure fzf to use fd by default (fd respects .gitignore defaults)
set -gx FZF_DEFAULT_COMMAND 'fd --type f'

set -gx GOPATH "$HOME/.go"
