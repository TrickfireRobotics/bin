#!/usr/bin/env bash
set -euo pipefail

DNS="10.156.78.198"

SERVICE=""
while IFS= read -r svc; do
	ip=$(networksetup -getinfo "$svc" 2>/dev/null | awk '/^IP address:/ {print $3}')
	if [[ "$ip" =~ ^10\.156\.(78|79)\. ]]; then
		SERVICE="$svc"
		break
	fi
done < <(networksetup -listallnetworkservices | grep -v '^\*')

if [[ -z "$SERVICE" ]]; then
	echo "Error: not connected to the TrickFire network (10.156.78/79.x). Connect first and retry."
	exit 1
fi

networksetup -setdnsservers "$SERVICE" "$DNS" "9.9.9.9"
networksetup -setsearchdomains "$SERVICE" "lan"
echo "DNS configured for \"$SERVICE\" (TF network only, other services untouched)."
echo "To undo: networksetup -setdnsservers \"$SERVICE\" Empty && networksetup -setsearchdomains \"$SERVICE\" Empty"
