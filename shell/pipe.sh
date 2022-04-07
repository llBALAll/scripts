#!/bin/bash

if [ ! -p /dev/stdin ] || [ -z "$1" ]; then
        echo
        echo " Script to redirect a command output to another command that dont accept pipe input"
        echo "  Usage: command1 | $0 command2"
        echo "  ex: cat hosts_list.txt | ./pipe.sh ping -c1 | grep \"from\""
        echo
        exit 1
fi

while read line ; do
#       echo $line
#       echo "$line"
        echo $* "$line"

#       $* $line
        $* "$line"
done
