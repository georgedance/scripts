#!/bin/sh

# this script will display a warning or message of some kind using (g)xmessage

# check if an argument was supplied
if [ -n "$1" ]; then
    # if there was, make that the message
    MSG="$1"
else
    # if no argument was supplied, the message becomes a generic `Warning`
    MSG=$(echo Warning)
fi

# check if gxmessage is present
if [ $(which gxmessage) ]; then
    # if it is, use a dark theme and display the message
    GTK_THEME=Adwaita:dark gxmessage -buttons "$MSG$DISPLAY" -name "$MSG" -title "$MSG" $MSG& \
# if it isn't check if xmessage is present
elif [ $(which xmessage) ]; then
    # if it is, display the message
    xmessage -buttons "$MSG$DISPLAY" -name "$MSG" -title "$MSG" $MSG& \
else
    # if neither are installed, complain
    echo "please install gxmessage or xmessage!"
fi 

