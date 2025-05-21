#!/bin/bash

# Obtém a saída do comando amixer
AMIXER_OUTPUT=$(amixer get Capture)

# Identifica o status do microfone
if echo "$AMIXER_OUTPUT" | grep -q "Mono:"; then
  # Processa o status para o caso do microfone com "Mono"
  MIC_STATUS=$(echo "$AMIXER_OUTPUT" | awk '/Mono:/ {print $5}' | tr -d '[]')
elif echo "$AMIXER_OUTPUT" | grep -q "Front Left:"; then
  # Processa o status para o caso do microfone com "Front Left"
  MIC_STATUS=$(echo "$AMIXER_OUTPUT" | awk '/Front Left:/ {print $6}' | tr -d '[]')
else
  echo "Microphone status could not be determined."
  exit 1
fi

# Alterna o estado do microfone
if [ "$MIC_STATUS" == "on" ]; then
  amixer set Capture nocap
else
  amixer set Capture cap
fi
