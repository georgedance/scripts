#!/bin/sh

# bash block comment. if you want to uncomment the block,
#   comment out the `: << 'EOF'` line and the `EOF` line further below.
# this comment is an explanation of how the old version worked.
#   similar prinicples apply to the current one
: << 'EOF'
# gets ip info, finds ipv4, ignores localhost, extracts address
ip a            | # gets ip info
grep "inet "    | # finds ipv4 addresses, not ipv6
grep -v 127     | # ignores localhost
cut -d" " -f6   | # cuts out ip address
cut -d/ -f1       # removes slash and trailing characters
EOF

# gets ip info, ignores localhost, extracts address, removes slash
ip -4 -o a | grep -v 127 | cut -d" " -f7 | cut -d/ -f1

