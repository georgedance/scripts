#!/bin/sh

# counts how many files and folders (including hidden ones) are in your home directory
jnk=$(ls -A ~ | wc -l)

echo $jnk jnk

