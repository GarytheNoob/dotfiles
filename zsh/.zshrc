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

ZSH_THEME="robbyrussell"
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
plugins=(
    git
    # zsh-autosuggestions
    # zsh-syntax-highlighting
)

export http_proxy=http://127.0.0.1:7890
export https_proxy=http://127.0.0.1:7890

source $ZSH/oh-my-zsh.sh


# if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
#     exec startx
# fi

if [[ $TERM == "linux" ]]; then
    export LANG=en_US.UTF-8
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# change ls colors
LS_COLORS=$LS_COLORS:'di=0;36:ow=1;4;36' ; export LS_COLORS

source $HOME/.zshalias
source $HOME/.zshinit
