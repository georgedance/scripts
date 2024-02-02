#!/bin/sh

# This script is for Intel GPUs, or at least my integrated GPU;
# Intel Corporation Alder Lake-UP3 GT2 [Iris Xe Graphics] (rev 0c)

# Commands to check GPU;
# `lspci | grep VGA | cut -d':' -f3 | xargs`
# `echo $(lspci | awk -F':' '{printf $3}')`

# Assume MHz for values unless specified otherwise



# Direct Rendering Manager (DRM) linux kernel subsystem directory for the GPU
dir="/sys/class/drm/card1"

# (apparently) minimum clock speed
min=$(cat $dir/gt_min_freq_mhz)
# maximum clock speed
max=$(cat $dir/gt_max_freq_mhz)
# current clock speed (may be over time?);
#   there is `$dir/gt_act_freq_mhz` which may be the "act"ual MHz
cur=$(cat $dir/gt_cur_freq_mhz)

# meanings of RP0, RP1, and RPn from;
# https://unix.stackexchange.com/questions/404049/how-to-stop-intel-hd4000-from-running-at-max-clock-speed

# supported boost clock speed
rp0=$(cat $dir/gt_RP0_freq_mhz)
# supported max clock speed
# it seems as though rp1 is the minimum clock speed (on my machine)
rp1=$(cat $dir/gt_RP1_freq_mhz)
# supported min clock speed
rpn=$(cat $dir/gt_RPn_freq_mhz)



# Simple readout, it's just current over maximum
out="$cur/${max}MHz gpu"

# bash block comment. if you want to uncomment the block,
#   comment out the `: << 'EOF'` line and the `EOF` line further below.
#   this will have the effect of making the output a percentage reading
#: << 'EOF'

# if you divide the current value by the maximum, 
#   you should get a result from 0-1, if you then multiply that by 100, 
#   you should get a percentage representing how high the GPU's clock speed is

gpu=$(echo "($((cur - rp1)) / $((max - rp1))) * 100" | bc -l)
# trim off decimal places
gpu=$(printf "%.0f" $gpu)

# calculated percentage readout
out="$gpu% gpu"

#EOF



# check if shell is running in interactive mode
if [[ $- == *i* ]]; then
    # if it is, display the output
    echo $out
else
    # if it's not, check what the usage is
    # check if the usage is nothing, don't print anything
    if [ $((cur - rp1)) -eq 0 ]; then
        echo
    else
        # otherwise print the output
        echo $out
    fi
fi

