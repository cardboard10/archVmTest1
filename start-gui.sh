#!/usr/bin/env bash
set -e

echo "Starting virtual X11 display..."
Xvfb :1 -screen 0 1280x800x24 &
export DISPLAY=:1

echo "Starting window manager (Fluxbox)..."
startxfce4 &

echo "Starting x11vnc server..."
x11vnc -display :1 -nopw -forever -shared -rfbport 5900 &

echo "Starting noVNC web bridge on port 6080..."
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &