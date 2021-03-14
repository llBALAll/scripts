#!/bin/bash

# Funcao: Modificar os enderecos dos servidor DNS utilizados pelo sistema
# Metodologia: Sobrescreve o arquivo /etc/resolv.conf com os enderecos dos DNS servers passados como parametro

if [ "$1" = "" ] && [ "$2" = "" ] ; then
        echo "Passe um DNS server como parametro:"
        echo "  Ex: dns_changer.sh 8.8.8.8"
        exit 1
else
        printf "nameserver $1\nnameserver $2\n" > /etc/resolv.conf
        exit 0
fi
