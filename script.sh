#!/bin/bash
export DISPLAY=":1"
vncserver $DISPLAY -geometry 1280x800 && tail -f /root/.vnc/*.log & protractor $@
