#!/bin/sh

# gets the current volume
vol=$(pactl get-sink-volume 0 | awk '/%/ {print $5}')

# check if the sink is muted
if [ "$(pactl get-sink-mute 0)" == "Mute: yes" ]; then
    # if it is, don't do anything
    echo
else
    # otherwise, print out the volume
    echo "$vol vol"
fi

