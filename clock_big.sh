#!/bin/sh

# infinite loop, intended to be canceled with `control + c`
while true; do
        # clear the screen
	clear
        # get the time with `date`, pipe to figlet to enlarge
	printf " $(date +"%I:%M:%S %p") " | figlet -k
        # wait one second
	sleep 1s
done

