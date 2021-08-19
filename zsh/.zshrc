# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme


zstyle ':completion:*' cache-path $XDG_CACHE_HOME/zsh/zcompcache
zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:]}={[:upper:]}'
zstyle :compinstall filename '/home/louis/.zshrc'
zstyle ':completion:*:*:vim:*' file-patterns '^*.(aux|log|pdf|agdai):source-files' '*:all-files'
zstyle ':completion:*:*:gvim:*' file-patterns '^*.(aux|log|pdf|agdai):source-files' '*:all-files'

autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

# End of lines added by compinstall
# Lines configured by zsh-newuser-install
#HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

DEFAULT_USER=louis

ZLE_RPROMPT_INDENT=0

bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

alias vim='vim -p'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias clip='xclip -selection clipboard'
alias agdac='agda --compile --ghc-flag=-dynamic'
alias zathura='zathura 2> /dev/null --fork'

alias gitslog='git --no-pager log --decorate --oneline --graph -20'
alias gittracked='git ls-tree -r --name-only'

alias ll='ls -lAhF'

alias map="xargs -d '\n'"

alias maxima='rlwrap maxima'

alias await='watch -g ps -opid -p'

alias dff='df -x tmpfs -x devtmpfs -h'

alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'

# stty -ixon
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# If zsh is invoked interactively to run vim (via 'zsh -is vim'), do so inside
# an interactive shell
if [[ $1 == vim ]]; then
	"$@"
	set --
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/p10k.zsh ]] || source ~/.config/zsh/p10k.zsh
