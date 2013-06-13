# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="alanpeabody"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx macports pip screen terminalapp zsh-syntax-highlighting vagrant)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

alias c=clear

alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias qe=aquamacs

export GEM_HOME=/usr/lib/ruby/gems/1.8/gems
export RUBYOPT=rubygems

export PATH="/Library/Frameworks/Python.framework/Versions/Current/bin:${PATH}"
export PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$GEM_HOME/bin:$PATH
export PATH=$PATH:/usr/texbin
export PATH=$PATH:~/src/android-sdk-mac_86/tools
export PATH=$PATH:~/src/android-sdk-mac_86/platform-tools
export PATH=$PATH:~/src/android-ndk-r8e
export SL4A_ROOT=~/src/android-scripting
export PATH=$PATH:~/bin
export GOPATH=$HOME/src/go
export PATH=$PATH:$GOPATH
export NDK_MODULE_PATH=$HOME/ndk_tools

export CLICOLOR=true
export EDITOR=emacs
export CVS_RSH=ssh
export PAGER=most

export HISTTIMEFORMAT="%d.%m.%y %T "

# Building android needs a lot of open file descriptors?
ulimit -S -n 1024

# command to mount the android file image
function mountAndroid  { hdiutil attach ~/src/android-source.dmg  -mountpoint /Volumes/android-source; }
function mountAndroidRef  { hdiutil attach /Volumes/My\ Passport/android-source-ref.dmg  -mountpoint /Volumes/android-source-ref; }

unsetopt correctall
