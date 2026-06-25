#!/bin/bash

# Ensure the script can find system binaries in the cron/systemd environment
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

while true; do
    battery_device=$(upower -e | grep 'BAT')

    if [[ -n "$battery_device" ]]; then
        battery_percentage=$(upower -i "$battery_device" | grep -i 'percentage' | awk '{print $2}' | sed 's/%//')
        battery_state=$(upower -i "$battery_device" | grep -i 'state' | awk '{print $2}')

        if [[ -n "$battery_percentage" && "$battery_percentage" -le 8 && "$battery_state" == "discharging" ]]; then
            # No 'sudo' needed here; systemd runs this as root natively
            systemctl hibernate
        fi
    fi

    sleep 60
done
