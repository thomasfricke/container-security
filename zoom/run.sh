#!/bin/bash

export MEETING="$1"
export DISPLAY=${DISPLAY:-":0"}
export PULSE_SERVER=${PULSE_SERVER:-"tcp:172.17.0.1:4713"}
export TERM=${TERM:-"linux"}
xdg-open ${MEETING} &

