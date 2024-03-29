# FILENAME: .alias.zsh
# DESCRIPTION: aliases for zsh
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

## lsd
if command -v lsd &> /dev/null; then
    alias ls="lsd"
    alias ll="lsd -l"
    alias la="lsd -A"
    alias lla="lsd -lA"
    alias l="lsd -lA"
    alias tree="lsd -a --tree --icon never"
fi

## fetch
alias f=neofetch

## cmd prefix/flags
alias sudo="sudo -E"
alias mkdir="mkdir -p"

## shortcut
# alias c="clash &"
alias stx=startx
alias p="paru"
alias q=exit
alias cls=clear

# alias vim="nvim"
alias vi="nvim"

## git
## NOTE: Some git aliases are provided by the git plugin of zsh
alias ga="git add"
alias gc="git commit -m"
alias gp="git push &"

## bat
if command -v bat &> /dev/null; then
    alias cat=bat
fi

if [[ "$HOST" = "GaryArchPC" ]]; then
    alias pdfmerge=$HOME/.local/bin/pdfmerge
    alias zathuraconf=$HOME/go/bin/zathuraconf
fi

alias jo=joshuto
alias ra=joshuto
