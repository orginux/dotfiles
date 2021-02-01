#!/bin/bash

# catch non-bash and non-interactive shells
[[ $- == *i* && $BASH_VERSION ]] && SHELL=/bin/bash || return 0

# set some defaults
export MANWIDTH=90
export HISTSIZE=10000
export HISTIGNORE="q:f:v"
export EDITOR="nvim"

# colors in less (manpager)
export LESS_TERMCAP_mb=$'\e[01;31m'
export LESS_TERMCAP_md=$'\e[01;31m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[01;32m'
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/.local/bin

export GOPATH="$HOME/go"

# ensure ~/bin is on the path
[[ $PATH =~ ~/bin ]] || PATH=~/bin:$PATH

set -o vi
set -o notify

shopt -s direxpand
shopt -s checkhash
shopt -s sourcepath
shopt -s expand_aliases
shopt -s autocd cdspell
shopt -s extglob dotglob
shopt -s no_empty_cmd_completion
shopt -s autocd cdable_vars cdspell
shopt -s cmdhist histappend histreedit histverify
[[ $DISPLAY ]] && shopt -s checkwinsize

# prompt if file sourcing below fails
PS1='[\u@\h \W]\$ '

# uncomment these lines to disable the multi-line prompt
# add user@host, and remove the unicode line-wrap characters

# export PROMPT_LNBR1=''
# export PROMPT_MULTILINE=''
# export PROMPT_USERFMT='\u\[\e[0m\]@\[\e[31m\]\h '

# source shell configs
for f in "$HOME/.bash/"*?.bash; do
    . "$f"
done

alias l='ls'
alias vim='nvim'
alias ды='ls'
alias дд='ll'
alias мшь='nvim'
# alias bcat='/bin/cat'
# alias cat='bat'
alias rg='ranger'
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

# virtualenv
alias mla='source ~/repositories/_molecule/bin/activate'
alias mla3='source ~/repositories/_molecule3-new/bin/activate && export ANSIBLE_FORCE_COLOR=true'

alias gcloud='~/google-cloud-sdk/bin/gcloud'

# k8s
source ~/.kubectl_aliases
complete -F __start_kubectl k
source <(kubectl completion bash)

[ -z "$TMUX" ] && command -v tmux > /dev/null && TERM=xterm-256color && exec tmux
eval "$(starship init bash)"

function mkcd {
  last=$(eval "echo \$$#")
  if [ ! -n "$last" ]; then
    echo "Enter a directory name"
  elif [ -d $last ]; then
    echo "\`$last' already exists"
  else
    mkdir $@ && cd $last
  fi
}
