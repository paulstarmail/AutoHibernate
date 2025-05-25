#!/bin/bash

# Infinite loop to check the battery percentage every minute
while true; do
    # Get the battery percentage
    battery_percentage=upower -i $(upower -e | grep 'BAT') | grep -i 'percentage' | awk '{print $2}' | sed 's/%//'

    # If battery is less than or equal to 8%, run the command
    if [ "$battery_percentage" -le 8 ]; then
        sudo systemctl hibernate
    fi

    # Sleep for 1 minute (60 seconds) before checking again
    sleep 60
done

