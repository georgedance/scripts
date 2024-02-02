#!/bin/sh

# reads the current level of the fan
fan=$(cat /proc/acpi/ibm/fan | awk '/^level/ {printf $2}')

# prints it out
echo $fan fan

