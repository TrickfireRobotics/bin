#!/usr/bin/env bash
set -euo pipefail

DNS="10.156.78.198"

SERVICE=""
while IFS= read -r svc; do
  ip=$(networksetup -getinfo "$svc" 2>/dev/null | awk '/^IP address:/ {print $3}') || true
  if [[ "$ip" =~ ^10\.156\.(78|79)\. ]]; then
    SERVICE="$svc"
    break
  fi
done < <(networksetup -listallnetworkservices 2>/dev/null | grep -vE '^\*|asterisk')

if [[ -z "$SERVICE" ]]; then
  echo "Error: not connected to the TrickFire network (10.156.78/79.x). Connect first and retry."
  exit 1
fi

networksetup -setdnsservers "$SERVICE" "$DNS" "9.9.9.9"
networksetup -setsearchdomains "$SERVICE" "lan"

if ! sudo -v 2>/dev/null; then
  echo "Error: administrator access required to install the LAN DNS resolver."
  echo "Re-run this script in Terminal and enter your password when prompted."
  exit 1
fi
sudo mkdir -p /etc/resolver
printf 'nameserver %s\n' "$DNS" | sudo tee /etc/resolver/lan >/dev/null
sudo dscacheutil -flushcache 2>/dev/null || true
sudo killall -HUP mDNSResponder 2>/dev/null || true

echo "DNS configured for \"$SERVICE\" (TF network only, other services untouched)."
echo "To undo: networksetup -setdnsservers \"$SERVICE\" Empty && networksetup -setsearchdomains \"$SERVICE\" Empty && sudo rm -f /etc/resolver/lan && sudo dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
