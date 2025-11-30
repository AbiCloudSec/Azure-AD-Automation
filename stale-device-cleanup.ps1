# stale-device-cleanup.ps1
Connect-MgGraph -Scopes 'DeviceManagementManagedDevices.ReadWrite.All'
$threshold = (Get-Date).AddDays(-90)
$devices = Get-MgDeviceManagementManagedDevice | Where-Object { $_.lastSyncDateTime -lt $threshold }
foreach ($d in $devices) {
    Write-Output "Found stale device: $($d.deviceName) - Last sync: $($d.lastSyncDateTime)"
    # Remove-MgDeviceManagementManagedDevice -ManagedDeviceId $d.id
}
