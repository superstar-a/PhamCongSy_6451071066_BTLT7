# Chay 1 bai tren 1 nen tang
# Cach dung:
#   .\run.ps1 01 windows
#   .\run.ps1 01 chrome
#   .\run.ps1 01 android   (can mo Android emulator truoc)

param(
    [Parameter(Mandatory=$true)][string]$Bai,
    [Parameter(Mandatory=$true)][ValidateSet('windows','chrome','edge','android','web')][string]$Platform
)

$root = $PSScriptRoot
$dir  = Join-Path $root $Bai
if (-not (Test-Path $dir)) {
    Write-Host "Khong tim thay folder: $dir" -ForegroundColor Red
    exit 1
}

Push-Location $dir
try {
    switch ($Platform) {
        'windows' { flutter run -d windows }
        'chrome'  { flutter run -d chrome  }
        'edge'    { flutter run -d edge    }
        'web'     { flutter run -d edge    }
        'android' {
            # Lay deviceId cua emulator/Android dau tien
            $devLine = (flutter devices) | Where-Object { $_ -match 'android' } | Select-Object -First 1
            if (-not $devLine) {
                Write-Host "Khong co Android device/emulator. Hay mo emulator roi chay lai." -ForegroundColor Red
                exit 1
            }
            # Cot 2 trong output `flutter devices` la device id
            $devId = ($devLine -split '\|')[1].Trim()
            Write-Host "Chay tren Android device: $devId" -ForegroundColor Green
            flutter run -d $devId
        }
    }
} finally {
    Pop-Location
}
