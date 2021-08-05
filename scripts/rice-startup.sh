#!/bin/bash

shopt -s expand_aliases
source ~/.bashrc

# start the eww daemon
~/.eww/eww/target/release/eww daemon --config ~/code/rice/eww/

# give the daemon time to get started before trying to open any windows
sleep 1

# start eww listener process
manage-eww & disown
