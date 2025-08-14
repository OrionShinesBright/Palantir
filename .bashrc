# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ -f /etc/bash_completion ] && !shopt -oq posix; then
  ./etc/bash_completion
fi

alias ls='eza --icons --git --group-directories-first'
alias tree='eza -T --icons'

alias grep='grep --color=auto'
alias less='less -N --use-color --status-line'
alias cat='bat'

alias S='sudo pacman -S'
alias Ss='sudo pacman -Ss'
alias Syu='sudo pacman -Syu'
alias Q='sudo pacman -Qq'
alias Qe='sudo pacman -Qqe'
alias Qd='sudo pacman -Qqd'
alias Qdt='sudo pacman -Qqdt'
alias Rns='sudo pacman -Rns'
alias Rn='sudo pacman -Rn'
alias Rs='sudo pacman -Rs'

alias yS='yay -S'
alias ySs='yay -Ss'
alias ySyu='yay -Syu'
alias yQ='yay -Qq'
alias yQe='yay -Qqe'
alias yQdt='yay -Qqdt'
alias yRns='yay -Rns'
alias yRn='yay -Rn'
alias yRs='yay -Rs'

alias gcl='git clone'

alias nv='NVIM_APPNAME=myvim nvim'

export PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/orion/SYSTEM/local/bin:/home/orion/SYSTEM/local/bin:/home/orion/SYSTEM/config/rofi/scripts:/home/orion/SYSTEM/config/rofi/applets/bin

source ~/git-prompt.sh

PROMPT_COMMAND='PS1_CMD1=$(__git_ps1 " (%s)")'
PS1='\n\[\e[38;5;195;2;3m\]\u\[\e[38;5;159;1m\]@\[\e[22;2;38;5;195m\]\h\[\e[0m\] [\[\e[1m\]$?\[\e[0m\]]${PS1_CMD1}\n\[\e[38;5;51;1m\]\w\[\e[0m\] \[\e[38;5;51;1;5m\]󰣇\[\e[0m\] '
