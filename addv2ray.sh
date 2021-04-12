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
#domain="$(grep -oP '(?<="domain": ")[^"]*' /etc/v2ray/domain.json)"
domain="$(cat /etc/v2ray/domain.txt)"

MYIP=$(wget -qO- ipv4.icanhazip.com)
expp=$(date -d "$exp days" +"%d-%m-%Y")

#sed -i '25d' /etc/v2ray/config.json
sed -i "s/#default.*/#default\n\t #$user $expp\n\t  {$aid: $aids, $id: $ler$uuid$ler},\n\t #$user $expp/" /etc/v2ray/config.json
sed -i "s/user/$user/" /etc/v2ray/data.json
sed -i "s/uuid/$uuid/" /etc/v2ray/data.json
sed -i "s+pathh+$path+" /etc/v2ray/data.json
sed -i "s/domain/$domain/" /etc/v2ray/data.json

hasil=$(base64 /etc/v2ray/data.json | tr -d "\n")

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
echo -e "  Thanks For Using Our Service"
echo -e "||============================||"
echo -e "           Link Vmess"
echo -e "||============================||"
echo -e “”
echo -e "vmess://$hasil"

#Pengulangan data.json
sed -i "s/$user/user/" /etc/v2ray/data.json
sed -i "s/$uuid/uuid/" /etc/v2ray/data.json
sed -i "s+$path+pathh+" /etc/v2ray/data.json
sed -i "s/$domain/domain/" /etc/v2ray/data.json

#Penambahan user v2ray
sed -i "s/#Username/#$user $expp\n#Username/" /etc/v2ray/user.txt

systemctl disable v2ray && systemctl enable v2ray && systemctl start v2ray
