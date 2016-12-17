#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias vi='vim'

export PS1="[\w]\\$ \[$(tput sgr0)\]"
export PATH="${PATH}:${HOME}/bin:${HOME}/.cargo/bin"

#GIT_PROMPT_ONLY_IN_REPO=1
source ~/Documents/src/bash-git-prompt/gitprompt.sh
