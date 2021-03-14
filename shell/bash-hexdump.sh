#!/bin/bash

# Este script faz o mesmo que: hd FILE

# bash-hexdump
# by Dennis Williamson - 2010-01-04
# in response to http://stackoverflow.com/questions/2003803/show-hexadecimal-numbers-of-a-file
# usage: bash-hexdump file

if [[ -z "$1" ]]
then
    exec 3<&0                           # read stdin
    [[ -p /dev/stdin ]] || tty="yes"    # no pipe
else
    exec 3<"$1"            # read file
fi

# if the script name contains "stream" then output will be continuous hex digits
# like hexdump -ve '1/1 "%.2x"'
[[ $0 =~ stream ]] && nostream=false || nostream=true

saveIFS="$IFS"
IFS=""                     # disables interpretation of \t, \n and space
saveLANG="$LANG"
LANG=C                     # allows characters > 0x7F
bytecount=0
valcount=0
$nostream && printf "%08x  " $bytecount
while read -s -u 3 -d '' -r -n 1 char    # -d '' allows newlines, -r allows \
do
    ((bytecount++))
    printf -v val "%02x" "'$char"    # see below for the ' trick
    [[ "$tty" == "yes" && "$val" == "04" ]] && break    # exit on ^D
    echo -n "$val"
    $nostream && echo -n " "
    ((valcount++))
    if [[ "$val" < 20 || "$val" > 7e ]]
    then
        string+="."                  # show unprintable characters as a dot
    else
        string+=$char
    fi
    if $nostream && (( bytecount % 8 == 0 ))      # add a space down the middle
    then
        echo -n " "
    fi
    if (( bytecount % 16 == 0 ))   # print 16 values per line
    then
        $nostream && echo "|$string|"
        string=''
        valcount=0
        $nostream && printf "%08x  " $bytecount
    fi
done

if [[ "$string" != "" ]]            # if the last line wasn't full, pad it out
then
    length=${#string}
    if (( length > 7 ))
    then
        ((length--))
    fi
    (( length += (16 - valcount) * 3 + 4))
    $nostream && printf "%${length}s\n" "|$string|"
    $nostream && printf "%08x  " $bytecount
fi
$nostream && echo

LANG="$saveLANG";
IFS="$saveIFS"
