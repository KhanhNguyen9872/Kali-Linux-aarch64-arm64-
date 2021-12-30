#!/usr/bin/bash
light_cyan='\033[1;96m' 2> /dev/null
red='\033[1;31m' 2> /dev/null
userkhanh="$(whoami)"
export themekhanh=1
echo ""
printf "${red} If you want install package, start Root user!\n\n"
printf "${light_cyan} Choose User to start Debian 9:\n"
echo " 1. User ($userkhanh)"
echo " 2. Root"
echo ""
read -p "Your choose: " anykey
if [[ $anykey -eq 1 ]] 2> /dev/null; then
    khanhi386
    unset themekhanh
else
    if [[ $anykey -eq 2 ]] 2> /dev/null; then
        echo ""
        echo "================"
        printf "\n${red} Please type your Root Password \n${light_cyan}"
        sudo khanhi386
        unset themekhanh
    else
        printf "${red}\n Error!\n"
        unset themekhanh
        read -p "Press Enter to exit!" anykey
    fi
fi
exit
