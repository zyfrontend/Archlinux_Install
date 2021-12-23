#!/bin/bash
dwm_backlight () {
    printf "%s☀ %.0f%s\n" "$SEP1" "$(xbacklight)" "$SEP2"
}
