#!/bin/bash
dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "📆 %s" "$(date "+%a %d-%m-%y %T")"
    else
        printf "DAT %s" "$(date "+%a %d-%m-%y %T")"
    fi
    printf "%s\n" "$SEP2"
}

dwm_date
