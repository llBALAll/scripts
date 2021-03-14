#!/bin/bash

echo "1" > /proc/sys/net/ipv4/ip_forward	# Habilita no kernel o roteamento de pacotes entre as subredes


###############################################################
####        CONFIGURACAO DAS REGRAS DO FIREWALL            ####
###############################################################

# Comandos p/ limpar todas as regras setadas, caso existam.
iptables -t filter -F
iptables -t filter -X
iptables -t nat -F
iptables -t nat -X

# Politica p/ dropar todos os pacotes com destino ao servidor
iptables -t filter -P INPUT DROP
# Politica p/ dropar todos os pacotes que tentam passar pelo servidor
iptables -t filter -P FORWARD DROP

##############################################################################################
#    Regras p/ permitir a recepcao de pacotes com destino final o servidor (chain INPUT).    #

iptables -t filter -A INPUT -p tcp --dport 22 -j ACCEPT		# aceita pacotes com protocolo tcp e porta destino 22
iptables -t filter -A INPUT -p icmp -j ACCEPT			# aceita pacotes com protocolo ICMP
iptables -t filter -A INPUT -p udp --sport 53 -j ACCEPT		# aceita pacotes com protocolo e porta padrao de servidor DNS
iptables -t filter -A INPUT -p tcp --sport 80 -j ACCEPT		# aceita pacotes com protocolo e portas WEB http 80
iptables -t filter -A INPUT -p tcp --sport 443 -j ACCEPT	# aceita pacotes com protocolo e portas WEB https 443

#####################################################################################
#    Regras p/ permitir o envio de pacotes originados no servidor (chain OUTPUT)    #

iptables -t filter -A OUTPUT -p udp --dport 53 -j ACCEPT        # permite o envio de pacotes com protocolo e porta padrao de servidor DNS
#iptables -t filter -A OUTPUT -p udp --sport 53 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 80 -j ACCEPT        # permite o envio de pacotes com protocolo e porta padrao da WEB http 80
#iptables -t filter -A OUTPUT -p tcp --sport 80 -j ACCEPT
iptables -t filter -A OUTPUT -p tcp --dport 443 -j ACCEPT	# permite o envio de pacotes com protocolo e porta padrao da WEB https 443
#iptables -t filter -A OUTPUT -p tcp --sport 443 -j ACCEPT

#########################################################################################
#    Regras p/ permitir o roteamento de pacotes atraves do servidor (chain FORWARD).    #

iptables -t filter -A FORWARD -p icmp -j ACCEPT			# permite o roteamento de ICMP pelo servidor
iptables -t filter -A FORWARD -p tcp --dport 80 -j ACCEPT	# permite o roteamento de pacotes com protocolo e porta destino padrao WEB http 80
iptables -t filter -A FORWARD -p tcp --sport 80 -j ACCEPT	# permite o roteamento de pacotes com protocolo e porta origem padrao WEB http 80
iptables -t filter -A FORWARD -p tcp --dport 443 -j ACCEPT	# permite o roteamento de pacotes com protocolo e porta destino padrao WEB https 443
iptables -t filter -A FORWARD -p tcp --sport 443 -j ACCEPT	# permite o roteamento de pacotes com protocolo e porta origem padrao WEB http 443
iptables -t filter -A FORWARD -s 192.168.10.0/24 -d 192.168.20.0/24 -j ACCEPT	# permite o roteamento de pacotes da subrede 192.168.10.0 p/ a subrede 192.168.20.0
iptables -t filter -A FORWARD -s 192.168.20.0/24 -d 192.168.10.0/24 -j ACCEPT	# permite o roteamento de pacotes da subrede 192.168.20.0 p/ a subrede 192.168.10.0
iptables -t filter -A FORWARD -p udp --dport 53 -j ACCEPT	# permite o roteamento de pacotes com protocolo e porta destino padrao de servidores DNS
iptables -t filter -A FORWARD -p udp --sport 53 -j ACCEPT	# permite o roteamento de pacotes com protocolo e porta origemo padrao de servidores DNS

###########################################################################################


iptables -t nat -A POSTROUTING -o ens33 -j MASQUERADE           # Regra p/ permitir o roteamento de pacotes das subredes p/ WAN(internet)
