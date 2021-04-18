#!/bin/bash
clear
listv2ray
echo -e "Masukan Username yang ingin dihapus (Tanpa -XTC)"
read -p "Username: " user

if grep -qc "${user}-XTC" /etc/v2ray/config.json
then
        sed -i -e "/#${user}-XTC.*/,/#${user}-XTC.*$/d" /etc/v2ray/trojan.json
        sed -i -e "/#${user}-XTC.*/d" /etc/v2ray/usertrojan.txt
        systemctl restart trojan
        listtrojan
        echo ""
        echo -e "User Berhasil Dihapus!"
else
        echo ""
        echo -e "User tidak ada!"
        systemctl restart trojan
        exit
fi
