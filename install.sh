#!/bin/bash

source <(curl -sL https://raw.githubusercontent.com/natxanss/multi-v2ray/master/v2ray.sh)
apt install git
pip install v2ray-util
cd /usr/local/lib/python3.5/dist-packages && rm -R v2ray_util && git clone https://github.com/natxanss/multi-v2ray && cp -r /usr/local/lib/python3.5/dist-packages/multi-v2ray/v2ray_util /usr/local/lib/python3.5/dist-packages && rm -r multi-v2ray
v2ray restart
chmod +x install.sh && ./install.sh && rm install.sh
