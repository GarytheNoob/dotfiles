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
    alias tree="lsd --tree --icon never"
fi

## fetch
alias f=fastfetch

## cmd prefix/flags
alias mkdir="mkdir -p"

## shortcut
alias q=exit

# alias vim="nvim"
alias vi="nvim"

## git
## NOTE: Some git aliases are provided by the git plugin of zsh
alias ga="git add"
alias gc="git commit -m"
alias gp="git push &"

## bat
# if command -v bat &> /dev/null; then
#     alias cat=bat
# fi

if [[ "$HOST" = "GaryArchPC" ]]; then
    alias pdfmerge=$HOME/.local/bin/pdfmerge
    alias zathuraconf=$HOME/go/bin/zathuraconf
fi

alias jo=joshuto
alias ra=joshuto

alias py=ptpython
