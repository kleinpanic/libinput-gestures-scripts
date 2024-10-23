#!/bin/bash

# Check if skippy-xd is currently running
SKIPPY_PID=$(pgrep -x "skippy-xd")

if [ -n "$SKIPPY_PID" ]; then
    # Capture the currently active window before killing skippy-xd
    PREV_WINDOW=$(xdotool getwindowfocus)

    # Kill skippy-xd cleanly
    pkill -x skippy-xd

    # Wait until skippy-xd is fully terminated
    while pgrep -x "skippy-xd" > /dev/null; do
        sleep 0.1
    done

    # Refocus the previously active window
    if [ -n "$PREV_WINDOW" ]; then
        xdotool windowactivate "$PREV_WINDOW"
    fi
fi
