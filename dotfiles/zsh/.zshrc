# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
if [[ ! -d /usr/share/oh-my-zsh ]]; then
  ZSH=~/.oh-my-zsh/
fi

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

#antigen stuff

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#
#export PATH="$PATH:~/.local/bin"
if [[ $(uname -a | awk '{print $2}' | cut -c-2) = "lx" ]]; then
	export PATH=/u/jknedlik/SOFTWARE/vim/8.1/bin:$PATH
	export PATH="$PATH:/u/geuppert/.local/bin"
	export LANG=en_US.UTF-8
	source /etc/profile.d/modules.sh
	export MODBASE_PATH=/cvmfs/htit.gsi.de/
	module use "$MODBASE_PATH"/modulefiles
fi
# Load fzf AFTER vi-mode!!!
plugins=( 
	git 
	thefuck 
	tmux
	vagrant
	vi-mode 
#	zsh-autosuggestions
#	zsh-syntax-highlighting
	fzf
)

bindkey "^[[3~" delete-char


# User configuration

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
#bindkey '^ ' autosuggest-accept

export MANPATH="/usr/local/man:$MANPATH"


# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
# 

export BROWSER=/usr/bin/qutebrowser
export EDITOR=/usr/bin/vim
export TERMINAL=/usr/bin/termite
export TERM=xterm-256color

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias xm="xmodmap ~/.Xmodmap"
alias cls="clear && printf '\e[3J'"

pacsize() {
	if [ -n "$1" ]
	then 
		pacman -Qi | awk '/^Name/{name=$3} /^Installationsgröße/{print $3$4, name}' | sort -hr | head -$1
	else
		pacman -Qi | awk '/^Name/{name=$3} /^Installationsgröße/{print $3$4, name}' | sort -hr | head -50
	fi
}

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

# disable machine name in agnoster theme
#if [[ $ZSH_THEME = "agnoster" ]]; then
  #prompt_context () { }
#fi

# disable machine name on own machines
if [[ $USER = "jknedlik" || $(hostname) = "jk-box" ]]; then
  prompt_context () { }
fi

#bindkey '^ ' autosuggest-accept
export MOZ_ENABLE_WAYLAND=1
#export QT_WAYLAND_FORCE_DPI=physical
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway
alias virgo="ssh virgo"
alias kronos="ssh kronos"
export WLR_DRM_DEVICES=/dev/dri/card0
export PATH=$PATH:/$HOME/.scripts
export LC_ALL="en_US.UTF-8" 
#export QT_SCALE_FACTOR=2
alias r=ranger
alias v=vagrant
alias rcd="source ranger"
alias gs="git status"
alias gch="git checkout"
alias gdc="git diff --cached"
alias userctl="systemctl --user"
export nfsend="notify-send '%s -%m' -c im.received && paplay /usr/share/sounds/gnome/default/alerts/sonar.ogg"
alias signal="scli -n -e vim -s -f -N \"$nfsend\""
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U compinit && compinit
. /usr/share/zsh/plugins/zsh-z/zsh-z.plugin.zsh
zstyle ':completion:*' menu select
typeset -g POWERLEVEL10K_TIME_FOREGROUND=238

typeset -g POWERLEVEL10K_DIR_HOME_SUBFOLDER_BACKGROUND='111'
typeset -g POWERLEVEL10K_DIR_ETC_BACKGROUND='111'
typeset -g POWERLEVEL10K_DIR_DEFAULT_BACKGROUND='111' 
typeset -g POWERLEVEL10K_DIR_HOME_BACKGROUND='111'

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
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
#source ~/documents/spack/share/spack/setup-env.sh
