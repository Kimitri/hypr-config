#!/usr/bin/env bash
# Connect to a wireless network using nmcli

WLAN_SSID="VMKG"

SSID_FOUND=$(nmcli device wifi list | grep ${WLAN_SSID})

if [ "${SSID_FOUND}" ]; then
    echo "Network ${WLAN_SSID} found!"
    nmcli connection up ${WLAN_SSID} passwd-file /home/kimmo/.config/hypr/nmconnection-vmkg.passwd
else
    echo "Network ${WLAN_SSID} not found!"
fi
