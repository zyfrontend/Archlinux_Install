#!/bin/bash

dwm_backlight () {
    printf "%sā %.0f%s\n" "$SEP1" "$(light)" "$SEP2"
}
dwm_alsa () {
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$VOL" -eq 0 ]; then
            printf "š"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "š %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "š %s%%" "$VOL"
        else
            printf "š %s%%" "$VOL"
        fi
    else
        if [ "$VOL" -eq 0 ]; then
            printf "ļ±"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "ļ§ %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "ļ§ %s%%" "$VOL"
        else
            printf "ļØ %s%%" "$VOL"
        fi
    fi
    printf "%s\n" "$SEP2"
}
dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "š %s" "$(date "+%a %d-%m-%y %T")"
    else
        printf "ļ³ %s" "$(date "+%a %d-%m-%y %T")"
    fi
    printf "%s\n" "$SEP2"
}
dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1   
    CHARGE=$(cat /sys/class/power_supply/BAT1/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT1/status)

    printf "%s" "$SEP1"
		if [ "$STATUS" = "Discharging" ]; then
						printf "ļø %s%% %s" "$CHARGE" 
        else
            printf "ļ %s%% %s" "$CHARGE" 
        fi
    # if [ "$IDENTIFIER" = "unicode" ]; then
    # else
    #     printf "ļø %s%% %s" "$CHARGE" "$STATUS"
    # fi
    printf "%s\n" "$SEP2"
}
while true
do
	xsetroot -name "$(dwm_backlight) $(dwm_alsa) [$(dwm_date)] $(dwm_battery)"
  sleep 1
done
exit 0

