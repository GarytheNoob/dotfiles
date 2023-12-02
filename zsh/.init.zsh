# FILENAME: .init.zsh
# DESCRIPTION: zsh runs this script at every start
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

export termapp=$(basename $(ps -p $(ps -p $$ -o ppid=) o args= | awk '{print $1}'))

if [[ "$termapp" != "tmux" ]]; then
    echo -e "\n  \033[01;34mWelcome to $termapp, $USER! \033[0m\n"
fi


# change ls colors
LS_COLORS=$LS_COLORS:'di=0;36:ow=1;4;36' ; export LS_COLORS

# variable
export EDITOR=nvim
