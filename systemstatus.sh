#!/bin/sh

# this script displays a whole lot of information like dwmblocks

ctn=$(. ~/bakery/scripts/ctn.sh)
tmp=$(. ~/bakery/scripts/tmp.sh)
ram=$(. ~/bakery/scripts/ram.sh)
bat=$(. ~/bakery/scripts/bat.sh)
chg=$(. ~/bakery/scripts/chg.sh)
dte=$(. ~/bakery/scripts/dte.sh)
tim=$(. ~/bakery/scripts/tim.sh)
# putting cpu last because it waits and is blocking other commands from going through
cpu=$(. ~/bakery/scripts/cpu.sh)

#echo "${ctn}"
echo " ${cpu} ${tmp} | ${ram} | ${bat} ${chg} | ${dte}, ${tim}"

