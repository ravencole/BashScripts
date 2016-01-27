#!/bin/bash

RESETCOLOR='\033[0m'

((!$#)) && echo -e "\033[4;31mNO ARGUMENTS WERE PASSED" && exit 1

style="0"
foreGroundColor=0
color=0

while getopts "biuf:c:s:" opt; do
    case $opt in
        b)
            style="${style} 1"
            ;;
        c)
            color=$OPTARG
            ;;
        f)
            foreGroundColor=$OPTARG
            ;;
        i)
            style="${style} 7"
            ;;
        u) 
            style="${style} 4"
            ;;
        \?)
            echo "not an option"
            return 1
            ;;
    esac
done

shift $(( OPTIND  -1 ))

colorizedMessage="\033["

for i in $style; do
    colorizedMessage="${colorizedMessage};$i"
done

if [ $foreGroundColor -gt 0 ]; then
    colorizedMessage="${colorizedMessage};${foreGroundColor}"
fi

if [ $color -gt 0 ]; then
    colorizedMessage="${colorizedMessage};${color}"
fi

colorizedMessage="${colorizedMessage}m$1${RESETCOLOR}"

echo -e $colorizedMessage































