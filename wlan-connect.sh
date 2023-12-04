#!/usr/bin/env bash
# Connect to a wireless network using nmcli

INSTANCE=$(hyprctl instances | awk 'NR==1{print $2}' | sed 's/.$//')

notify () {
    hyprctl -i $INSTANCE notify -1 5000 "rgb(ff1ea3)" "$1"
}

WLAN_SSID="VMKG"

notify "Connecting to ${WLAN_SSID}..."

SSID_FOUND=$(nmcli device wifi list | grep ${WLAN_SSID})

if [ "${SSID_FOUND}" ]; then
    notify "Network ${WLAN_SSID} found!"
    nmcli connection up ${WLAN_SSID} passwd-file /home/kimmo/.config/hypr/nmconnection-vmkg.passwd
else
    notify "Network ${WLAN_SSID} not found!"
fi
