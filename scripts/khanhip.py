#!/usr/bin/python3
###KhanhNguyen9872
import netifaces as ni
import sys
def wlan0():
    ni.ifaddresses('wlan0')
    ip = ni.ifaddresses('wlan0')[ni.AF_INET][0]['addr']
    print(ip)
    exit()
sys.tracebacklimit=0
wlan0()
