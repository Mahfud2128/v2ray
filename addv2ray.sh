#!/bin/bash

#Script make by Xans Tech
clear
read -p "Username: " user
read -p "Exp: " exp

uuid="$(cat /proc/sys/kernel/random/uuid)"
client='"clients":'
clients='"clients"'
users='"$user"'
id='"id"'
aid='"alterId"'
uuids='"$uuid"'
ler='"'
aids='0'
path="$(grep -oP '(?<="path": ")[^"]*' /etc/v2ray/config.json)"
domain="$(grep -oP '(?<="domain": ")[^"]*' /etc/v2ray/domain.json)"
#sed -i '15s/.*//' /etc/v2ray/config.json
sed -i '24d' /etc/v2ray/config.json
sed -i "s/$client.*/$clients: [\n\t  {\n\t #$user/" /etc/v2ray/config.json
sed -i "s/#$user/#$user\n\t  $aid:   $aids,\n\t    $id: $ler$uuid$ler\n\t  },\n\t #$user\n\t  {/" /etc/v2ray/config.json
sed -i "s/user/$user/" /etc/v2ray/data.json
sed -i "s/uuid/$uuid/" /etc/v2ray/data.json
sed -i "s+pathh+$path+" /etc/v2ray/data.json
sed -i "s/domain/$domain/" /etc/v2ray/data.json
hasil=$(base64 /etc/v2ray/data.json | tr -d "\n")
MYIP=$(wget -qO- ipv4.icanhazip.com)
expp=$(date -d "$exp days" +"%d-%m-%Y")
echo -e "Processing..."
sleep 0.2
clear
echo -e "Success!"
echo -e "||============================||"
echo -e "    Xans Tech Configuration"
echo -e "||============================||"
echo -e "[>>]Username: $user"
echo -e "[>>]Domain: $domain"
echo -e "[>>]IP: $MYIP"
echo -e "[>>]Port: 80"
echo -e "[>>]UUID: $uuid"
echo -e "[>>]AlterId: 0"
echo -e "[>>]Security: Auto"
echo -e "[>>]TLs: None"
echo -e "[>>]Path: $path"
echo -e "[>>]Host: None"
echo -e "[>>]Expired: $expp"
echo -e "||============================||"
echo -e "  Thank For Using Our Service"
echo -e "||============================||"
echo -e "          Link Vmess"
echo -e "||============================||"
echo -e "vmess://$hasil"

#Pengulangan data.json
sed -i "s/$user/user/" /etc/v2ray/data.json
sed -i "s/$uuid/uuid/" /etc/v2ray/data.json
sed -i "s+$path+pathh+" /etc/v2ray/data.json
sed -i "s/$domain/domain/" /etc/v2ray/data.json
service v2ray restart
