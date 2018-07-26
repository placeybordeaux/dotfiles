
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. ~/.indeedrc
. ~/.profile

export PATH=/usr/lib/jvm/java-8-oracle/bin:$PATH
export JAVA_HOME=/usr/lib/jvm/java-8-oracle
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

alias s="ssh aus-vm-hcn01.indeed.net"
alias counts="sort | uniq -c | sort -n"
alias stats="Rscript -e 'summary (as.numeric (readLines (\"stdin\")))'"

alias autobuild='when-changed -r -k src -c "ant hobo"'

export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 
# export TERM=xterm-256color

#oh my zsh stuff below

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="terminalparty"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git git-extras brew catimg fasd)

alias vim="nvim-terminal-edit.py"

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
export PATH="$PATH:/home/placey/anaconda2/bin"
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


