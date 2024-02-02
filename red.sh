#!/bin/sh

# get a list of outputs currently connected
outputs=$(xrandr -q | awk '/ connected/ {printf $1 "\n"}')

# loop over each output
for output in $outputs
do
    # make the colour tinted to try remove bluelight
    xrandr --output $output --gamma 1.5:1:0.5
done

