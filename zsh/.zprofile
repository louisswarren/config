export PATH=~/bin:$PATH
export EDITOR='vim -p'

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	exec sway > sway.1.log 2> sway.2.log
fi
