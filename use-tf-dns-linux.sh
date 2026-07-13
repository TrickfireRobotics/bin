#!/usr/bin/env bash
set -euo pipefail

DNS="10.156.78.198"

if ! command -v nmcli &>/dev/null; then
	echo "Error: NetworkManager (nmcli) not found."
	exit 1
fi

CON=""
while IFS= read -r name; do
	ip=$(nmcli -g IP4.ADDRESS con show "$name" 2>/dev/null | head -1 | cut -d'/' -f1)
	if [[ "$ip" =~ ^10\.156\.(78|79)\. ]]; then
		CON="$name"
		break
	fi
done < <(nmcli -g NAME con show --active | grep -v '^lo')

if [[ -z "$CON" ]]; then
	echo "Error: not connected to the TrickFire network (10.156.78/79.x). Connect first and retry."
	exit 1
fi

nmcli con mod "$CON" ipv4.dns "$DNS" ipv4.dns-search "lan" ipv4.ignore-auto-dns yes
nmcli con up "$CON" >/dev/null
echo "DNS configured for \"$CON\" (TF network only, other connections untouched)."
echo "To undo: nmcli con mod \"$CON\" ipv4.dns \"\" ipv4.dns-search \"\" ipv4.ignore-auto-dns no && nmcli con up \"$CON\""
