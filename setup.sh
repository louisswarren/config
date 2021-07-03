ln -s "$(dirname -- "$(pwd)/$0")/zsh/.zshenv" "$HOME/.zshenv"
source "$HOME/.zshenv"

mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_DATA_HOME"
mkdir -p "$XDG_STATE_HOME"
mkdir -p "$XDG_CACHE_HOME"

mkdir -p $(dirname -- "$HISTFILE")
mkdir -p $(dirname -- "$INPUTRC")
mkdir -p $(dirname -- "$LESSHISTFILE")
mkdir -p $(dirname -- "$RLWRAP_HOME")
mkdir -p $(dirname -- "$ZDOTDIR")
