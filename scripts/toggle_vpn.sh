#!/bin/bash

if [ `systemctl status openvpn@client| awk '/Active/ {print $2}'` == "inactive" ]; then
    sudo systemctl start openvpn@client
else
    sudo systemctl stop openvpn@client
fi

