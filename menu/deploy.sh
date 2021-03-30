#!/bin/bash

HEIGHT=15
WIDTH=90
CHOICE_HEIGHT=13
BACKTITLE="Create user with."
TITLE="c9tui"
MENU="Choose one of the following options:"

OPTIONS=(1 "Systemctl"
		 2 "Docker"
		 3 "< Back")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            sudo bash scripts/c9-maker.sh
            ;;
        2)
			sudo bash menu/dockermenu.sh
            ;;
		3)
			sudo bash run.sh
            ;;
esac
