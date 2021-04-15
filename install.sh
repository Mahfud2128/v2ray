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
rm /etc/v2ray/config.json
cd /etc/v2ray && wget https://raw.githubusercontent.com/natxanss/v2ray/main/data.json
cd /etc/v2ray && wget https://raw.githubusercontent.com/natxanss/v2ray/main/domain.txt
cd /etc/v2ray && wget https://raw.githubusercontent.com/natxanss/v2ray/main/user.txt
#Set Config
uuid=$(cat /proc/sys/kernel/random/uuid)
cat> /etc/v2ray/config.json << END
{
  "log": {
    "access": "/var/log/v2ray/access.log",
    "loglevel": "info",
    "error": "/var/log/v2ray/error.log"
  },
  "outbounds": [
    {
      "settings": {},
      "protocol": "freedom"
    },
    {
      "settings": {},
      "tag": "blocked",
      "protocol": "blackhole"
    }
  ],
  "inbounds": [
    {
      "protocol": "vmess",
      "port": 80,
      "settings": {
        "clients": [
         #default
          {
            "alterId": 0,
            "id": "${uuid}"
          }
        ]
      },
      "streamSettings": {
        "kcpSettings": {},
        "quicSettings": {},
        "network": "ws",
        "security": "none",
        "httpSettings": {},
        "wsSettings": {
          "path": "/v2xans/",
          "headers": {
            "Host": "$domain"
          }
        },
        "tcpSettings": {},
        "tlsSettings": {}
      }
    }
  ],
  "routing": {
    "rules": [
      {
        "outboundTag": "blocked",
        "ip": [
          "0.0.0.0/8",
          "10.0.0.0/8",
          "100.64.0.0/10",
          "169.254.0.0/16",
          "172.16.0.0/12",
          "192.0.0.0/24",
          "192.0.2.0/24",
          "192.168.0.0/16",
          "198.18.0.0/15",
          "198.51.100.0/24",
          "203.0.113.0/24",
          "::1/128",
          "fc00::/7",
          "fe80::/10"
        ],
        "type": "field"
      }
    ]
  }
}
END
#Ubah Domain
var='"Host"'
ler='"'

sed -i "s/dom/$domain/" /etc/v2ray/domain.txt
sed -i "s/$var.*/$var: $ler$domain$ler/" /etc/v2ray/config.json

#Download Command
wget -O /usr/bin/addv2ray "https://raw.githubusercontent.com/natxanss/v2ray/main/addv2ray.sh"
wget -O /usr/bin/listv2ray "https://raw.githubusercontent.com/natxanss/v2ray/main/listv2ray.sh"
wget -O /usr/bin/exp "https://raw.githubusercontent.com/natxanss/v2ray/main/exp.sh"
wget -O /usr/bin/menu "https://raw.githubusercontent.com/natxanss/v2ray/main/menu.sh"
wget -O /usr/bin/delv2ray "https://raw.githubusercontent.com/natxanss/v2ray/main/delv2ray.sh"

curl ipinfo.io >> /etc/datadiri.conf

#Membuat Command bisa digunakan
chmod +x /usr/bin/addv2ray
chmod +x /usr/bin/listv2ray
chmod +x /usr/bin/exp
chmod +x /usr/bin/menu
chmod +x /usr/bin/delv2ray

#Membuat script berjalan di cronjob
echo "59 23 * * * root /usr/bin/exp" >> /etc/crontab

systemctl disable v2ray && systemctl enable v2ray && systemctl restart v2ray

printf '\n#Screenfetch\nif [ -f /usr/bin/menu ]; then clear && menu; fi' >> /root/.bashrc

#Startup
clear
echo -e "Starting System"
sleep 0.8
echo -e "Done!"
clear
menu
