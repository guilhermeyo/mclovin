#!/bin/bash

MIC_STATUS=$(amixer get Capture | awk '/Mono:/ {print $4, $5}' | tr -d '[]')

VOLUME=$(echo $MIC_STATUS | awk '{print $1}')
STATUS=$(echo $MIC_STATUS | awk '{print $2}')

if [ "$STATUS" == "on" ]; then
	echo "$VOLUME"
else
	echo "muted"
fi
