#!/bin/bash

RESETCOLOR='\033[0m'

FBLACK=30
FRED=31
FGREEN=32
FYELLOW=33
FBLUE=34
FPURPLE=35
FCYAN=36
FWHITE=37

BBLACK=40
BRED=41
BGREEN=42
BYELLOW=43
BBLUE=44
BPURPLE=45
BCYAN=46
BWHITE=47


((!$#)) && echo -e "\033[4;31mNO ARGUMENTS WERE PASSED" && exit 1

style="0"

while getopts "biuf:c:s:x" opt; do
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
        x)
            highlighterColor=true
            ;;
        i)
            style="${style} 7"
            ;;
        u) 
            style="${style} 4"
            ;;
        \?)
            echo "not an option"
            ;;
    esac
done

shift $(( OPTIND  -1 ))

colorizedMessage="\033[0"

for i in $style; do
    if [ $i -gt 0 ]; then
        colorizedMessage="${colorizedMessage};$i"    
    fi
done

if [[ $color ]]; then
    if [[ $color =~ ^-?[0-9]+$ ]]; then
        if [[ $highlighterColor ]]; then
            color=$[$color + 60]
        fi
        colorizedMessage="${colorizedMessage};${color}"
    else
        case $color in
            black)
                colorizedMessage="${colorizedMessage};${BBLACK}"
                ;;
            red)
                colorizedMessage="${colorizedMessage};${BRED}"
                ;;
            green)
                colorizedMessage="${colorizedMessage};${BGREEN}"
                ;;
            yellow)
                colorizedMessage="${colorizedMessage};${BYELLOW}"
                ;;
            blue)
                colorizedMessage="${colorizedMessage};${BBLUE}"
                ;;
            purple)
                colorizedMessage="${colorizedMessage};${BPURPLE}"
                ;;
            cyan)
                colorizedMessage="${colorizedMessage};${BCYAN}"
                ;;
            white)
                colorizedMessage="${colorizedMessage};${BWHITE}"
                ;;
            *)
                echo -e "\033[4;31m\"${color}\" not found in list of usable colors"
                exit 1
        esac
    fi
fi

if [[ $foreGroundColor ]]; then
    if [[ $foreGroundColor =~ ^-?[0-9]+$ ]]; then
        if [[ $highlighterColor ]]; then
            foreGroundColor=$[$foreGroundColor + 60]
        fi
        colorizedMessage="${colorizedMessage};${foreGroundColor}"
    else
        case $foreGroundColor in
            black)
                colorizedMessage="${colorizedMessage};${FBLACK}"
                ;;
            red)
                colorizedMessage="${colorizedMessage};${FRED}"
                ;;
            green)
                colorizedMessage="${colorizedMessage};${FGREEN}"
                ;;
            yellow)
                colorizedMessage="${colorizedMessage};${FYELLOW}"
                ;;
            blue)
                colorizedMessage="${colorizedMessage};${FBLUE}"
                ;;
            purple)
                colorizedMessage="${colorizedMessage};${FPURPLE}"
                ;;
            cyan)
                colorizedMessage="${colorizedMessage};${FCYAN}"
                ;;
            white)
                colorizedMessage="${colorizedMessage};${FWHITE}"
                ;;
            *)
                echo -e "\033[4;31m\"${foreGroundColor}\" not found in list of usable colors"
                exit 1
        esac
    fi
fi

colorizedMessage="${colorizedMessage}m$1${RESETCOLOR}"

echo -e $colorizedMessage































