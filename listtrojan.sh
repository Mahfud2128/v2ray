#!/bin/bash
clear
a=$(cat /etc/v2ray/usertrojan.txt)

echo -e ">>_+==================+_<<"
echo -e "||     User TROJAN      ||"
echo -e ">>_+==================+_<<"
echo -e "\nUsername Expired"
echo -e "\n$a" | sed 's/#User.*//g; s/#/[>>] /g'
echo -e "Script make by Xans Tech"
