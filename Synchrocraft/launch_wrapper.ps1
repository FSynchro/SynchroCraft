# Synchrocraft Launcher Wrapper - Runs in separate window
$Host.UI.RawUI.WindowTitle = "Synchrocraft Updater"

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   Synchrocraft Auto-Updater" -ForegroundColor Cyan  
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# Run the updater
$UpdaterScript = Join-Path $env:APPDATA ".minecraft\Synchrocraft.ps1"
if (Test-Path $UpdaterScript) {
    & $UpdaterScript
    
    if ($LASTEXITCODE -ne 0) {
        Write-Host ""
        Write-Host "[ERROR] Update failed!" -ForegroundColor Red
        Write-Host "Press any key to close..." -ForegroundColor Yellow
        $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
        exit 1
    }
} else {
    Write-Host "[WARNING] Updater script not found!" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "[SUCCESS] Ready to launch Minecraft!" -ForegroundColor Green
Write-Host "This window will close in 3 seconds..." -ForegroundColor Gray
Start-Sleep -Seconds 3
exit 0
