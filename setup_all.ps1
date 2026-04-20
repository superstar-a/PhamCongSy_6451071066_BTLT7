# Sinh cac folder platform (android/web/windows) + pub get cho ca 7 project
# Ten project lay tu pubspec.yaml (vi du "01" la ten folder khong hop le cho Dart package)

$root = $PSScriptRoot
$map = [ordered]@{
    '01' = 'bai01_fetch_users'
    '02' = 'bai02_product_detail'
    '03' = 'bai03_create_post'
    '04' = 'bai04_update_user'
    '05' = 'bai05_delete_task'
    '06' = 'bai06_search'
    '07' = 'bai07_pull_refresh'
}

foreach ($folder in $map.Keys) {
    $pkg = $map[$folder]
    $dir = Join-Path $root $folder

    Write-Host "==================================================" -ForegroundColor Cyan
    Write-Host " Setup $folder ($pkg) -> $dir" -ForegroundColor Cyan
    Write-Host "==================================================" -ForegroundColor Cyan

    Push-Location $dir
    try {
        flutter create . --platforms=android,web,windows --project-name $pkg
        flutter pub get
    } finally {
        Pop-Location
    }
}

Write-Host "`nHoan tat setup 7 project." -ForegroundColor Green
