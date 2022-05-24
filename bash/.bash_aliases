# Get the current weather
# Depends on a config file in ~/.config/girouette/config.yml
if [ -x ~/bin/girouette ]; then
        alias weather='/usr/bin/echo `~/bin/girouette`'
fi

#
function updateos() {
sudo apt-get update && sudo apt-get -y upgrade
}

# 
function refreshsystem() {
  vim +PlugUpdate +qall
  sudo apt update
  sudo apt upgrade -y
}

# 3 ways to print your 'external'/Internet-visable IP address
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com' 

alias externalip='curl https://ipinfo.io/ip; echo "";'

function myexternalip() { 
    curl https://ipinfo.io/ip;
    echo "";
}


# Check on definition of a given http response code
function responsecode(){
  /usr/bin/python3 ~/bin/http-response-codes.py | /usr/bin/grep -i $@
}

# Thank you Simon Eskildsen
# https://github.com/sirupsen/dotfiles/blob/master/home/.bash/04_aliases.bash
function tldr() {
  curl "cheat.sh/$@"
}

# Thank you Filipe Kiss
# https://coderwall.com/p/euwpig/a-better-git-log
function gitlog() {
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --abbrev-commit
}

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  
# You may need: 'sudo apt install libnotify-bin'
# Then use like:
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Don't do this alias unless you understand how
# it expands your attack surface.
# It is a hack for some short-lived edge cases where 
# I need to share data with someone on my segment 
# and there are no other convenient options.
alias serv='python3 -m http.server 4321'

# Show where I am hogging drive space
# Thank you Tom Hudson https://github.com/tomnomnom/dotfiles/blob/master/.bashrc
alias biggestdir="du -h --max-depth=1 | sort -h"
# and for 
alias follow="tail -f -n +1"

# FROM: https://github.com/jaesivsm/dotfiles/blob/master/files/bash/bash_aliases
function grepk() {
    grep -ER \
        --binary-files=without-match \
        --exclude-dir=".webassets-cache" \
        --exclude-dir=".git" \
        --exclude-dir="venv" \
        --exclude-dir="build" \
        --exclude-dir="static" \
        --exclude-dir="site-packages" \
        --exclude-dir="gen"  \
        --exclude-dir=".mypy_cache" \
        --exclude-dir="__snapshots__" \
        --exclude-dir="dist" \
        --exclude-dir="cypress" \
        --exclude-dir="node_modules" \
        --exclude="tslint.json" \
        --exclude="*.min.js" \
        --exclude="*.pyc" \
        --exclude="*.swp" \
        --exclude="*~" \
        "$*" .
}
