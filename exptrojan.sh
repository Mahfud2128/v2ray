#!/bin/bash

#Tanggal Sekarang
date=$(date +'%d-%m-%Y')
sed -i -e "/.*$date/d" /etc/v2ray/usertrojan.txt
sed -i -e "/.*$date/,/$date$/d" /etc/v2ray/trojan.json
systemctl restart trojan
