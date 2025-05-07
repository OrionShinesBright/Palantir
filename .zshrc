# ENABLING POWELEVEL10K PROMPT.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# PLUGIN MANAGER (ZINIT) SETUP

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"			# Specifying where the manager lives
if [ ! -d "$ZINIT_HOME" ]; then								# Ensure manager is downloaded, if not then:
	mkdir -p "$(dirname $ZINIT_HOME)"							# Make the directory
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"			# clone manager into it
fi
source "${ZINIT_HOME}/zinit.zsh"							# Source and load the manager on every new terminal instance

# ADDING PLUGINS

#### 1. Powerlevel10k 									# Discontinued project so maybe should shift to something else
zinit ice depth=1; zinit light romkatv/powerlevel10k
#### 2. SyntaxHighlighting
zinit light zsh-users/zsh-syntax-highlighting
#### 3. Completions
zinit light zsh-users/zsh-completions
autoload -U compinit && compinit
#### 4. Auto-Suggestions
zinit light zsh-users/zsh-autosuggestions
#### 5. Fzf-Tab
zinit light Aloxaf/fzf-tab
#### 6. ohmyzsh Plugins
zinit snippet OMZP::git
zinit snippet OMZP::command-not-found


zinit cdreplay -q


# SOURCE THE PROMPT

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh 						# Run `p10k configure` if changes required

# MANAGING HISTORY

HISTSIZE=2000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# COMPLETION STYLING

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons=always --color=always --color-scale age --color-scale-mode gradient -a --group-directories-first --git $realpath'
zstyle ':fzf-tab:complete:cat:*' fzf-preview 'bat -f $realpath'

# ALIASES

alias ls='eza --icons=always --color=always --color-scale age --color-scale-mode gradient --group-directories-first --git -F'
alias pacseek='~/.config/pacseek/pacseek'
alias grep='grep --color=auto'
alias pS='sudo pacman -S'
alias pSyu='sudo pacman -Syu'
alias battery='cat /sys/class/power_supply/BAT0/capacity'
alias pQe='pacman -Qqe | less -N --use-color'
alias tree='ls -T'

# SHELL INTEGRATIONS

eval "$(fzf --zsh)"

