#!/bin/bash

scriptname=`echo $0 | sed 's/\//\/\n/g' | tail -n 1`

if [ -z "$1" ] || [ -n "$2" ]; then
        echo
        echo "Script to print file content in hexadecimal bytes"
        echo "  Usage: $scriptname <file>"
        echo
        exit 1
fi

xxd -p $1 | tr -d '\n'
