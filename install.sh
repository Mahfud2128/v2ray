#!/bin/bash

source <(curl -sL https://raw.githubusercontent.com/natxanss/multi-v2ray/master/v2ray.sh)
apt install git
pip uninstall v2ray-utils
cd /usr/local/lib/python3.5/dist-packages && git clone https://github.com/natxanss/multi-v2ray/tree/master/v2ray_util
v2ray restart
