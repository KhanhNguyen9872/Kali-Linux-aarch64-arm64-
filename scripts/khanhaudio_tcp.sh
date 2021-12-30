#!/usr/bin/bash
pactl load-module module-simple-protocol-tcp rate=48000 format=s16le channels=2 source=auto_null.monitor record=true port=8000
