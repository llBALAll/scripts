#!/bin/bash
# script to list network interfaces

#ifconfig -a | grep  -i mtu | cut -d ":" -f 1

ip link show | grep -i mtu | cut -d " " -f 2 | tr -d ":"
