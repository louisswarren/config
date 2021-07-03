if [ -e "~/.zshenv" ]; then
	echo ".zshenv already exists"
	exit
fi

echo "export ZDOTDIR=$HOME/.config/zsh" > ~/.zshenv

mkdir -p ~/.local/state/zsh
mkdir -p ~/.cache/zsh
echo "export HISTFILE=~/.local/state/zsh/history" >> ~/.zshenv
