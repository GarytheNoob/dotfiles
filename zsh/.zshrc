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
ENABLE_CORRECTION="true"
plugins=(
    git
    zsh-autosuggestions
    fast-syntax-highlighting
    zsh-autocomplete
)
source $ZSH/oh-my-zsh.sh

export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890



# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#     exec startx
# fi

if [[ $TERM == "linux" ]]; then
    export LANG=en_US.UTF-8
fi


source $HOME/.zshalias
source $HOME/.zshinit

eval "$(starship init zsh)" # start starship
