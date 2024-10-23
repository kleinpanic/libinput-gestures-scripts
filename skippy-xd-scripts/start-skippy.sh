#!/bin/bash

# Check if skippy-xd is currently running
if ! pgrep -x "skippy-xd" > /dev/null; then
    # Start skippy-xd
    skippy-xd &
fi
