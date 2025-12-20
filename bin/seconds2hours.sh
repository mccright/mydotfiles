#!/usr/bin/env bash
set -e

# This script converts a number of seconds into days
# hours minutes & seconds in a human-friendly way.

human_readable_time () {

	# Function to produce human readable time
	# Thank you Kevin James.
	# FROM: https://github.com/TheKevJames/tools/blob/master/docker-tuning-primer/root/tuning-primer.sh

	usage="$0 seconds 'variable'"
	if [ -z $1 ] || [ -z $2 ] ; then
		echo $usage
		exit 1
	fi
	days=$(echo "scale=0 ; $1 / 86400" | bc -l)
	remainder=$(echo "scale=0 ; $1 % 86400" | bc -l)
	hours=$(echo "scale=0 ; $remainder / 3600" | bc -l)
	remainder=$(echo "scale=0 ; $remainder % 3600" | bc -l)
	minutes=$(echo "scale=0 ; $remainder / 60" | bc -l)
	seconds=$(echo "scale=0 ; $remainder % 60" | bc -l)
	export $2="$days days $hours hrs $minutes min $seconds sec"
}

# I just added the code below to use the function
# above for another purpose.

confirm_numeric () {
    local arg="$1"

    # Require a non-empty numeric argument (only digits)
    if [[ -z "$arg" || ! "$arg" =~ ^[0-9]+$ ]]; then
        echo "Error: numeric argument required for this function" >&2
        return 1
    fi

    export $2="input_is_numeric"
}


# I just added the code below to use this function for 
# another purpose.

usageA="You must pass the number of seconds.\n$0 <seconds>\n"

# Check for required command line input
if [ -z $1 ] ; then
	printf "$usageA"
	exit 1
fi

# Confirm that input is numeric
myseconds=$1
confirm_numeric $myseconds TESTRESULT 

# If numeric, make it human friendly
if [ $TESTRESULT == input_is_numeric ] ; then
	human_readable_time $myseconds FRIENDLYTIME
	echo "$myseconds seconds == $FRIENDLYTIME"
else
	printf "$usageA"
fi

