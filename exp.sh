#!/bin/bash

#Tanggal Sekarang
date=$(date +'%d-%m-%Y')
sed -i -e "/.*$date/d" /etc/v2ray/user.txt
sed -i -e "/.*$date/,/$date$/d" /etc/v2ray/config.json
sed -i -e "/.*$date/,/$date$/d" /etc/v2ray/tls.json
