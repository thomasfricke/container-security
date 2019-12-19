#!/bin/sh

export HOMEPAGE=${HOMEPAGE:-"https://docs.google.com/presentation/d/1gr9TOW1EPr_WnggDHplkMummz-Da0oBQZQwGrPKl9sY/edit?usp=sharing"}
export DISPLAY=${DISPLAY:-":0"}
export PULSE_SERVER=${PULSE_SERVER:-"tcp:172.17.0.1:4713"}
export TERM=${TERM:-"linux"}
exec firefox "$HOMEPAGE"
