#!/bin/bash
clear
read -p "Username : " Login
read -p "Password : " Pass
read -p "Exp : " masaaktif

IP=`curl icanhazip.com`
domain="$(grep -oP '(?<="Host": ")[^"]*' /etc/v2ray/config.json)"
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "Processing..."
sleep 0.2
clear
echo -e "Success!"
echo -e "=========================="
echo -e "Xans Tech Configuration"
echo -e "=========================="
echo -e "Username : $Login "
echo -e "Password : $Pass"
echo -e "=========================="
echo -e "IP       : $IP"
echo -e "Host     : $domain"
echo -e "Expired  : $exp"
echo -e "=========================="
echo -e "Service Port"
echo -e "=========================="
echo -e "SSH      : 22"
echo -e "Dropbear : 143,109"
echo -e "SSL      : 442"
echo -e "Squid    : 3128,8080" 
echo -e "badvpn   : 7100,7200,7300"
echo -e "========================="
echo -e "OpenVPN Service"
echo -e "========================="
echo -e "TCP 1194 : http://$IP:81/client-tcp-1194.ovpn"
echo -e "UDP 2200 : http://$IP:81/client-udp-2200.ovpn"
echo -e "SSL 992  : http://$IP:81/client-tcp-ssl.ovpn"
echo -e "========================="
echo -e ""
echo -e "Premium Script Make by XansTech"
