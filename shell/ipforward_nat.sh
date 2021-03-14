#!/bin/bash

# Esse script habilita o roteamento entre subredes (IP_FORWARD) e o NAT na interface WAN(internet)


if [ "$1" = "" ] || [ "$2" != "" ]; then
	echo "Passe a interface WAN como argumento 1"
	echo "  ex: ./ipforward_nat.sh eth0"
	exit 1
else
	net_ifaces=`ip addr show | grep -i state | tr -d " " | cut -d ":" -f 2`	# variavel que contem todas as interfaces de rede da maquina

	flag_argumento="0"
	for i in $net_ifaces; do	# loop p/ varrer a variavel que contem todas as interfaces de rede da maquina
		if [ "$1" = "$i" ]; then	# testa de o argumento passado pelo usuario corresponde a alguma interface de rede da maquina
			flag_argumento="1"	# flag_argumento para detectar se o argumento passado pelo usuario corresponde a alguma interface de rede valida
		fi
	done
	
	if [ "$flag_argumento" = "1" ]; then	# caso o usuario tenha passado um a interface valida como argumento para o script
		echo "1" > /proc/sys/net/ipv4/ip_forward	# habilita o roteamento de pacotes entre subredes
		iptables -t nat -A POSTROUTING -o $1 -j MASQUERADE	# habilita o NAT na interface WAN passada como argumento
		exit 0
	else
		echo "Interface WAN na encontrada!"
		echo "(P/ listar as interfaces de rede use: ip addr show)"
		exit 1
	fi
fi