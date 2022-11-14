EDITOR="vim"
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

source $HOME/.profile

export LC_ALL=en_US.utf-8 
export LANG="$LC_ALL" 
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/thees/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="imajes"

alias counts="sort | uniq -c | sort -n"
alias stats="Rscript -e 'summary (as.numeric (readLines (\"stdin\")))'"
alias nix-update="nix-channel --update && nix-env -u"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

plugins=(git git-extras fasd)

alias vim="nvr"

neovim_autocd() {
    [[ $NVIM_LISTEN_ADDRESS ]] && neovim-autocd.py
}
chpwd_functions+=( neovim_autocd )

# User configuration


export GOPATH=$HOME/code/go
export PATH=$PATH:$GOPATH/bin:$HOME/bin

eval "$(direnv hook zsh)"
