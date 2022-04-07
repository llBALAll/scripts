#!/bin/bash

if [ -z "$1" ] || [ -n "$2" ]; then
	echo
	echo " Script to enable (IP_FORWARD) and NAT on a specific network interface"
	echo "  Usage: $0 <interface>"
	exit 1
fi

net_ifaces=`ip addr show | grep -i state | tr -d " " | cut -d ":" -f 2`

flag_arg="0"
for i in $net_ifaces; do
	if [ "$1" = "$i" ]; then
		flag_arg="1"
	fi
done

if [ "$flag_arg" = "1" ]; then
	echo "1" > /proc/sys/net/ipv4/ip_forward
	iptables -t nat -A POSTROUTING -o $1 -j MASQUERADE
	exit 0
else
	echo "Interface not found!"
	exit 1
fi
