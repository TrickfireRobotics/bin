#!/usr/bin/env bash
set -euo pipefail

DNS="10.156.78.198"

if ! command -v nmcli &>/dev/null; then
    echo "Error: NetworkManager (nmcli) not found."
    exit 1
fi

CON=$(nmcli -g NAME,DEVICE con show --active | grep -v loopback | head -1 | cut -d: -f1)
if [[ -z "$CON" ]]; then
    echo "Error: no active connection found."
    exit 1
fi

nmcli con mod "$CON" ipv4.dns "$DNS" ipv4.ignore-auto-dns yes
nmcli con up "$CON" >/dev/null
echo "DNS set to $DNS for \"$CON\"."
echo "To undo: nmcli con mod \"$CON\" ipv4.dns \"\" ipv4.ignore-auto-dns no && nmcli con up \"$CON\""
