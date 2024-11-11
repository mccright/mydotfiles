# Get the current weather
# FROM: https://github.com/mccright/weather-in-terminal
# Depends on a config file in ~/.config/weather-in-terminal/weather.ini (or
# other location, which you will specify on the command line)
if [ -x ~/bin/weather.py ] && [ -x "~/.config/weather-in-terminal/weather.ini" ]; then
        alias weatherp='/usr/bin/python3 ~/bin/weather.py -f ~/.config/weather-in-terminal/weather.ini'
fi

# Get the current weather
# Thank you Antoine Gourlay https://github.com/gourlaysama/girouette 
# girouette requires an OpenWeather API key (free for 1 call per second)
# You can sign up for that key at https://openweathermap.org/price
# Depends on a config file in ~/.config/girouette/config.yml
if [ -x ~/bin/girouette ]; then
        alias weather='/usr/bin/echo `~/bin/girouette`'
fi

# Run the `todo` script.
# Depends on a data file ~/.config/todo/.todo-list.json (or
# other location, which you will specify on the command line)
if [ -x ~/bin/todo.py ]; then
        alias todo='/usr/bin/python3 ~/bin/todo.py $*'
fi

# See which Python file I was last working on...
# Scan recursively under home directory and identify the last modified Python file
# thank you Corey Goldberg for the guts of this alias
# I remove any files having "site-packages" in the path to avoid junk in virtual environments 
# https://github.com/cgoldberg/dotfiles/blob/master/.bash_aliases
alias lasteditpy="find '${HOME}' -type f -name '*.py' -printf '%T@ %p\n' | grep -v "site-packages" | sort --numeric --stable --key=1 | tail -n 1 | cut -d' ' -f2"

# Show last 25 modified files in your home dir (recursive)
# Thank you Corey Goldberg for the guts of this alias
# I remove any files "site-packages" & ".cache" in the path to avoid more junk 
# https://github.com/cgoldberg/dotfiles/blob/master/.bash_aliases
alias latest="find . -type f -printf '%TY-%Tm-%Td %TR %p\n' 2>/dev/null | grep -v -E '(.git|site-packages|.cache|virtualenv)' | sort -n | tail -n 25 | sort -n -r"

#!/bin/sh
# SUMMARY: Describe the current OS
# I may visit a lot of different hosts throughout any given day.
# The OS running on some of those hosts is managed by others.
# Putting this in my .bashrc/.bash_aliases helps remind me of some 
# important characteristics of the current server.
function whatos() {
SHORT_DISTRIB_DESC=$(lsb_release -s -d)
CODE_NAME=$(lsb_release -c | awk '{print $2}')
AVAILABLE_MEM=$(cat /proc/meminfo | grep -i memavailable | awk '{print $2}')
#
printf "Current OS: %s '%s' (%s %s %s) - %sK mem avail\n" "$SHORT_DISTRIB_DESC" "$CODE_NAME" "$(uname -o)" "$(uname -r)" "$(uname -m)" "$AVAILABLE_MEM"
}

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

# https://github.com/cgoldberg/sniff/
# This is a minor enhancement to 'sniff' by Corey Goldberg
# thank you Corey Goldberg
# Added minor edits to the 'if' check, curl cmd, and config file
# Enhanced the location of the config file to fit my normal setup
# Pass the target URL in quotes.
function sniff {
if [[ $? -ne 0 ]]; then
    echo "no URL specified!"
    exit 1
elif [ -x /usr/bin/curl ] && [ -x "~/.config/sniff/sniff_output_format.cfg" ]; then
    echo "Failed. curl or the sniff_output_format.cfg file or both are missing"
    exit 1
else
    export SNIFFCONFIG="@${HOME}/.config/sniff/sniff_output_format.cfg"
    curl -L --max-redirs 16 -D "headers" --styled-output -e "https://duckduckgo.com/" -sS --compressed -o /dev/null -w $SNIFFCONFIG "$1"
fi
}

# go back to previous directory
# thank you Corey Goldberg
# https://github.com/cgoldberg/dotfiles/blob/master/.bash_aliases
alias bk="cd ${OLDPWD}"

# extract a tarball
# thank you Corey Goldberg
# https://github.com/cgoldberg/dotfiles/blob/master/.bash_aliases
alias untar="tar zxvf "

# list dirs/files in tree format
# thank you Corey Goldberg, this has been very helpful
# https://github.com/cgoldberg/dotfiles/blob/master/.bash_aliases
alias tree="tree -ash -CF --du"

# grep recursively with case-insensitive match and other defaults
# thank you Corey Goldberg for the core of this, 
# with some added 'excludes' it has been very helpful
# https://github.com/cgoldberg/dotfiles/blob/master/.bash_aliases
alias rgrep="rgrep \
        --binary-files=without-match \
        --color=auto \
        --devices=skip \
        --ignore-case \
        --line-number \
        --no-messages \
        --with-filename \
        --exclude-dir=.cache \
        --exclude-dir=.git \
        --exclude-dir=.tox \
		--exclude-dir=site-packages \
		--exclude-dir=.mozilla \
		--exclude-dir=npm \
		--exclude-dir=.npm \
		--exclude-dir=node_modules 
        --exclude-dir=".mypy_cache" \
        --exclude-dir="__snapshots__" \
        --exclude-dir="dist" \
        --exclude-dir="cypress" \
        --exclude="tslint.json" \
        --exclude="*.min.js" \
        --exclude="*.pyc" \
        --exclude="*.swp" \
        --exclude=*.css \
        --exclude=*.js \
        --exclude=*.svg"
alias rg="rgrep"



# purge thumbnail cache
# thank you Corey Goldberg
# https://github.com/cgoldberg/dotfiles/blob/master/.bash_aliases
alias purge-thumbs="rm -rf ${HOME}/.cache/thumbnails"

# count installed system packages
alias countpackages="dpkg -l | grep '^ii' | wc -l"

# make yourself look busy and fancy --> to non-technical people
# thank you Corey Goldberg
# https://github.com/cgoldberg/dotfiles/blob/master/.bash_aliases
alias busy="cat /dev/urandom | hexdump -C | grep --color=always 'ca fe'"

# 3 ways to print your 'external'/Internet-visable IP address
alias wanip='dig +short myip.opendns.com @resolver1.opendns.com' 

alias externalip='curl https://ipinfo.io/ip; echo "";'
# also need my local IP address sometimes
alias localip="hostname -I"

function myexternalip() { 
    curl https://ipinfo.io/ip;
    echo "";
}

# show TCP and UDP sockets that are actively listening
# thank you Corey Goldberg, this has been very helpful
# https://github.com/cgoldberg/dotfiles/blob/master/.bash_aliases
alias listening="sudo netstat --listening --program --symbolic --tcp --udp"

# serve current directory over HTTP on port 8080
# thank you Corey Goldberg
# https://github.com/cgoldberg/dotfiles/blob/master/.bash_aliases
alias webserver="python3 -m http.server 8080"


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
# removes the line feed ("\n"), space (" "), tab ("\t"), vertical tab ("\v"), 
# form feed ("\f") and carriage return ("\r") charactes in stdin.  It is 
# useful especially for hex data such as keys, certificates.
# It does not remove all the whitespace, but works for my typical use cases.
# See: https://en.wikipedia.org/wiki/Whitespace_character for enhancement ideas
function strip-whitespaces {
  /usr/bin/tr -d "\n" | /usr/bin/tr -d " " | /usr/bin/tr -d "\t" | /usr/bin/tr -d "\v" | /usr/bin/tr -d "\f" | /usr/bin/tr -d "\r"
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


# Still testing this approach
# Thank you Corey Goldberg
# activate Python 3.x virtual environment in ./venv (create fresh one if needed)
venv3 () {
    local dir="venv"
    local pyversion="Python 3.x"
    if [[ ! -d ./${dir} ]]; then
        echo "creating ${pyversion} virtual environment in ./${dir}"
        python3 -m venv "${dir}"
    fi
    echo "activating ${pyversion} virtual environment in ./${dir}"
    source ./${dir}/bin/activate
}

# Still testing this approach
# Thank you Corey Goldberg
# search command history by regex (case-insensitive) show last n matches
# usage: hist <pattern>
hist () {
    local n="50"
    history | grep -i --color=always "$1" | tail -n "$n"
}

# Still working on this approach
# Thank you Corey Goldberg
# open a browser and search with Google
google () {
    python -c "import webbrowser; webbrowser.open('https://www.google.com/search?q=${1}')" > /dev/null 2>&1
}
alias goog="google"


# Still working on this approach
# Replaced OS code name string with something dynamic 
# Thank you Corey Goldberg
# open a browser and go to the Ubuntu Packages page for the given package name
pkg-info () {
	python3 -c "import webbrowser; webbrowser.open('https://packages.ubuntu.com/$(/usr/bin/lsb_release -c | /usr/bin/awk '{print $2}')/${1}')" > /dev/null 2>&1
}


#  ¯\_(ツ)_/¯
# Used in screen-sharing/presentation contexts  
# Thank you Corey Goldberg
alias shrug="echo -n '¯\_(ツ)_/¯'"


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# These three WSL functions are not portable...
# but I use them a lot, so I include them here.  
# I have to edit the file system data 
# in each function below for each of my endpoints.
# 
# Move current directory to my Files directory on WSL
function files() { cd /mnt/c/Files; }
# Move current directory to my documents on WSL
function docs() { cd /mnt/c/Files/my-docs; }
# Move current directory to my github repos on WSL
function github() { cd /mnt/c/Files/dev/github; }

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


# search recursively under current directory for filenames matching pattern (case-insensitive)
findfiles () {
    find . -xdev \
           -iname "*$1*" \
           ! -path "./.git/*" \
           ! -path "./.tox/*" \
           ! -path "./.vscode-server/*" \
           ! -path "./.cache/*" \
           ! -path "./.dotnet/*" \
           ! -path "./.local/*" \
           ! -path "./env/*" \
           ! -path "./ENV/*" |
           grep -i --color=always "$1"
}
alias ff="findfiles"

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


