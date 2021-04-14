#!/bin/bash
clear
a=$(cat /etc/v2ray/user.txt | tr -s '#' '[>>]' | tr -d '#Username'

echo -e "$a"
