#!/bin/bash
export DISPLAY=":1"
vncserver $DISPLAY -geometry 1440x900 && tail -f /root/.vnc/*.log & protractor $@
