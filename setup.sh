ln -s "$(dirname -- "$(pwd)/$0")/zsh/.zshenv" "$HOME/.zshenv"
source "$HOME/.zshenv"

# Create XDG directories
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_DATA_HOME"
mkdir -p "$XDG_STATE_HOME"
mkdir -p "$XDG_CACHE_HOME"

# Create other directories used in .zshenv
mkdir -p $(dirname -- "$HISTFILE")
mkdir -p $(dirname -- "$INPUTRC")
mkdir -p $(dirname -- "$LESSHISTFILE")
mkdir -p $(dirname -- "$RLWRAP_HOME")
mkdir -p $(dirname -- "$ZDOTDIR")

# Create other directories used in vimenv
mkdir -p  "$XDG_CACHE_HOME/vim"
mkdir -p "$XDG_CONFIG_HOME/vim"
mkdir -p   "$XDG_DATA_HOME/vim"

mkdir -p "$XDG_CONFIG_HOME/vim/after"
mkdir -p   "$XDG_DATA_HOME/vim/after"

mkdir -p "$XDG_CACHE_HOME/vim/backup"
mkdir -p "$XDG_CACHE_HOME/vim/swap"
mkdir -p "$XDG_CACHE_HOME/vim/undo"

mkdir -p "$XDG_DATA_HOME/vim/spell"
mkdir -p "$XDG_DATA_HOME/vim/view"
