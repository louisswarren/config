export  XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export   XDG_DATA_HOME=$HOME/.local/share
export  XDG_STATE_HOME=$HOME/.local/state

export     HISTFILE="$XDG_STATE_HOME"/zsh/history
export      INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export  RLWRAP_HOME="$XDG_STATE_HOME"/rlwrap
export      VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export      XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export      ZDOTDIR="$XDG_CONFIG_HOME"/zsh
