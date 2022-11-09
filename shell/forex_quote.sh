#!/bin/bash

if [ -z "$1" ] || [[ -z "$2" ]] || [ -n "$3" ]; then
        echo
        echo " Script to get forex quotes at (finance.yahoo.com;investing.com) and print"
        echo "  Usage: $0 <currency> <currency>"
        echo "  ex: $0 EUR USD"
        echo
        exit 1
fi

input1=$(echo "$1" | tr '[:upper:]' '[:lower:]')
input2=$(echo "$2" | tr '[:upper:]' '[:lower:]')

var1="$input1""$input2"
var2="$input1""-""$input2"

while true ; do
#    vtemp1=$(curl -L -s "https://finance.yahoo.com/quote/usdbrl=X?ltr=1" | grep -oP "(?<=active=\"\">).*?(?=</fin-streamer)" | head -n 1)
    vtemp1=$(curl -L -s "https://finance.yahoo.com/quote/$var1=X?ltr=1" | grep -oP "(?<=active=\"\">).*?(?=</fin-streamer)" | head -n 1)
#    vtemp2=$(curl -L -s "https://www.investing.com/currencies/usd-brl" | sed "s/<div/\n<div/g" | grep "data-test=\"instrument-price-last\">" | grep -oP "(?<=instrument-price-last\">).*?(?=</span)")
    vtemp2=$(curl -L -s "https://www.investing.com/currencies/$var2" | sed "s/<div/\n<div/g" | grep "data-test=\"instrument-price-last\">" | grep -oP "(?<=instrument-price-last\">).*?(?=</span)")
    echo "yahoo:" $vtemp1 "-" "investing:" $vtemp2
    #sleep 1
done
