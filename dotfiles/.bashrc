#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
PATH="$PATH:/home/justalternate/.local/bin"
PATH="$PATH:/home/justalternate/github/flutter/bin"
cd .config/neofetch
./change_distro.sh
cd
neofetch
