if [ -e "~/.zshenv" ]; then
	echo ".zshenv already exists"
	exit
fi

echo "export ZDOTDIR=$HOME/.config/zsh" > ~/.zshenv
