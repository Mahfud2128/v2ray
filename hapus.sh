#!/bin/bash
#Script untuk menghapus user SSH & OpenVPN

read -p "Usernzme : " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna
        echo -e "User $Pengguna telah dihapus."
else
        echo -e "User $Pengguna tidak ada."
fi
