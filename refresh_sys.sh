#!/bin/sh

cl

# refreshes the system status script every second
while true; do . ~/bakery/scripts/systemstatus.sh; sleep 1; done;

