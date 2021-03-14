#!/bin/bash

#Este script serve pra printar uma string de caracteres ascii em hexadecimal

if [ "$1" = "" ] || [ "$2" != "" ] ; then
        echo
        echo "  Usage: $0 "StringToPrintHex""
        echo
        exit 1
else

        echo $1 | od -t c -t x1

fi
