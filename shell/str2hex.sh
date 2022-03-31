#!/bin/bash

scriptname=`echo $0 | sed 's/\//\/\n/g' | tail -n 1`

if [ -z "$1" ] || [ -n "$2" ]; then
        echo 
        echo "Script to print hexadecimal bytes of ascii string"
        echo "  Usage: $scriptname "string""
        echo
        exit 1
fi

echo -ne $1 | od -t c -t x1
