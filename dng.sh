#!/bin/sh

# this script selects a random file from a folder,
#   then uses that for whatever purpose you need.
#   in this case, it plays a selected file with mpv.

# in this case, the ding shouldn't occur if the audio is muted
if [ "$(pactl get-sink-mute 0)" == "Mute: yes" ]; then
    # no op
    echo
# also shouldn't do anything if the volume is 0
elif [ "$(pactl get-sink-volume 0 | awk '/%/ {printf $5}')" == "0%" ]; then
    # no op
    echo
else
    # specify the folder to look thru
    folder="/home/lunarfright/media/audio/dings"

    # `find` lists all of the files in a specified directory itself included.
    # `tail -n +2` removes the first line, which is the directory itself.

    # `wc -l` counts how many files there are.
    count=$(find $folder | tail -n +2 | wc -l)

    # `shuf` shuffles the lines, `tail -n +$count` removes all but one line
    file=$(find $folder | tail -n +2 | shuf | tail -n +$count)

    # the last remaining line is the randomly selected file, 
    #   used for whatever purpose you need.
    mpv $file --no-audio-display --volume=50
fi

