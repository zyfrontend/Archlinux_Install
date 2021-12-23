#!/bin/bash

dwm_backlight () {
    printf "%s☀ %.0f%s\n" "$SEP1" "$(light)" "$SEP2"
}
dwm_alsa () {
    VOL=$(amixer get Master | tail -n1 | sed -r "s/.*\[(.*)%\].*/\1/")
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        if [ "$VOL" -eq 0 ]; then
            printf "🔇"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf "🔈 %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf "🔉 %s%%" "$VOL"
        else
            printf "🔊 %s%%" "$VOL"
        fi
    else
        if [ "$VOL" -eq 0 ]; then
            printf "ﱝ"
        elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
            printf " %s%%" "$VOL"
        elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
            printf " %s%%" "$VOL"
        else
            printf " %s%%" "$VOL"
        fi
    fi
    printf "%s\n" "$SEP2"
}
dwm_date () {
    printf "%s" "$SEP1"
    if [ "$IDENTIFIER" = "unicode" ]; then
        printf "📆 %s" "$(date "+%a %d-%m-%y %T")"
    else
        printf " %s" "$(date "+%a %d-%m-%y %T")"
    fi
    printf "%s\n" "$SEP2"
}
dwm_battery () {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1   
    CHARGE=$(cat /sys/class/power_supply/BAT1/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT1/status)

    printf "%s" "$SEP1"
		if [ "$STATUS" = "Discharging" ]; then
						printf " %s%% %s" "$CHARGE" 
        else
            printf " %s%% %s" "$CHARGE" 
        fi
    # if [ "$IDENTIFIER" = "unicode" ]; then
    # else
    #     printf " %s%% %s" "$CHARGE" "$STATUS"
    # fi
    printf "%s\n" "$SEP2"
}
while true
do
	xsetroot -name "$(dwm_backlight) $(dwm_alsa) [$(dwm_date)] $(dwm_battery)"
  sleep 1
done
exit 0

