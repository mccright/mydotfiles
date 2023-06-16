# Get the current weather
# Needs: https://github.com/gourlaysama/girouette 
# girouette requires an OpenWeather API key (free for 1 call per second)
# You can sign up for that key at https://openweathermap.org/price
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

# Thank you Jinzhou Zhang
# https://github.com/lotabout/dotfiles/blob/master/.profile
# Bash toolbox.
function path_remove()  { export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`; }
function path_append()  { path_remove $1; export PATH="$PATH:$1"; }
function path_prepend() { export PATH="$1:$PATH"; }

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

# Thank you Mete Balci (https://metebalci.com/)
# https://github.com/metebalci/simplehelpers/blob/master/strip_whitespaces.sh
# removes the line feed ("\n") and space (" ") charactes in stdin
# useful especially for hex data such as keys, certificates
# obviously it does not remove all the whitespaces but it can easily be improved
function strip-whitespaces {
  /usr/bin/tr -d "\n" | /usr/bin/tr -d " "
}

# Thank you Mete Balci (https://metebalci.com/)
# https://github.com/metebalci/simplehelpers/blob/master/todec_tohex.sh
# converts hex to decimal
# tr converts lower case to upper case first, bc accepts upper case only
function todec() {
  uc=`echo $1 | /usr/bin/tr '[:lower:]' '[:upper:]'`
  echo "ibase=16; $uc" | /usr/bin/bc
}

# Thank you Mete Balci (https://metebalci.com/)
# https://github.com/metebalci/simplehelpers/blob/master/todec_tohex.sh
# converts decimal to hex
# tr converts upper case to lower case, just because
function tohex() {
  uc=`echo "obase=16; $1" | /usr/bin/bc`
  /usr/bin/echo $uc | /usr/bin/tr '[:upper:]' '[:lower:]'
}

# 'bc' seems to be available on all the hosts I use.
# This makes using it on the command like easier.
function calc() {
  calcme=$1
  /usr/bin/echo "$calcme" | /usr/bin/bc -l
}

# from: https://github.com/mccright/rand-notes/blob/master/Generate-random-data.md
function randpass(){  < /dev/urandom  tr -dc '_A-Za-z0-9!@#$%^&*,.=+~' | head -c${1:-13};echo;}

# make installs easier 
# thank you https://github.com/saulpw/dotfiles
alias sagi='sudo apt-get install' $1

# a better way to make installs easier
# Thank you Tom Hudson
# https://github.com/tomnomnom/dotfiles/blob/master/ubuntu-install.sh
function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt-get install $1
  else
    echo "Already installed: ${1}"
  fi
}

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands. Use like so: 
#   sleep 10; alert
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


function tarz() {
        [ "$1" != "" ] && tar -czRf $1.tar.gz $1 && echo "$1.tar.gz created successfully!"|| echo "Usage: tarz [folder_or_file]"
}


function extract() { 
    if [ -f $1 ] ; then 
      case $1 in 
        *.tar.bz2)   tar xjf $1     ;; 
        *.tar.gz)    tar xzf $1     ;; 
        *.bz2)       bunzip2 $1     ;; 
        *.rar)       unrar e $1     ;; 
        *.gz)        gunzip $1      ;; 
        *.tar)       tar xf $1      ;; 
        *.tbz2)      tar xjf $1     ;; 
        *.tgz)       tar xzf $1     ;; 
        *.zip)       unzip $1       ;; 
        *.Z)         uncompress $1  ;; 
        *.7z)        7z x $1        ;; 
        *)     echo "'$1' cannot be extracted via extract()" ;; 
         esac 
     else 
         echo "'$1' is not a valid file" 
     fi 
}


