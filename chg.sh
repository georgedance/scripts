#!/bin/sh

# all commands perform similar things, get the output from `acpi`,
#   search for lines starting with `^Battery 0`, get the time remaining,
#   trim the time remaining to display hours and minutes

#chg=$(acpi --battery | grep '^Battery 0' | cut -d, -f3 | awk '{printf $1}' | cut -d':' -f1,2)
#chg=$(acpi --battery | grep '^Battery 0' | cut -d, -f3 | cut -d' ' -f2 | cut -d':' -f1,2)
chg=$(acpi --battery | awk -F, '/^Battery 0/ {printf $3}' | cut -d':' -f1,2)

# check if running in interactive mode
if [[ $- == *i* ]]; then
    # if we are, check if the `$chg` variable is empty
    if [ -n "$chg" ]; then
        # if not empty, print info
        echo $chg chg
    else
        # if empty, print to the user that there's a full charge
        echo full chg
    fi
else
    # check if the laptop is plugged in
    if [ $(cat /sys/class/power_supply/AC/online) -eq 1 ]; then
        # if it is, don't print anything
        echo
    else
        # otherwise, print something
        echo $chg chg
    fi
fi

