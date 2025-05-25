#!/bin/bash

# Infinite loop to check the battery percentage every minute
while true; do
    # Get battery device path
    battery_device=$(upower -e | grep 'BAT')

    # Get the battery percentage and state
    battery_percentage=$(upower -i "$battery_device" | grep -i 'percentage' | awk '{print $2}' | sed 's/%//')
    battery_state=$(upower -i "$battery_device" | grep -i 'state' | awk '{print $2}')

    # Check if battery is not charging and percentage is 8 or less
    if [[ -n "$battery_percentage" && "$battery_percentage" -le 8 && "$battery_state" == "discharging" ]]; then
        sudo systemctl hibernate
    fi

    # Sleep for 1 minute (60 seconds) before checking again
    sleep 60
done
