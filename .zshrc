# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
export ZSH="/home/zjr/.oh-my-zsh"
# export DISPLAY=localhost:10.0

export Synopsys_HOME=/opt/synopsys
export SNPSLMD_LICENSE_FILE=27000@xiangshan-00
export SYNOPSYS_LICENSE_FILE=$Synopsys_HOME/License/Synopsys.dat
export VCS_HOME=$Synopsys_HOME/vcs/O-2018.09-SP2
export PATH=$VCS_HOME/bin:$PATH
export PATH=/opt/synopsys/scl-2018-06/linux64/bin:$PATH

export XSGIT=git@github.com:RISCVERS/XiangShan.git
export NEMUGIT=git@github.com:RISCVERS/NEMU.git
export AMGIT=git@github.com:RISCVERS/nexus-am.git
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="ys"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting autojump zsh-256color)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export NEMU_HOME="/home/zjr/NEMU"
export AM_HOME="/home/zjr/nexus-am"
export NOOP_HOME="/home/zjr/XiangShan"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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


# ssh-agent autorun
eval $(ssh-agent -s) > /dev/null
trap 'test -n "$SSH_AGENT_PID" && eval `/usr/bin/ssh-agent -k` > /dev/null' 0

# Mak prompt keep in middle of screen
# load terminfo modules to make the associative array $terminfo available
zmodload zsh/terminfo 

# save current prompt to parameter PS1o
PS1o="$PS1"

# calculate how many lines one half of the terminal's height has
halfpage=$((LINES/2))

# construct parameter to go down/up $halfpage lines via termcap
	halfpage_down=""
	for i in {1..$halfpage}; do
	halfpage_down="$halfpage_down$terminfo[cud1]"
	done

	halfpage_up=""
	for i in {1..$halfpage}; do
	halfpage_up="$halfpage_up$terminfo[cuu1]"
	done

# define functions
	function prompt_middle() {
# print $halfpage_down
		PS1="%{${halfpage_down}${halfpage_up}%}$PS1o"
	}

function prompt_restore() {
	PS1="$PS1o"
}

magic-enter () {
	if [[ -z $BUFFER ]]
		then
			print ${halfpage_down}${halfpage_up}$terminfo[cuu1]
			zle reset-prompt
	else
		zle accept-line
			fi
}
zle -N magic-enter
bindkey "^M" magic-enter