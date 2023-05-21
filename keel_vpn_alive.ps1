# Modify the following variables to match your setup
$TargetHost = "192.168.178.1"
$PingInterval = 5 * 60  # 5 minutes in seconds

function Ping-Host {
    param (
        [string]$Hostname
    )

    $pingResult = Test-Connection -ComputerName $Hostname -Count 1 -Quiet
    return $pingResult
}

function Restart-WireGuardService {
    # Restart WireGuard service
    $serviceName = "WireGuardTunnel`$wire"
    Restart-Service -Name $serviceName
}

while ($true) {
    if (!(Ping-Host -Hostname $TargetHost)) {
        Write-Host "Ping failed. Restarting WireGuard service..."
        Restart-WireGuardService
    }
    else {
        Write-Host "Ping successful."
    }

    Start-Sleep -Seconds $PingInterval
}