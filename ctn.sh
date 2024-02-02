#!/bin/sh

# old version
#iwctl station list | grep wlan | xargs | cut -d" " -f3 | cut -c1,2,3

# asks iwctl for connections, finds wlan state, takes first 3 characters
iwctl station list | awk '/wlan/ {printf $3}' | cut -c1,2,3

