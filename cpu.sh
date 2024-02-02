#!/bin/sh

# i believe this is luke smith's cpu script? could be mental outlaw's, or brodie robertson's

read cpu a b c previdle rest < /proc/stat
prevtotal=$((a+b+c+previdle))
sleep 0.5
read cpu a b c idle rest < /proc/stat
total=$((a+b+c+idle))
cpu=$(( 100 * ( (total - prevtotal) - (idle - previdle) ) / (total - prevtotal) ))
echo $cpu% cpu

