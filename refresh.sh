#!/bin/sh

# a simple script that will repeat the first supplied argument

# check if a command was supplied
if [ -n "$1" ]; then
    # if it was, repeat it every 1 second
    while true; do $1; sleep 120; done;
else
    # if there wasn't anything, complain
    echo "You need to supply a command to repeat!"
fi

