#!/bin/bash
clear
a=$(cat /etc/v2ray/user.txt)

echo -e ">>_+==================+_<<"
echo -e "||      User V2Ray      ||"
echo -e ">>_+==================+_<<"
echo -e "\nUsername Expired"
echo -e "\n$a" | sed 's/#User.*//g; s/#/[>>] /g'
echo -e "Script make by Xans Tech"
