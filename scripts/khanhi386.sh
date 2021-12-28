#! /bin/bash
light_cyan='\033[1;96m' 2> /dev/null
red='\033[1;31m' 2> /dev/null
reset='\033[0m' 2> /dev/null
printf "${light_cyan}"
export isrunning="$rundebian"
export userkhanh="$(whoami)"
unset LD_PRELOAD
clear
. /etc/exagear.conf
installation_dir="/opt/exagear/images/"
ubt=${UBT_OVERRIDE:-"/opt/exagear/bin/$UBT_BINARY"}
userkhanh="$(whoami)"
image_dir=
images_count=0

PATH=${PATH}:/usr/sbin/
function find_guest_image {
    for img in $(find $installation_dir -mindepth 1 -maxdepth 1 -type d) ; do
        image_dir="$img"
        images_count=$(( images_count+1 ))
    done

    if [ $images_count -eq 0 ] ; then
        echo "There are no guest images in $installation_dir"
        echo "Please make sure that you have installed packages with guest system templates."
        exit 1
    fi

    if [ $images_count -gt 1 ] ; then
        echo "You have multiple guest images installed. Use"
        echo "    exagear name_of_guest_image"
        echo "to start the shell in one of them."
        exagear-ls
        exit 1
    fi
}

function print_usage_and_exit {
    echo 'Usage: exagear [image] [ -- command]'
    exagear-ls
    exit 0
}

disable_unknown_ioctls=""
args=""
while test ${#} -gt 0
do
    if [ "$1" == "--usage" ] || [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
        print_usage_and_exit
    elif [ "$1" == "--disable-unknown-ioctls" ] ; then
        disable_unknown_ioctls="--disable-unknown-ioctls"
    elif [ "$1" == "--" ]; then
	shift
        command="$1"
        shift
        break
    else
        if ! [ -z "$image_dir" ]; then
            print_usage_and_exit
        fi

	image_dir="${installation_dir}$1";
	if ! [ -d "$image_dir" ];then
            echo "There is no guest image $image_dir"
            exagear-ls
	    exit 1
	fi
    fi

    shift
done

if [ -z "$image_dir" ]; then
    find_guest_image
fi

if [ -z "$command" ]; then
    if [ -n "$SHELL" ] && [ -x "${image_dir}${SHELL}" ]; then
	command="$SHELL"
    else
        command="/bin/bash"
    fi
else
    command_explicit=1
fi

vpaths_list="$image_dir/.exagear/vpaths-list"
opaths_list="$image_dir/.exagear/opaths-list"

sugid_exec_method=
use_upstart_integration=

UBT_SUGID_WRAPPER=/opt/exagear/bin/ubt-sugid-wrapper

if update-binfmts --display x86_guest 2>/dev/null | grep "enabled" > /dev/null; then
    sugid_exec_method="--use-binfmt_misc"
elif [ -f ${UBT_SUGID_WRAPPER} ] && [ `stat -c "%a" "${UBT_SUGID_WRAPPER}"` == "6755" ] ; then
    sugid_exec_method="--use-sugid-wrapper ${UBT_SUGID_WRAPPER}"
fi

use_upstart_integration="--opaths-list ${opaths_list}"

cd ~
args=`for arg in "$@"; do printf "%q " "$arg"; done`

unset LC_CTYPE
unset LC_NUMERIC
unset LC_TIME
unset LC_COLLATE
unset LC_MONETARY
unset LC_MESSAGES
unset LC_PAPER
unset LC_NAME
unset LC_ADDRESS
unset LC_TELEPHONE
unset LC_MEASUREMENT
unset LC_IDENTIFICATION
unset LC_ALL
unset LANGUAGE
unset LANG
if [ -f ${image_dir}/etc/default/locale ] 
then
	source ${image_dir}/etc/default/locale 2>/dev/null
	export LC_CTYPE
	export LC_NUMERIC
	export LC_TIME
	export LC_COLLATE
	export LC_MONETARY
	export LC_MESSAGES
	export LC_PAPER
	export LC_NAME
	export LC_ADDRESS
	export LC_TELEPHONE
	export LC_MEASUREMENT
	export LC_IDENTIFICATION
	export LC_ALL
	export LANGUAGE
	export LANG
fi

export AXS_DSOUND_SERVER_PORT=${HOME}/.axs-dsound-server
systemctl --user start exagear-dsound-server > /dev/null 2>&1 
if [ -z $command_explicit ]; then
       $ubt --path-prefix $image_dir --vpaths-list $vpaths_list -- \
         /bin/echo "Debian 9 (i386) Started!" && echo "KhanhNguyen9872" && echo "ARCH: i686" && echo "USER=$userkhanh" && echo " Type 'exit' to exit Debian" && echo "" && if [ $isrunning != "" ] 2> /dev/null; then printf "${red}Preparing....\n"; echo "Don't close this window"; echo " You can hide this window to taskbar"; printf "Starting ${application_name}....${reset}\n"; unset isrunning; else unset isrunning && printf "${reset}"; fi || \
         echo "Failed to start Exagear. Please check that file $ubt exists and has executable permission"
fi

eval $ubt --path-prefix $image_dir $disable_unknown_ioctls --vpaths-list $vpaths_list $use_upstart_integration $sugid_exec_method -- \
   $command $args
