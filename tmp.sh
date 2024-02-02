#!/bin/sh

# gets the cpu temperature, can't remember the source

temps=$(sensors | awk '/Core [0-9]*/ {printf "%.1f\n", $3}')

sum=0
count=0
for temp in $temps; do
    sum=$(echo "$sum + $temp" | bc)
    count=$((count+1))
done
average=$(echo "scale=1; $sum / $count" | bc)

# check if running in interactive mode
if [[ $- == *i* ]]; then
    # if it is, print out info
    echo "$average°C tmp"
else
    # if it isn't, check if the tmp is greater than 35.0
    if (( $(echo "$average > 35.0" | bc -l) )); then
        # if it is, print out info
        echo "$average°C tmp"
    else
        # if it isn't, don't print anything
        echo
    fi
fi

