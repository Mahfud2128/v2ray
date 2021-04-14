#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
                echo "You need to run this script as root"
                exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
                echo "OpenVZ is not supported"
                exit 1
fi
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- icanhazip.com);


mkdir /var/lib/premium-script;
echo "Enter the VPS Subdomain Hostname, if not available, please click Enter"
#read -p "Hostname: " host
#echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
#install ssh ovpn
wget http://juki.my.id/script/crotahh.sh
wget http://juki.my.id/script/vpn/sstp.sh
#installwg
wget http://juki.my.id/script/vpn/wg.sh
#install ssr
wget http://juki.my.id/script/vpn/ssr.sh
wget http://juki.my.id/script/vpn/sodosok.sh
#install v2ray
wget http://juki.my.id/script/v2ray/ins-vt.sh && chmod +x ins-vt.sh && sed -i -e 's/\r$//' ins-vt.sh
#install L2TP
wget http://juki.my.id/script/vpn/ipsec.sh

#rm -f /root/crotahh.sh
#rm -f /root/sstp.sh
#rm -f /root/wg.sh
#rm -f /root/sodosok.sh
#rm -f /root/ssr.sh
#rm -f /root/ins-vt.sh
#rm -f /root/go.sh
#rm -f /root/ipsec.sh
#history -c
#echo "1.1" > /home/ver
clear
echo " "
echo "Installation has been completed!!"
echo " "
echo "=================================-Autoscript Premium-===========================" | tee -a log-install.txt
echo "" | tee -a log-install.txt
echo "--------------------------------------------------------------------------------" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - OpenVPN                 : TCP 1194, UDP 2200, SSL 442"  | tee -a log-install.txt
echo "   - Stunnel4                : 443, 777"  | tee -a log-install.txt
echo "   - Dropbear                : 109, 143"  | tee -a log-install.txt
echo "   - Squid Proxy             : 3128, 8080 (limit to IP Server)"  | tee -a log-install.txt
echo "   - Badvpn                  : 7100, 7200, 7300"  | tee -a log-install.txt
echo "   - Nginx                   : 81"  | tee -a log-install.txt
echo "   - Wireguard               : 7070"  | tee -a log-install.txt
echo "   - L2TP/IPSEC VPN          : 1701"  | tee -a log-install.txt
echo "   - PPTP VPN                : 1732"  | tee -a log-install.txt
echo "   - SSTP VPN                : 444"  | tee -a log-install.txt
echo "   - Shadowsocks-R           : 1443-1543"  | tee -a log-install.txt
echo "   - SS-OBFS TLS             : 2443-2543"  | tee -a log-install.txt
echo "   - SS-OBFS HTTP            : 3443-3453"  | tee -a log-install.txt
echo "   - V2RAY Vmess TLS         : 8443"  | tee -a log-install.txt
echo "   - V2RAY Vmess None TLS    : 80"  | tee -a log-install.txt
echo "   - Trojan                  : 445"  | tee -a log-install.txt
#echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On 00.00 GMT +7" | tee -a log-install.txt
echo "   - Installation Log --> /root/log-install.txt"  | tee -a log-install.txt
#echo ""  | tee -a log-install.txt
echo "------------------ Auto Installer By XansTech -----------------" | tee -a log-install.txt
echo ""
echo "Auto Reboot 15 Sec"
