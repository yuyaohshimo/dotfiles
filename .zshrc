## RubyMine cannot read zshenv, so I write zshenv here
## start zshenv

# brew
export PATH=/usr/local/bin:$PATH

# rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug

## end zshenv

source $ZPLUG_HOME/init.zsh

# enhancd config
export ENHANCD_COMMAND=cd
export ENHANCD_FILTER=fzy:fzf:peco

# A lightweight start point of shell configuration
zplug "yous/vanilli.sh"

# Additional completion definitions for Zsh
zplug "zsh-users/zsh-completions"

# z is the new j, yo
zplug "rupa/z", use:"*.sh"

# Simple standalone Zsh theme
zplug "yous/lime"

# Fish shell like syntax highlighting for Zsh.
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# ZSH port of the FISH shell's history search
# Ctrl+P
zplug "zsh-users/zsh-history-substring-search"

# A next-generation cd command with an interactive filter
# * Needs to install fzy: brew install fzy
zplug "b4b4r07/enhancd", use:init.sh

# This plugin adds many useful aliases and functions.
zplug "plugins/git", from:oh-my-zsh

# Handy command line tools for dealing with json data.
zplug "plugins/jsontools", from:oh-my-zsh

# Rails
zplug "plugins/rails", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

# Lime theme settings
export LIME_DIR_DISPLAY_COMPONENTS=2
