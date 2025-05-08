if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" = "DP-3" ]; then
      MONITOR=$m polybar --reload toph --config="/home/$USER/.config/polybar/config.ini" &
    elif [ "$m" = "eDP-1" ]; then
      MONITOR=$m polybar --reload toph --config="/home/$USER/.config/polybar/config-notebook.ini" &
    else
      MONITOR=$m polybar --reload toph --config="/home/$USER/.config/polybar/config.ini" &
    fi
  done
else
  polybar --reload toph --config="/home/$USER/.config/polybar/config.ini" &
fi
