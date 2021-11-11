red='\033[1;31m'
green='\033[1;32m'
yellow='\033[1;33m'
blue='\033[1;34m'
light_cyan='\033[1;96m'
reset='\033[0m'
clear
cd
cd ..
khanh=usr/bin/khanh
if [ -f $khanh ]; then
	left=4
	khanh1="$(grep '' './usr/bin/khanh')"
	while [[ $left -eq 4 ]] || [[ $left -eq 3 ]] || [[ $left -eq 2 ]] || [[ $left -eq 1 ]]; do
		clear
		if [[ $wrong -eq 1 ]]; then
			printf "\n ${red} - Wrong Password! $left attempts left! ${reset}\n\n"
		fi
		if [[ $left -eq 0 ]]; then
			clear
			printf "\n\n ${red} - Wrong Password! Exit! ${reset}\n\n"
			exit
		fi
		printf "${light_cyan}\n   Type your Password! ${reset}\n\n"
		read -p "Password: " anykey
		if [[ $anykey -eq $khanh1 ]] 2> /dev/null || [ $anykey = $khanh1 ] 2> /dev/null; then
			printf "\n ${yellow} - PASS! ${reset}\n"
			newpass=1
			cd
			break
		else
			wrong=1
			left=$((left-1))
		fi
	done
	if [[ $left -eq 0 ]]; then
		clear
		printf "\n\n ${red} - Wrong Password! Exit! ${reset}\n\n"
		exit
	fi
fi
termux-wake-lock
clear
