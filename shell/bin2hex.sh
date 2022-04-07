#!/bin/bash

if [ -z "$1" ] || [ -n "$2" ]; then
        echo
        echo " Script to print file content in hexadecimal bytes"
        echo "  Usage: $0 <file>"
        echo
        exit 1
fi

xxd -p $1 | tr -d '\n'
