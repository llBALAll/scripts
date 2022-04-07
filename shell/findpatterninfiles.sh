#!/bin/bash

if [ -z "$1" ] || [ -n "$2" ]; then
        echo
        echo "Script to search for pattern bytes in a file to match file type by default headers;"
        echo "  Usage: $0 <file>"
        echo
        exit 1
fi

# hexdump -C $1 | grep "00000000  7f 45 4c 46 02 01 01 00  00 00 00 00 00 00 00 00  |.ELF............|" 1>/dev/null
xxd -p -c 16 -l 16 $1 | grep "7f454c46020101000000000000000000" 1>/dev/null
if [ $? -eq 0 ] ; then echo "ELF file"; fi

# hexdump -C $1 | grep "00000000  4d 5a 90 00 03 00 00 00  04 00 00 00 ff ff 00 00  |MZ..............|" 1>/dev/null
xxd -p -c 16 -l 16 $1 | grep "4d5a90000300000004000000ffff0000" 1>/dev/null
if [ $? -eq 0 ] ; then echo "PE file"; fi

exit 0
