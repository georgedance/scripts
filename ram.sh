#!/bin/sh

# counts how much ram you're using
ram=$(free -h | awk '/^Mem/ {printf $3 "/" $2}')
echo $ram ram

