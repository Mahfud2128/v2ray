#!/bin/bash
#V2RAY PREMIUM SCRIPT BY XANS TECH STORE

#Install Variable
echo -e "Pastikan domain sudah dipersiapkan untuk vmess"
read -p "Domain: " domain

#Checking Dependencies
apt-get install git
apt-get install wget
apt-get install uuid

#Make installation for v2ray
#Thanks to Jhrory
source <(curl -sL https://multi.netlify.app/v2ray.sh)
pathh="$(cat /etc/v2ray/path.txt)"

#Ubah Config bawaan
cd /etc/v2ray && rm config.json && wget https://raw.githubusercontent.com/natxanss/v2ray/main/config.json
cd /etc/v2ray && wget https://raw.githubusercontent.com/natxanss/v2ray/main/data.json
cd /etc/v2ray && wget https://raw.githubusercontent.com/natxanss/v2ray/main/domain.txt
cd /etc/v2ray && wget https://raw.githubusercontent.com/natxanss/v2ray/main/user.txt

#Ubah Domain
var='"Host"'
ler='"'

sed -i "s/dom/$domain/" /etc/v2ray/domain.txt
sed -i "s/$var.*/$var: $ler$domain$ler/" /etc/v2ray/config.json

#Download Command
wget -O /usr/bin/addv2ray "https://raw.githubusercontent.com/natxanss/v2ray/main/addv2ray.sh"
wget -O /usr/bin/listv2ray "https://raw.githubusercontent.com/natxanss/v2ray/main/listv2ray.sh"

systemctl restart v2ray
