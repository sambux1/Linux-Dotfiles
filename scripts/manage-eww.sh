#!/bin/bash

# this script listens for changes to the current desktop workspace
#   and opens EWW windows only when a certain workspace is active

# set the default workspace
last_ws=0

# choose which workspace should show the eww windows
eww_ws=8

# the list of eww windows to manage
declare -a windows=("lichess")

while true; do

    # get description of active workspace
    # all workspaces are listed, the active one has a "*"
    ws_description=$(wmctrl -d | grep "*")
    
    # the workspace is the first character of the workspace description
    ws=${ws_description:0:1}

    # if the workspace changed, potentially update eww
    if [ $ws -ne $last_ws ]; then
        # if the new workspace is the eww workspace, open the windows
        if [ $ws = $eww_ws ]; then
            for window in "${windows[@]}"; do
                ~/.eww/eww/target/release/eww open $window --config ~/code/rice/eww/
            done
        fi
        # if the old workspace was the eww workspace, close the windows
        if [ $last_ws = $eww_ws ]; then
            for window in "${windows[@]}"; do
                ~/.eww/eww/target/release/eww close $window --config ~/code/rice/eww/
            done
        fi
    fi

    # set the last workspace as the current workspace for the next iteration
    last_ws=$ws

done