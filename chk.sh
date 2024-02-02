#!/bin/sh

# could just use `bat=$(cat /sys/class/power_supply/BAT0/capacity)` instead

# run the script to get the `$bat` variable from that script, 
#   and pipe error and output to /dev/null.
. ~/bakery/scripts/bat.sh 2>&1> /dev/null

# if the battery is less than 15 percent, make a popup warning
if [ $bat -lt 15 ]; then . ~/bakery/scripts/wrn.sh "Low Battery" ; fi

