#!/bin/bash

# Check if an argument was passed
if [ $# -ne 1 ]; then
    echo "Usage: $0 {start|stop}"
    exit 1
fi

# Define the actions for start and stop
case "$1" in
    start)
        # Check if skippy-xd is currently running
        if ! pgrep -x "skippy-xd" > /dev/null; then
            # Start skippy-xd
            skippy-xd > /dev/null 2>&1 &
        fi
        ;;
    stop)
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
        ;;
    *)
        echo "Invalid argument: $1"
        echo "Usage: $0 {start|stop}"
        exit 1
        ;;
esac
