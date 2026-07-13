$dns = "10.156.78.198"

$adapter = Get-NetAdapter | Where-Object { $_.Status -eq "Up" } | Select-Object -First 1
if (-not $adapter) {
    Write-Error "No active network adapter found."
    exit 1
}

Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex -ServerAddresses $dns
Write-Host "DNS set to $dns for '$($adapter.Name)'."
Write-Host "To undo: Set-DnsClientServerAddress -InterfaceIndex $($adapter.InterfaceIndex) -ResetServerAddresses"
