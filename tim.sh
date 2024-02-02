#!/bin/sh

# prints out the time with the format `HH:MM *M`,
#   where * is A or P, depending on the time of day, e.g. `AM` or `PM`
date +'%I:%M %p'

