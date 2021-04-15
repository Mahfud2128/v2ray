#!/bin/bash
clear
listv2ray
echo -e "Masukan Username yang ingin dihapus"
read -p "Username: " user

if grep -qc "$user" /etc/v2ray/config.json
then
        sed -i -e "/#$user.*/,/$user.*$/d" /etc/v2ray/config.json
        sed -i -e "/#$user.*/d" /etc/v2ray/user.txt
        systemctl restart v2ray
        listv2ray
        echo ""
        echo -e "User Berhasil Dihapus!"
else
        echo ""
        echo -e "User tidak ada!"
        systemctl restart v2ray
        exit
fi
