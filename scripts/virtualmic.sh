#!/bin/bash
# Script created by KhanhNguyen9872
virtmic -n VirtualMic rtsp://127.0.0.1:8080 || echo "IP Webcam is not start server!"
echo "Disconnected!"
exit
