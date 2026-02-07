@echo off
:: ==============================================================================
:: Synchrocraft Auto-Update Launcher Wrapper
:: ==============================================================================
:: This wrapper:
:: 1. Runs the Synchrocraft updater (visible output)
:: 2. Launches Minecraft with all launcher arguments
:: ==============================================================================

echo.
echo ========================================
echo   Synchrocraft Launcher
echo ========================================
echo.

:: Run updater and wait for completion
powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "& '%appdata%\.minecraft\Synchrocraft.ps1'"

:: Check if update was successful (optional)
if %ERRORLEVEL% NEQ 0 (
    echo.
    echo [ERROR] Update check failed!
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo Starting Minecraft...
echo.

:: Launch Minecraft with all arguments from the launcher
"%appdata%\.minecraft\Synchrocraft\runtime\bin\java.exe" %*

:: Exit without pausing (window closes automatically when Minecraft starts)
exit