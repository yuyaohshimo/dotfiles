# brew
export PATH=/usr/local/bin:$PATH

# rbenv
eval "$(rbenv init -)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug

# golang
export GOPATH=$HOME/Documents/go
export PATH=$PATH:$GOPATH/bin

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools
