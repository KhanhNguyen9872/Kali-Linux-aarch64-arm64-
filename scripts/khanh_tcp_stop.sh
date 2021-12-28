#!/bin/sh
pulseaudio --kill
pactl unload-module `pactl list | grep tcp -B1 | grep M | sed 's/[^0-9]//g'`


