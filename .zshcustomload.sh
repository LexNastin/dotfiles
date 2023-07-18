setopt correct
setopt extendedglob
setopt nocaseglob
setopt rcexpandparam
setopt nocheckjobs
setopt numericglobsort
setopt nobeep
setopt appendhistory
setopt histignorealldups
setopt autocd
setopt inc_append_history
setopt histignorespace

zstyle ':completion"*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion"*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion"*' rehash true
zstyle ':completion"*' accept-exact '*(N)'
zstyle ':completion"*' use-cache on
zstyle ':completion"*' cache-path ~/.zsh/cache
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
WORDCHARS=${WORDCHARS//\/[&.;]}

if [[ "$OSTYPE" == "darwin"* ]]; then
	ZSH_PLUGIN_DIR="/opt/homebrew/share"
else
	ZSH_PLUGIN_DIR="/usr/share/zsh/plugins"
fi

# fix tab completion
__git_files () { 
    _wanted files expl 'local files' _files     
}

source $ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZSH_PLUGIN_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh
source $ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^H' backward-kill-word

