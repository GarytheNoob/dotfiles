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

#aliases
alias q=exit
alias cls=clear

alias ls="lsd"
alias ll="lsd -l"
alias la="lsd -A"
alias lla="lsd -lA"
alias l="lsd -lA"
alias tree="lsd -a --tree --icon never"

alias f=neofetch

alias sudo="sudo -E"

# alias vim="nvim"

alias c="clash &"
alias stx=startx

alias p="paru"

alias ga="git add"
alias gc="git commit -m"
alias gp="git push &"

alias rs="source /home/GarytheNoob/.zshrc"



if [[ $TERM == "linux" ]]; then
    export LANG=en_US.UTF-8
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# change ls colors
LS_COLORS=$LS_COLORS:'di=0;36:ow=1;4;36' ; export LS_COLORS

# print
echo -e "\033[34;1m" $(ps -p $(ps -p $$ -o ppid=) o args= | awk '{print $1}') "\033[0m \n"
