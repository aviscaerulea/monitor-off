param(
    [switch]$Clean
)

$ErrorActionPreference = "Stop"

# プロジェクトルートに移動
Set-Location $PSScriptRoot

# Visual Studio 環境を有効化
Enable-VSDev

if ($Clean) {
    Write-Host "クリーンビルドを実行します..." -ForegroundColor Cyan
    if (Test-Path "build") {
        Remove-Item -Recurse -Force "build"
    }
    cmake -B build -G "Visual Studio 18 2026"
}

# ビルド実行
Write-Host "ビルド中..." -ForegroundColor Cyan
cmake --build build --config Release

if ($LASTEXITCODE -eq 0) {
    Write-Host "`nビルド成功" -ForegroundColor Green
    Write-Host "実行ファイル: $PSScriptRoot\build\Release\monitor-off.exe" -ForegroundColor Green

    # zip 化
    $zipPath = "$PSScriptRoot\build\monitor-off-windows-x86_64.zip"
    if (Test-Path $zipPath) {
        Remove-Item $zipPath -Force
    }
    Write-Host "`nzip 作成中..." -ForegroundColor Cyan
    Compress-Archive -Path "$PSScriptRoot\build\Release\monitor-off.exe" -DestinationPath $zipPath
    Write-Host "zip ファイル: $zipPath" -ForegroundColor Green
} else {
    Write-Host "`nビルド失敗" -ForegroundColor Red
    exit 1
}
