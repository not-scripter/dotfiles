#!/bin/bash
killall -9 waybar
sleep 1
hyprparer & waybar & swaync-client --reload-config &
