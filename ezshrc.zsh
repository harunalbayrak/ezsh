export TERM="xterm-256color"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.config/ezsh/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

POWERLEVEL9K_MODE='nerdfont-complete'

ZSH_THEME="powerlevel10k/powerlevel10k"

POWERLEVEL9K_OS_ICON_BACKGROUND="white"
POWERLEVEL9K_OS_ICON_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_FOREGROUND="black"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="black"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="black"

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time background_jobs ram load rvm time)

# more prompt elements that are suggested
# (public_ip docker_machine pyenv nvm)          https://github.com/bhilburn/powerlevel9k#prompt-customization
# Note: using public_ip is cool but when connection is down prompt waits for 10-20 seconds

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(ssh os_icon context dir vcs)

POWERLEVEL9K_PROMPT_ON_NEWLINE=true


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-completions
    # zsh-autosuggestions     # disable when using marker, otherwise enable
    zsh-syntax-highlighting
    history-substring-search
    screen
    systemd
    web-search
    k
    extract
    z
    sudo
    alias-tips
    # httpie
    # git
    # python
    # docker
    # lol
    # pip
    # pyenv
    # redis-cli
    # zsh-wakatime          # enable if you use wakatime with 'https://github.com/wbingli/zsh-wakatime'
    )
#plugins+=(zsh-nvm)

# source $ZSH/oh-my-zsh.sh          # This is now run in .zshrc after importing user configs from ~/.config/ezsh/zshrc/* files 

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add to PATH to Install and run programs with "pip install --user"
export PATH=$PATH:~/.local/bin

export PATH=$PATH:~/.config/ezsh/bin

NPM_PACKAGES="${HOME}/.npm"
PATH="$NPM_PACKAGES/bin:$PATH"

autoload -U compinit && compinit -C -d ~/.cache/zsh/.zcompdump        # zsh-completions
# autoload bashcompinit                 # bash completions
# bashcompinit


# QuickZsh
SAVEHIST=50000      #save upto 50,000 lines in history. oh-my-zsh default is 10,000
#setopt hist_ignore_all_dups     # dont record duplicated entries in history during a single session

alias myip="wget -qO- https://wtfismyip.com/text"	# quickly show external ip address
alias l="ls --hyperlink=auto -lAhrtF"    # show all except . .. , sort by recent, / at the end of folders, clickable
alias e="exit"
alias ip="ip --color=auto"


# CUSTOM FUNCTIONS

# cheat sheets (github.com/chubin/cheat.sh), find out how to use commands
# example 'cheat tar'
# for language specific question supply 2 args first for language, second as the question
# eample: cheat python3 execute external program
cheat() {
    if [ "$2" ]; then
        curl "https://cheat.sh/$1/$2+$3+$4+$5+$6+$7+$8+$9+$10"
    else
        curl "https://cheat.sh/$1"
    fi
}


# Matrix screen saver! will run if you have installed "cmatrix"
# TMOUT=900
# TRAPALRM() { if command -v cmatrix &> /dev/null; then cmatrix -sb; fi }

speedtest() {
    curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python3 -
}

dadjoke() {
    curl https://icanhazdadjoke.com
}

# Find dictionary definition
dict() {
    if [ "$3" ]; then
        curl "dict://dict.org/d:$1 $2 $3"
    elif [ "$2" ]; then
        curl "dict://dict.org/d:$1 $2"
    else
        curl "dict://dict.org/d:$1"
    fi
}

# Find geo info from IP
ipgeo() {
    # Specify ip or your ip will be used
    if [ "$1" ]; then
        curl "http://api.db-ip.com/v2/free/$1"
    else
        curl "http://api.db-ip.com/v2/free/$(myip)"
    fi
}

PRELINE="\r\033[A"

random() {
    echo -e "\033]6;1;bg;red;brightness;$((1 + $RANDOM % 255))\a"$PRELINE
    echo -e "\033]6;1;bg;green;brightness;$((1 + $RANDOM % 255))\a"$PRELINE
    echo -e "\033]6;1;bg;blue;brightness;$((1 + $RANDOM % 255))\a"$PRELINE
}

color() {
    case $1 in
    green)
    echo -e "\033]6;1;bg;red;brightness;57\a"$PRELINE
    echo -e "\033]6;1;bg;green;brightness;197\a"$PRELINE
    echo -e "\033]6;1;bg;blue;brightness;77\a"$PRELINE
    ;;
    red)
    echo -e "\033]6;1;bg;red;brightness;270\a"$PRELINE
    echo -e "\033]6;1;bg;green;brightness;60\a"$PRELINE
    echo -e "\033]6;1;bg;blue;brightness;83\a"$PRELINE
    ;;
    orange)
    echo -e "\033]6;1;bg;red;brightness;227\a"$PRELINE
    echo -e "\033]6;1;bg;green;brightness;143\a"$PRELINE
    echo -e "\033]6;1;bg;blue;brightness;10\a"$PRELINE
    ;;
    *)
    random
    esac
}

color

# export PATH="$HOME/Library/Android/sdk/cmdline-tools/latest/bin:$PATH"
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home
# export PATH="$JAVA_HOME/bin:$PATH"
# export ANDROID_NDK_HOME="/opt/homebrew/share/android-ndk"
# export PATH="${HOME}/Library/Android/sdk/tools:${HOME}/Library/Android/sdk/platform-tools:${PATH}"
# export PATH=$HOME/bin:/usr/local/bin:$HOME/.cargo/bin:$HOME/Development/flutter/bin:$HOME/tools/node-v14.15.4-linux-x64/bin:$PATH
