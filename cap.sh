#!/bin/sh

# directory to battery
bat="/sys/class/power_supply/BAT0"

# current charge capacity of the battery
cur=$(cat $bat/energy_full)
# the initial charge capacity of the battery
max=$(cat $bat/energy_full_design)

# calculate a percentage
cap=$(echo "($cur / $max) * 100" | bc -l)
# format to 2 decimal places and a percent symbol
cap="`printf %.2f $cap`%"

# print information
echo $cap cap
