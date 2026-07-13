#!/usr/bin/env bash
set -euo pipefail

DNS="10.156.78.198"

SERVICE=$(networksetup -listallnetworkservices 2>/dev/null | grep -v '^\*' | grep -iE 'wi-fi|wifi|ethernet' | head -1)
if [[ -z "$SERVICE" ]]; then
    echo "Error: no active network service found."
    exit 1
fi

networksetup -setdnsservers "$SERVICE" "$DNS"
echo "DNS set to $DNS for \"$SERVICE\"."
echo "To undo: networksetup -setdnsservers \"$SERVICE\" Empty"
