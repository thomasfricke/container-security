#!/bin/bash

export DISPLAY=${DISPLAY:-":0"}
export PULSE_SERVER=${PULSE_SERVER:-"tcp:172.17.0.1:4713"}
export TERM=${TERM:-"linux"}
brave-browser --no-sandbox
