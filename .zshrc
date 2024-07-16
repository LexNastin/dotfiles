# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

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

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
plugins=(git)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

source ~/.zshcustomload.sh

# setup path
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/go/bin:$PATH

alias py=python3

alias sudoi="$(which sudo) -i "
alias snv="$(which sudo) -e"
if [[ "$OSTYPE" == "darwin"* ]]; then
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519 > /dev/null 2&>1
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519_alt > /dev/null 2&>1
    export DEVKITPATH=/opt/devkitpro
    export DEVKITARM=/opt/devkitpro/devkitARM
    export PATH=/opt/devkitpro/devkitA64/bin:$PATH
    # export PATH=/opt/homebrew/Cellar/openjdk/20.0.1/bin:$PATH

    # perl setup
    export XDG_DATA_DIRS=/opt/homebrew/share
    # PATH="/Users/lexnastin/perl5/bin${PATH:+:${PATH}}"; export PATH;
    # PERL5LIB="/Users/lexnastin/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
    # PERL_LOCAL_LIB_ROOT="/Users/lexnastin/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
    # PERL_MB_OPT="--install_base \"/Users/lexnastin/perl5\""; export PERL_MB_OPT;
    # PERL_MM_OPT="INSTALL_BASE=/Users/lexnastin/perl5"; export PERL_MM_OPT;
    alias n="echo Not for MacOS!"
    alias reboob="sudo ~/scripts/asahi-bless-macos.sh && sudo reboot"
    alias tailscale="/Applications/Tailscale.app/Contents/MacOS/Tailscale"
else
    alias sudo='sudo -E '
    export BOX64_LOG=0
    export BOX64_NOBANNER=1
    export PATH=$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH

    alias n="nmtui"
    if [[ "$KITTY_WINDOW_ID" ]]; then
        alias sudo='sudo -E TERMINFO="/usr/lib/kitty/terminfo" '
    fi
    alias reboob="sudo asahi-bless && reboot"
fi

[ $(command -v nvim) ] && export EDITOR="$(which nvim)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


alias :q="exit"
alias c="clear"
alias x="cd; reset"
alias zzh="$(which ssh)"
if [[ "$KITTY_WINDOW_ID" ]]; then
	alias ssh="kitty +kitten ssh"
fi
alias vim="nvim"
alias v="nvim"
alias nv="nvim"
alias m="nvim"
alias gitc="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
# make rm nicer:
alias rm="rm -d"
alias l="ls -lAh"
# alias mdcd="mkdir"

mdcd() {
    mkdir -p -- "$1"
    cd "$1"
}

nvsh() {
    echo "#!/bin/sh\n\n" > "$1"
    chmod +x "$1"
    nvim "$1"
}

upd() {
    git log $1...HEAD --oneline
}

regex="(^-S|^-R|^-U)"
pacman() {
	if [[ "$1" =~ $regex ]]
	then
		sudo /usr/bin/pacman $@
	else
		/usr/bin/pacman $@
	fi
}

~/scripts/check_missing.sh
neofetch
