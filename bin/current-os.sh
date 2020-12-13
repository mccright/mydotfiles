#!/bin/sh
# SUMMARY: Describe the current OS
# OUTPUT EXAMPLE: 
# Current OS: Ubuntu 20.04.1 LTS 'focal' (GNU/Linux 5.4.0-58-generic x86_64)
# WHY: I visit a lot of different hosts throughout any given day.
# The OS running on many of those hosts are managed by others.
# Putting this in my .bashrc helps remind me of an important 
# characteristic of the current server upon login.
# HOW: In my case, I add the following (uncomment the .bashrc code):
# # What OS is running?
# if [ -f ~/bin/current-os.sh ]; then
#     . ~/bin/current-os.sh
# fi
#
SHORT_DISTRIB_DESC=$(lsb_release -s -d)
CODE_NAME=$(lsb_release -c | awk '{print $2}')
AVAILABLE_MEM=$(cat /proc/meminfo | grep -i memavailable | awk '{print $2}')
#
# printf "Current OS: %s \'%s\' (%s %s %s)\n" "$SHORT_DISTRIB_DESC" "$CODE_NAME" "$(uname -o)" "$(uname -r)" "$(uname -m)"
# Appended available memory
printf "Current OS: %s \'%s\' (%s %s %s) - %sK mem avail\n" "$SHORT_DISTRIB_DESC" "$CODE_NAME" "$(uname -o)" "$(uname -r)" "$(uname -m)" "$AVAILABLE_MEM"
