#!/usr/bin/env bash
# Connect to a wireless network using nmcli

INSTANCE=$(hyprctl instances | awk 'NR==1{print $2}' | sed 's/.$//')

notify () {
    hyprctl -i $INSTANCE notify -1 5000 "rgb(ff1ea3)" "$1"
}

WLAN_SSID="VMKG"
WLAN_PASSWD_FILE="/home/kimmo/.config/hypr/nmconnection-vmkg.passwd"
#WLAN_SSID="Vammala Party"
#WLAN_PASSWD_FILE="/home/kimmo/.config/hypr/nmconnection-vammalaparty.passwd"

notify "Connecting to ${WLAN_SSID}..."

SSID_FOUND=$(nmcli device wifi list | grep ${WLAN_SSID})

if [ "${SSID_FOUND}" ]; then
    notify "Network ${WLAN_SSID} found!"
    nmcli connection up ${WLAN_SSID} passwd-file ${WLAN_PASSWD_FILE}
else
    notify "Network ${WLAN_SSID} not found!"
fi
