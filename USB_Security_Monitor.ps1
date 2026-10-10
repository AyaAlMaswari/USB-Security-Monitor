$trustedPath = "$env:USERPROFILE\Desktop\TrustedUSB.txt"
$logPath = "$env:USERPROFILE\Desktop\USB_Security_Log.txt"

if (-not (Test-Path $trustedPath)) {
    Write-Host "TrustedUSB.txt not found!" -ForegroundColor Red
    exit
}

$trusted = @(Get-Content $trustedPath)

function Get-USBDevices {
    @(
        Get-PnpDevice -PresentOnly |
        Where-Object {
            $_.FriendlyName -eq "USB Mass Storage Device" -and
            $_.InstanceId -like 'USB\VID_*'
        }
    )
}

$serial = [System.IO.Ports.SerialPort]::new("COM10",115200)
$serial.NewLine = "`n"

try {
    $serial.Open()
    Start-Sleep -Seconds 3
    $serial.WriteLine("OFF")

    $known = @(
        Get-USBDevices |
        Select-Object -ExpandProperty InstanceId
    )

    Write-Host "USB SECURITY SYSTEM READY" -ForegroundColor Cyan
    Write-Host "Waiting for USB devices..." -ForegroundColor Yellow

    while ($true) {
        Start-Sleep -Seconds 2

        $devices = @(Get-USBDevices)
        $currentIds = @(
            $devices | Select-Object -ExpandProperty InstanceId
        )

        $new = @(
            $devices | Where-Object {
                $_.InstanceId -notin $known
            }
        )

        foreach ($device in $new) {
            $id = $device.InstanceId
            $name = $device.FriendlyName
            $time = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

            if ($trusted -contains $id) {
                $status = "REGISTERED"
                $serial.WriteLine("TRUSTED")
                Write-Host "TRUSTED USB - GREEN LED" -ForegroundColor Green
            }
            else {
                $status = "UNREGISTERED"
                $serial.WriteLine("ALERT")
                Write-Host "UNKNOWN USB - RED LED" -ForegroundColor Red
                try {
                    [Console]::Beep(1000,500)
                } catch {}
            }

            "$time | $status | $name | $id" |
                Add-Content $logPath
        }

        $removed = @(
            $known | Where-Object {
                $_ -notin $currentIds
            }
        )

        if ($removed.Count -gt 0 -and $new.Count -eq 0) {
            $serial.WriteLine("OFF")
            Write-Host "USB REMOVED - LED OFF" -ForegroundColor Yellow
        }

        $known = $currentIds
    }
}
catch {
    Write-Host "ERROR: $($_.Exception.Message)" -ForegroundColor Red
}
finally {
    if ($serial.IsOpen) {
        $serial.Close()
    }
    $serial.Dispose()
}