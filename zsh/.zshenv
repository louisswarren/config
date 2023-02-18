export  XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export   XDG_DATA_HOME=$HOME/.local/share
export  XDG_STATE_HOME=$HOME/.local/state

export      HISTFILE="$XDG_STATE_HOME"/zsh/history
export       INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export  LESSHISTFILE="$XDG_STATE_HOME"/less/history
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/startup.py
export   RLWRAP_HOME="$XDG_STATE_HOME"/rlwrap
export      SSB_HOME="$XDG_DATA_HOME"/zoom
export      TEXMFVAR="$XDG_CACHE_HOME"/texlive/texmf-var
export       VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export        WGETRC="$XDG_CONFIG_HOME"/wget/wgetrc
export    XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority
export       XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
export       ZDOTDIR="$XDG_CONFIG_HOME"/zsh

eval $(keychain --eval --quiet id_ed25519)
