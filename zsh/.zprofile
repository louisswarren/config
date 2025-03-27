export PATH=~/bin:$PATH
export EDITOR='vim -p'

if [ -z "$DISPLAY" ] && [ -n "$XDG_VTNR" ] && [ "$XDG_VTNR" -eq 1 ]; then
	case $(uname -n) in
		euler)
			#startx "$XDG_CONFIG_HOME/X11/xinitrc"
			exec sway --unsupported-gpu > sway.1.log 2> sway.2.log
			;;
		plato)
			startx
			;;
		turing)
			exec sway > sway.1.log 2> sway.2.log
			;;
		*)
			;;
	esac
fi
