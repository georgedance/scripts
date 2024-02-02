#!/bin/sh

# stupid script cuz i'm lazy

ssh=$1
sshkey=$(ls ~/.ssh/$ssh)
sshkeypass=$(cat ~/.ssh/$ssh.txt)

# show passphrase
echo [PASS] $sshkeypass

# start ssh-agent in background
eval "$(ssh-agent -s)"

# add ssh privkey to ssh-agent
ssh-add $sshkey

# clear to wipe password
clear

# ssh into machine
#ssh $ssh

