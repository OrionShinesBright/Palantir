#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#aliases
alias lessgo='startx'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias pS='sudo pacman -S'
alias pSyu='sudo pacman -Syu'
alias battery='cat /sys/class/power_supply/BAT0/capacity'
alias pQe='sudo pacman -Qqe | grep -v "xorg" | less -N --use-color'
PS1='[\u@\h \W]\$ '
date
echo 'Battery: '; cat /sys/class/power_supply/BAT0/capacity
