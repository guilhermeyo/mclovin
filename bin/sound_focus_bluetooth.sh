#!/bin/bash
pactl set-card-profile bluez_card.0C_AE_BD_FA_00_F8 a2dp-sink

SINK="bluez_output.0C_AE_BD_FA_00_F8.1"
pactl set-default-sink "$SINK"
for input in $(pactl list short sink-inputs | awk '{print $1}'); do
  pactl move-sink-input "$input" "$SINK"
done
