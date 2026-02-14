# FILENAME: .zshrc
# DESCRIPTION: zsh's config file
# ORIGIN: https://github.com/GarytheNoob/dotfiles
#
# This file is partly or fully edited by
#  ▄▄▄  ▄  ▄▄  ▄ ▄      ▄▄     
#  █   █ █ █▄▀ █▄█   ▄█▀▀▀▀█▄  
#  █▄█ █▀█ █ █  █   █▀      ▀▀ 
#  ▄▄▄ ▄ ▄ ▄▄▄      █    ▀▄▄   
#   █  █▄█ █▄▄      █▄     ▀█▄ 
#   █  █ █ █▄▄       ▀█▄▄▄▄█▀  
#  ▄▄▄ ▄▄▄ ▄▄▄ ▄▄     ▄▄█▀     
#  █ █ █ █ █ █ █▄▀  ▄█▀        
#  █ █ █▄█ █▄█ █▄▀   ▀█▄▄      
#                       ▀▀     
# GitHub: https://github.com/GarytheNoob

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME=""
ENABLE_CORRECTION="false"
plugins=(
    git
    zsh-autosuggestions
    fast-syntax-highlighting
    # zsh-autocomplete
    fzf-tab
    zsh-vi-mode
)
source $ZSH/oh-my-zsh.sh
# Only changing the escape key to `jk` in insert mode, we still
# keep using the default keybindings `^[` in other modes
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk


# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#     exec startx
# fi

if [[ $TERM == "linux" ]]; then
    export LANG=en_US.UTF-8
fi


source "$HOME/.alias.zsh"
source "$HOME/.init.zsh"
source "$HOME/.fzf.zsh"

eval "$(starship init zsh)" # start starship
eval "$(zoxide init --cmd cd zsh)"   # start zoxide

export PATH=:/opt/homebrew/bin:$PATH:/home/GarytheNoob/.spicetify

# Created by `pipx` on 2026-02-13 08:42:12
export PATH="$PATH:/Users/garythenoob/.local/bin"
