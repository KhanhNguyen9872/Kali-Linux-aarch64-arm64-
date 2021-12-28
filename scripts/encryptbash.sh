#!/bin/bash
##KhanhNguyen9872
if [ "$#" == "0" ]; then
    echo "encryptbash [bash_file]"
    echo ""
    echo "Example: encryptbash filebash.sh"
    echo ""
    echo "Script created by KhanhNguyen9872"
    exit 1
fi
shc="/usr/bin/shc" 2> /dev/null
shc1="/usr/local/bin/shc" 2> /dev/null
if [[ $# -ge 2 ]] 2> /dev/null; then
    echo "  Too many argument"
    exit 1
fi
if [ -f $shc ] 2> /dev/null; then
    shc -f "$1"
    mv "$1" ${1}.old 2> /dev/null
    mv "${1}.x" "$1" 2> /dev/null
    rm -f "${1}.x.c" 2> /dev/null
    chmod 777 "${1}" 2> /dev/null
    if [ -f "${1}.old" ]; then
        echo "Old script is: ${1}.old"
        exit 0
    else
        echo "Failed!"
        exit 0
    fi
else
    if [ -f $shc1 ] 2> /dev/null; then
        shc -f "$1"
        mv "$1" ${1}.old 2> /dev/null
        mv "${1}.x" "$1" 2> /dev/null
        rm -f "${1}.x.c" 2> /dev/null
        chmod 777 "${1}" 2> /dev/null
        if [ -f "${1}.old" ]; then
            echo "Old script is: ${1}.old"
            exit 0
        else
            echo "Failed!"
            exit 0
        fi
    else
        echo "Package required is not found!"
    fi
fi
