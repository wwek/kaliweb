#!/bin/bash

novncroot="/root/noVNC/"
indexhtml="index.html"

echo $novncroot$indexhtml

if [ ! -f "$novncroot$indexhtml" ];then
 ln -s $novncrootvnc_auto.html $novncroot$indexhtml
fi

export DISPLAY=:1
Xvfb :1 -screen 0 1600x900x16 &
sleep 5
#openbox-session&
xfce4-session&
x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &

cd $novncroot && ./utils/launch.sh --vnc localhost:5900



# export DISPLAY=:1
# Xvfb :1 -screen 0 1600x900x16 &
# sleep 5
# #openbox-session&
# xfce4-session&
# x11vnc -display :1 -nopw -listen localhost -xkb -ncache 10 -ncache_cr -forever &
# cd /root/noVNC && ln -s vnc_auto.html index.html && ./utils/launch.sh --vnc localhost:5900