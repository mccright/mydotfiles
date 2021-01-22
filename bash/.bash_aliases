
# 
refreshsystem() {
  vim +PlugUpdate +qall
  sudo apt update
  sudo apt upgrade -y
}

# Thank you Simon Eskildsen
# https://github.com/sirupsen/dotfiles/blob/master/home/.bash/04_aliases.bash
tldr() {
  curl "cheat.sh/$@"
}

