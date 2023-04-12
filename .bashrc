# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

# set some defaults
export MANWIDTH=90
export HISTSIZE=10000
export HISTIGNORE="q:f:v"
export EDITOR="nvim"

export GOPATH="$HOME/go"
export PATH=$PATH:~/go/bin

set -o vi
set -o notify
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'

alias l='ls'
alias vim='nvim'
alias n='nvim .'
alias ды='ls'
alias дд='ll'
alias мшь='nvim'
alias ll='ls -la'
# alias bcat='/bin/cat'
# alias cat='bat'
alias :q='exit'

alias gs='git status'
alias gaa='git add .'
alias ga='git add'
alias gd='git diff'
alias gpl='git pull'
alias gcmsg='git commit -m'

# al-info
alias lg='lazygit'
alias ld='lazydocker'

# k8s
# source ~/.kubectl_aliases
# complete -F __start_kubectl k
# source <(kubectl completion bash)

eval "$(starship init bash)"


# https://github.com/gokcehan/lf/wiki/Tutorial#working-directory
# lf config
LFCD="/home/orginux/.config/lf/lfcd.sh"
if [ -f "$LFCD" ]; then
    source "$LFCD"
fi
bind '"\C-o":"lfcd\C-m"'

alias lf='lfcd'

