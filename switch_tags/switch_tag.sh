#!/bin/bash

# Function to get the current tag (workspace) from the bitmask
get_current_tag() {
    dwm-msg get_monitors | jq -r '.[0].tagset.current'
}

# Read the current tag bitmask
current_tag_bitmask=$(get_current_tag)

# Ensure current_tag_bitmask is a valid number
if ! [[ "$current_tag_bitmask" =~ ^[0-9]+$ ]]; then
    echo "Error: Invalid current tag bitmask"
    exit 1
fi

# Convert bitmask to actual tag number (1-9)
current_tag=$(awk 'BEGIN {for (i=1; i<=9; i++) if (2^(i-1) == '$current_tag_bitmask') print i}')

if [[ -z "$current_tag" ]]; then
    echo "Error: Could not determine current tag from bitmask"
    exit 1
fi

echo "Current tag: $current_tag"

if [ "$1" == "next" ]; then
    next_tag=$((current_tag % 9 + 1))  # Increment tag and wrap around after 9
    echo "Switching to next tag: $next_tag"
    sleep 0.1  # Small delay to ensure xdotool handles the input properly
    xdotool key Super_L+$next_tag  # Use xdotool to switch tags
elif [ "$1" == "prev" ]; then
    prev_tag=$((current_tag == 1 ? 9 : current_tag - 1))  # Decrement tag and wrap around after 1
    echo "Switching to previous tag: $prev_tag"
    sleep 0.1  # Small delay to ensure xdotool handles the input properly
    xdotool key Super_L+$prev_tag  # Use xdotool to switch tags
else
    echo "Usage: $0 {next|prev}"
    exit 1
fi
