#!/bin/bash

# Check the current state of the microphone
MIC_STATUS=$(amixer get Capture | awk '/Mono:/ {print $5}' | tr -d '[]')

# Toggle the microphone state
if [ "$MIC_STATUS" == "on" ]; then
	amixer set Capture nocap
else
	amixer set Capture cap
fi
