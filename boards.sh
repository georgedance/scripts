#!/bin/sh

# show a popup menu of the websites in bookmarks.txt
website="$(cat ~/bakery/scripts/bookmarks.txt | ~/bakery/bench/dmenu/dmenu -l 5)"

# use lynx to browse that website
lynx $website

