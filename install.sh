#!/bin/bash

source <(curl -sL https://raw.githubusercontent.com/natxanss/multi-v2ray/master/v2ray.sh)
apt install git
pip install v2ray-util
cd /usr/local/lib/python3.5/dist-packages && rm -R v2ray_util && git clone https://github.com/natxanss/multi-v2ray/tree/master/v2ray_util
v2ray restart
