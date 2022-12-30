# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme


# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

###### set5 plugins for zephyr
plugins=( 
	autosuggestions
	clipboard
	syntax-highlighting
	z
	zsh-fzf-history-search
)

###### Zephyr-install und usage
# clone zephyr
[[ -d ${ZDOTDIR:-~}/.zephyr ]] ||
  git clone --recursive git@github.com:jknedlik/zephyr.git ${ZDOTDIR:-~}/.zephyr

# source zephyr
source ${ZDOTDIR:-~}/.zephyr/zephyr.zsh

bindkey "^[[3~" delete-char


# User configuration

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
###### history config
	export HISTSIZE=10000000
	export SAVEHIST=10000000
	#bindkey '^ ' autosuggest-accept

export MANPATH="/usr/local/man:$MANPATH"
export BROWSER=/usr/bin/qutebrowser
export EDITOR=/usr/bin/vim
export TERMINAL=/usr/bin/alacritty
export TERM=xterm-256color
export HISTFILE=~/.zsh_history

###### disable machine name on own machines
if [[ $USER = "jknedlik" || $(hostname) = "jk-box" ]]; then
  prompt_context () { }
fi

###### Wayland & Sway exports
export MOZ_ENABLE_WAYLAND=1
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
export WLR_DRM_DEVICES=/dev/dri/card0
export PATH=$PATH:/$HOME/.scripts
export LC_ALL="en_US.UTF-8" 
export nfsend="notify-send '%s -%m' -c im.received && paplay /usr/share/sounds/gnome/default/alerts/sonar.ogg"

###### Aliases
alias ls="exa"
alias virgo="ssh virgo"
alias kronos="ssh kronos"
alias r=ranger
alias v=vagrant
alias rcd="source ranger"
alias userctl="systemctl --user"
alias signal="scli -n -e vim -s -f -N \"$nfsend\""

###### Git Aliases
alias gs="git status"
alias gss='git status -s'
alias gch="git checkout"
alias gdc="git diff --cached"
alias gp='git push'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'
alias gap='git apply'

###### Powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
zstyle ':completion:*' menu select
typeset -g POWERLEVEL10K_TIME_FOREGROUND=238
typeset -g POWERLEVEL10K_DIR_HOME_SUBFOLDER_BACKGROUND='111'
typeset -g POWERLEVEL10K_DIR_ETC_BACKGROUND='111'
typeset -g POWERLEVEL10K_DIR_DEFAULT_BACKGROUND='111' 
typeset -g POWERLEVEL10K_DIR_HOME_BACKGROUND='111'
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

###### Directory 

#setup easy reusing dirs
d='dirs -v | head -10'
1='cd -'
2='cd -2'
3='cd -3'
4='cd -4'
5='cd -5'
6='cd -6'
7='cd -7'
8='cd -8'
9='cd -9'
#set --user python path
export PATH=$PATH:~/.local/bin
#setopt autocd autopushd \ pushdignoredups
