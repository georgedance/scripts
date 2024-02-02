#!/bin/sh

# infinite loop, intended to be canceled with `control + c`
while true; do
        # clear the screen
	clear
        # get the time with `date`
	printf " $(date +"%I:%M:%S") "
        # wait one second
	sleep 1s
done

