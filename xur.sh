#!/bin/sh

# find the xurfinder program, on the path
XUR=$(which xurfinder 2> /dev/null)

# if it can't be found on the path, hard code path
if [ -z $XUR ]; then
    XUR=$(echo ~/bakery/bench/xurfinder/src/xurfinder.py)
fi

# run the script and chain it with a popup script
~/bakery/scripts/wrn.sh "`python $XUR`"

