#!/bin/sh

# a small script to change the speed of the fan. intended for thinkpads
# Usage: fanspeed [level]
# levels go from 0 (off) to 8 (max regulated speed), and auto (recommended)

# you might be able to get away with something like;
# `sudo echo level $1 > /proc/acpi/ibm/fan`

echo level $1 | sudo tee /proc/acpi/ibm/fan

