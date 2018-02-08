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

# Calling `nvm use` automatically in a directory with a .nvmrc file
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
