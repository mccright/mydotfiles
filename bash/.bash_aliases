# Get the current weather
# Depends on a config file in ~/.config/girouette/config.yml
if [ -x ~/bin/girouette ]; then
        alias weather='~/bin/girouette'
fi

#
updateos() {
sudo apt-get update && sudo apt-get -y upgrade
}

# 
refreshsystem() {
  vim +PlugUpdate +qall
  sudo apt update
  sudo apt upgrade -y
}

# Check on definition of a given http response code
responsecode(){
  /usr/bin/python3 ~/bin/http-response-codes.py | /usr/bin/grep -i $@
}

# Thank you Simon Eskildsen
# https://github.com/sirupsen/dotfiles/blob/master/home/.bash/04_aliases.bash
tldr() {
  curl "cheat.sh/$@"
}

# Thank you Filipe Kiss
# https://coderwall.com/p/euwpig/a-better-git-log
gitlog() {
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
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Show where I am hogging drive space
# Thank you Tom Hudson https://github.com/tomnomnom/dotfiles/blob/master/.bashrc
alias biggestdir="du -h --max-depth=1 | sort -h"
# and for 
alias follow="tail -f -n +1"

