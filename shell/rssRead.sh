#!/bin/bash

# Script to read rss feed
# It was made/tested in mintty/cygwin/git-bash, windows7

testArgs () {
    if [ -z "$1" ] || [[ $1 = @(--help|-|) ]] || [ -n "$3" ]; then
        echo
        echo "  Usage: $0 <ELEMENTS> <URL_RSSFEED_XML>"
        echo
        echo "    ex: $0 https://news.google.com/rss"
        echo "    obs: hold <ctrl> + <left mouse click> to open link on default browser"
        echo "    <ELEMENTS> :optional number(sum) of items to show"
        echo "      1: title (default)"
        echo "      2: title, link"
        echo "      3: title, link, pubDate"
        echo "      4: title, link, pubDate, source_url"
        echo "      5: title, link, pubDate, source_url, description"
        echo "      6: title, link, pubDate, source_url, description , content"
        echo
        exit 1
    fi
}

foundBIN=0

# find for curl & wget
testBin () {
    local curlBIN=0
    local wgetBIN=0

    # if found curl binary set foundBIN and close function
    [[ `which curl > /dev/null 2>&1 ; echo $?` -eq 0 ]] && foundBIN="curl" && return
    # if found wget binary set foundBIN and close function
    [[ `which wget > /dev/null 2>&1 ; echo $?` -eq 0 ]] && foundBIN="wget" && return

    echo "> commands \"curl\" and \"wget\" not found!"
    exit 1
}

# get http on input rss url and parse content to show on terminal
getRSS(){
    local rssResp=0

    # if the user input arg <ELEMENTS> use curl/wget on $2 else use on $1
    if [ $# -gt 1 ]; then
        [[ $foundBIN == "curl" ]] && rssResp=$($foundBIN -s -L "$2") || rssResp=$($foundBIN "$2" -q -O -)
    else
        [[ $foundBIN == "curl" ]] && rssResp=$($foundBIN -s -L "$1") || rssResp=$($foundBIN "$1" -q -O -)
    fi

    echo
    echo "[RSS Feed]"
    
    # parse content by items groups for optmize performance
    vTITLE_ALL=`echo "$rssResp" | sed "s/<title>/\n<title>/g" | grep -o -P '(?<=<title>).*(?=</title>)' | sed -E "s/<\!\[CDATA\[//g" | sed -E "s/\]\]>//g"`
    vLINKS_ALL=`echo "$rssResp" | sed "s/<link>/\n<link>/g" | grep -o -P '(?<=<link>).*(?=</link>)'`
    vIDS_ALL=`echo "$rssResp" | sed "s/<id>/\n<id>/g" | grep -o -P '(?<=<id>).*(?=</id>)'`
    vUPDATEDS_ALL=`echo "$rssResp" | sed "s/<updated>/\n<updated>/g" | grep -o -P '(?<=<updated>).*(?=</updated>)'`
    vPUBDATES_ALL=`echo "$rssResp" | sed "s/<pubDate>/\n<pubDate>/g" | grep -o -P '(?<=<pubDate>).*(?=</pubDate>)'`
    vSOURCES_ALL=`echo "$rssResp" | sed "s/<source url=/\n<source url=/g" | grep -o -P '(?<=<source url=).*(?=</source>)'`
    vDESCS_ALL=`echo "$rssResp" | sed "s/<description>/\n<description>/g" | grep -o -P '(?<=<description>).*(?=</description>)'`
    vCOMMENTS_ALL=`echo "$rssResp" | sed "s/<comments>/\n<comments>/g" | grep -o -P '(?<=<comments>).*(?=</comments>)'`
    vCONTENT_ALL=`echo "$rssResp" | sed "s/<content:encoded>/\n<content:encoded>/g" | grep "<content:encoded>" | sed -E "s/<content:encoded>//g" | sed -E "s/<\!\[CDATA\[//g" | sed -E "s/<br\/>//g"`

    # parse and print content about rss channel
    vTITLEC=`echo "$vTITLE_ALL" | head -n 1`
    vLINK=`echo "$vLINKS_ALL" | head -n 1`
    [[ -n "$vTITLEC" ]] && [[ -n "$vLINK" ]] && echo -e "\e]8;;${vLINK}\a${vTITLEC}\e]8;;\a"

    # [[ -n "$vLINK" ]] && echo " $vLINK"
    
    vID=`echo "$vIDS_ALL" | head -n 1`
    [[ -n "$vID" ]] && echo " $vID"
    
    vLBDC=`echo "$rssResp" | sed "s/<lastBuildDate>/\n<lastBuildDate>/g" | grep -o -P '(?<=<lastBuildDate>).*(?=</lastBuildDate>)' | head -n 1`
    [[ -n "$vLBDC" ]] && echo " $vLBDC"
    
    vUPDATED=`echo "$vUPDATEDS_ALL" | head -n 1`
    [[ -n "$vUPDATED" ]] && echo " $vUPDATED"

    # parse number of ITEMS in rss channel response
    rssCOUNT=`echo "$vTITLE_ALL" | wc -l`
    
    echo

    # parse and print content about each item found in rss channel response
    for (( i=2; i <= rssCOUNT; i++ )) do
        v_i=$(($i-1))

        vTITLE=`echo "$vTITLE_ALL" | head -n $i | tail -1`
        vLINK=`echo "$vLINKS_ALL" | head -n $i | tail -1`
        [[ -n "$vTITLE" ]] && [[ -n "$vLINK" ]] && echo -e " - \e]8;;${vLINK}\a${vTITLE}\e]8;;\a"
        # echo " - $vTITLE"

        # if the user input arg <ELEMENTS>
        if [ $# -gt 1 ]; then
            if [ $1 -ge 2 ]; then
                vLINK=`echo "$vLINKS_ALL" | head -n $i | tail -1`
                [[ -n "$vLINK" ]] && echo "        $vLINK"
                
                vID=`echo "$vIDS_ALL" | head -n $i | tail -1`
                [[ -n "$vID" ]] && echo "        $vID"
            fi

            if [ $1 -ge 3 ]; then
                vPUBDATE=`echo "$vPUBDATES_ALL" | head -n ${v_i} | tail -1`
                [[ -n "$vPUBDATE" ]] && echo "        $vPUBDATE"

                vUPDATED=`echo "$vUPDATEDS_ALL" | head -n ${v_i} | tail -1`
                [[ -n "$vUPDATED" ]] && echo "        $vUPDATED"
            fi

            if [ $1 -ge 4 ]; then
                vSOURCE=`echo "$vSOURCES_ALL" | head -n $i | tail -1`
                [[ -n "$vSOURCE" ]] && echo "        $vSOURCE"
            fi

            if [ $1 -ge 5 ]; then
                vDESC=`echo "$vDESCS_ALL" | head -n $i | tail -1`
                [[ -n "$vDESC" ]] && echo "        $vDESC"

                vCOMMENTS=`echo "$vCOMMENTS_ALL" | head -n $i | tail -1`
                [[ -n "$vCOMMENTS" ]] && echo "        $vCOMMENTS"
            fi

            if [ $1 -ge 6 ]; then
                vCONTENT=`echo "$vCONTENT_ALL" | head -n $i | tail -1`
                [[ -n "$vCONTENT" ]] && echo "        $vCONTENT"
            fi

            # print new line between items
            echo
        fi

    done
    echo
}

testArgs "$@"

testBin

getRSS "$@"
