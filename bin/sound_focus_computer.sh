#!/bin/bash
SINK="alsa_output.pci-0000_c1_00.6.analog-stereo"
pactl set-default-sink "$SINK"
for input in $(pactl list short sink-inputs | awk '{print $1}'); do
  pactl move-sink-input "$input" "$SINK"
done

pactl set-card-profile bluez_card.0C_AE_BD_FA_00_F8 off
