#!/bin/bash

AMIXER_OUTPUT=$(amixer get Capture)

if echo "$AMIXER_OUTPUT" | grep -q "Mono:"; then
  # Processa a saída para o caso do microfone com "Mono"
  MIC_STATUS=$(echo "$AMIXER_OUTPUT" | awk '/Mono:/ {print $4, $5}' | tr -d '[]')
  VOLUME=$(echo $MIC_STATUS | awk '{print $1}')
  STATUS=$(echo $MIC_STATUS | awk '{print $2}')
elif echo "$AMIXER_OUTPUT" | grep -q "Front Left:"; then
  # Processa a saída para o caso do microfone com "Front Left"
  MIC_STATUS=$(echo "$AMIXER_OUTPUT" | awk '/Front Left:/ {print $5, $6}' | tr -d '[]')
  VOLUME=$(echo $MIC_STATUS | awk '{print $1}')
  STATUS=$(echo $MIC_STATUS | awk '{print $2}')
else
  echo "Microphone status could not be determined."
  exit 1
fi

if [ "$STATUS" == "on" ]; then
  echo "$VOLUME"
else
  echo "muted"
fi
