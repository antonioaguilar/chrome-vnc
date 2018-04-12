#!/bin/bash
export DISPLAY=":1"

if [ -z "$PORT" ]
then
  VNC_PORT=5901
else
  VNC_PORT=$PORT
fi

vncserver $DISPLAY -geometry 1280x800 -rfbport $VNC_PORT && tail -f /root/.vnc/*.log & protractor $@
