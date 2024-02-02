#!/bin/sh

# get a list of outputs currently connected
outputs=$(xrandr -q | awk '/ connected/ {printf $1 "\n"}')

# loop over each output
for output in $outputs
do
    # make the colour back to normal
    xrandr --output $output --gamma 1:1:1
done

