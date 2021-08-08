killall polybar

for m in $(xrandr | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar center &
done
