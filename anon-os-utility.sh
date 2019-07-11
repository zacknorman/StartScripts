#!/bin/bash
echo "$(tput setaf 6)!!THIS SCRIPT HAS ELEMENTS FROM THE PARROT AI SCRIPT!!$(tput sgr0)"
show_menu(){
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "$(tput setaf 3)Welcome to the Anon OS Utility [made by zaCC]$(tput sgr0)"
    echo -e "\t\trev 0.1 07/20/2016"
    echo -e "${MENU}**${NUMBER} 1)${MENU} Full Install [codename: kali-bleeding-edge] ${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    echo -e "$(tput setaf 5) MORE FEATURES COMING SOON...$(tput sgr0)"
    read opt
}
function option_picked() {
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE=${@:-"${RESET}Error: Try again"}
    echo -e "${COLOR}${MESSAGE}${RESET}"
}
function core_install() {
	echo -e "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
        echo -e "deb http://http.kali.org/kali kali-bleeding-edge contrib non-free main" >> /etc/apt/sources.list

	apt-get update
	gpg --keyserver pgpkeys.mit.edu --recv-key ED444FF07D8D0BF6
        gpg -a --export ED444FF07D8D0BF6 | apt-key add -
	apt-get update
}

function init_function() {
clear
show_menu
while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
        	option_picked "Let's do this, then!";
		core_install;
		option_picked "it worked, try ' apt install setoolkit -t kali-bleeding-edge'!";
        	exit;
        ;;
         x)exit;
        ;;

	q)exit;
	;;

        \n)exit;
        ;;

        *)clear;
        option_picked "Invalid keypress";
        show_menu;
        ;;
    esac
fi
done
}
if [ `whoami` == "root" ]; then
	init_function;
else
	echo "$(tput setaf 1)ERROR:$(tput sgr0)U need root l0l"
	exit 1
fi
echo "Finishing up, making things pretty"

sleep 5 
echo "Thanks for using my script, Kali and Bleeding Edge repos have been installed! You may use $(tput setaf 3) sudo apt-get install -t kali-bleeding-edge [packagename] $(tput sgr0)to install from Bleeding-Edge."
