$dns = "10.156.78.198"

$addr = Get-NetIPAddress -AddressFamily IPv4 |
    Where-Object { $_.IPAddress -match '^10\.156\.(78|79)\.' } |
    Select-Object -First 1

if (-not $addr) {
    Write-Error "Not connected to the TrickFire network (10.156.78/79.x). Connect first and retry."
    exit 1
}

Set-DnsClientServerAddress -InterfaceIndex $addr.InterfaceIndex -ServerAddresses $dns, "9.9.9.9"
Set-DnsClient -InterfaceIndex $addr.InterfaceIndex -ConnectionSpecificSuffix "lan"
Write-Host "DNS configured for interface '$((Get-NetAdapter -InterfaceIndex $addr.InterfaceIndex).Name)' (TF network only, other adapters untouched)."
Write-Host "To undo: Set-DnsClientServerAddress -InterfaceIndex $($addr.InterfaceIndex) -ResetServerAddresses"
