EDITOR="vim"
. ~/.indeedrc
. ~/.profile

export PATH=/usr/lib/jvm/java-8-oracle/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

. /home/placey/.nix-profile/etc/profile.d/nix.sh

PATH=$HOME/.cargo/bin:$PATH
. $HOME/.cargo/env

export INDEED_OFFICE=seaoff

. $HOME/.profile

alias counts="sort | uniq -c | sort -n"
alias stats="Rscript -e 'summary (as.numeric (readLines (\"stdin\")))'"
alias nix-update="nix-channel --update && nix-env -u"

alias autobuild='when-changed -r -k src -c "ant hobo"'
alias testpush="ant test && git push"

export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/thees/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="imajes"


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/placey/.oh-my-zsh"

plugins=(git git-extras brew catimg fasd)

alias vim="nvr"

neovim_autocd() {
    [[ $NVIM_LISTEN_ADDRESS ]] && neovim-autocd.py
}
chpwd_functions+=( neovim_autocd )

#fasd stuff
alias v='f -e vim' # quick opening files with vim
alias c='fasd_cd -d'

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH=$HOME/.local/bin:/usr/local/go/bin:$GOPATH/bin:$HOME/bin:/usr/local/bin:$PATH
# added by Anaconda2 4.2.0 installer
export PATH="/home/placey/anaconda3/bin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

alias cdl=cd $? && ls

alias importss="go list -f '{{range .Imports}}
{{.}} {{end}}' ./... | awk '{ print length, $0 }' " 
alias imports="go list -f '{{range .Imports}} 
{{.}} {{end}}' ./... | awk '{ print length, $0 }' | sort -n | cut -d\" \" -f2- | uniq " 
bindkey -v

export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin:$HOME/bin

function ezlog() {
  fetch-logrepo $1 yesterday today | tr '&' '\t' | url-decode | less -S
}


# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
#
