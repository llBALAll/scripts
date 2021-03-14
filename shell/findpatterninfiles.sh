#!/bin/bash

# Busca por patterns em arquivos, procurando por padroes de tipos de arquivos conhecidos que nao estejam criptografados.


if [ "$1" = "" ] || [ "$2" != "" ] ; then
        echo
        echo "  Usage: $0 <FileToSearchPattern>"
        echo
        exit 1
else
        hd $1 | grep "00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|" 1>/dev/null
        if [ $? -eq 0 ] ; then
                echo "ELF file"
        fi

        hd $1 | grep "00000000  4d 5a 90 00 03 00 00 00  04 00 00 00 ff ff 00 00  |MZ..............|" 1>/dev/null
        if [ $? -eq 0 ] ; then
                echo "PE file"
        fi

        exit 0
fi
