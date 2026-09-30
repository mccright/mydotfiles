#!/bin/bash
### Script Name - terminal_colors.sh
### Common color codes - include them in other scripts.
# This list started with one I noticed in: 
# https://github.com/TheKevJames/tools/blob/master/docker-tuning-primer/root/tuning-primer.sh
# and I only built out the broader spectrum
# later I saw:  
# https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
# https://stackoverflow.com/questions/4842424/list-of-ansi-color-escape-sequences
# ## Font Effects  
# |Code  | Effect | Note | 
# |38 | Set foreground color | Next arguments are 5;<n> or 2;<r>;<g>;<b>, see below |
# |48 | Set background color | Next arguments are 5;<n> or 2;<r>;<g>;<b>, see below |
# |
# |
# Now we are living in the future, and the full RGB spectrum is available using:
# \033[38;2;<r>;<g>;<b>m     #Select RGB foreground color
# \033[48;2;<r>;<g>;<b>m     #Select RGB background color
#
# Test with: "echo -e "\033[38;2;68;108;207mTextMessage\033[0m"
# https://github.com/mccright/rand-notes/blob/master/colors_865.md?plain=1
# https://github.com/mccright/rand-notes/blob/master/colors_20.md?plain=1
# | RGB | HEX | English |
# |:-----------:|:-------:|:------------|
# | 190;189;127 | #BEBD7F | Green beige |
# | 194;176;120 | #C2B078 | Beige |
# | 198;166;100 | #C6A664 | Sand yellow |
# | 229;190;001 | #E5BE01 | Signal yellow |
# | 205;164;052 | #CDA434 | Golden yellow |
# | 169;131;007 | #A98307 | Honey yellow |
# | 228;160;016 | #E4A010 | Maize yellow |
# | 220;156;000 | #DC9D00 | Daffodil yellow |
# | 138;102;066 | #8A6642 | Brown beige |
# | 199;180;070 | #C7B446 | Lemon yellow |
# | 234;230;202 | #EAE6CA | Oyster white |
# | 225;204;079 | #E1CC4F | Ivory |
# | 230;214;144 | #E6D690 | Light ivory |
# | 237;255;033 | #EDFF21 | Sulfur yellow |
# | 245;208;051 | #F5D033 | Saffron yellow |
# | 248;243;053 | #F8F32B | Zinc yellow |
# | 158;151;100 | #9E9764 | Grey beige |
# | 153;153;080 | #999950 | Olive yellow |
# | 250;210;001 | #FAD201 | Traffic yellow |
 

# Example below
export normal='\033[0m'
export black='\033[30m'
export boldblack='\033[1;0m'
export gray='\033[90m'
export graybg='\033[100m'
export lightgray='\033[37m'
export lightgraybg='\033[47m'
export white='\033[37m'
export boldwhite='\033[1;37m'
export red='\033[31m'
export redbg='\033[41m'
export lightred='\033[91m'
export lightredbg='\033[101m'
export boldred='\033[1;31m'
export green='\033[32m'
export greenbg='\033[42m'
export lightgreen='\033[92m'
export lightgreenbg='\033[102m'
export boldgreen='\033[1;32m'
export yellow='\033[33m'
export lightyellow='\033[93m'
export boldyellow='\033[1;33m'
export yellowbg='\033[43m'
export lightyellowbg='\033[103m'
export blue='\033[34m'
export bluebg='\033[44m'
export boldblue='\033[1;34m'
export lightblue='\033[94m'
export lightbluebg='\033[104m'
export magenta='\033[35m'
export boldmagenta='\033[1;35m'
export cyan='\033[36m'
export cyanbg='\033[46m'
export lightcyan='\033[96m'
export lightcyanbg='\033[106m'
export boldcyan='\033[1;36m'
