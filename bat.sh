#!/bin/sh

# old version
#bat=`acpi --battery | awk '/^Battery 0/ {printf $4}' | cut -d, -f1`

bat=$(cat /sys/class/power_supply/BAT0/capacity)

# check if running in interactive mode
if [[ $- == *i* ]]; then
    # if it is, print out info
    echo $bat% bat
else
    # if it isn't, check if the battery level is lesser than 75
    if [ $bat -lt 75 ]; then
        # if it is, print out info
        echo $bat% bat
    else
        # if it isn't, don't print anything
        echo
    fi
fi

