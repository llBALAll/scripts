#!/bin/bash

# Este script printa o conteudo de um arquivo binario em hex

if [ "$1" = "" ] || [ "$2" != "" ] ; then
        echo
        echo "  Usage: $0 <FileToPrintBytes>"
        echo
        exit 1
else
        xxd -p $1 | tr -d '\n'
fi

echo
