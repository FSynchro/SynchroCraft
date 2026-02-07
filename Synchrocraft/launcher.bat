@echo off
:: Show PowerShell updater in a separate visible window and WAIT for it to finish
start "Synchrocraft Updater" /WAIT powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "& 'C:\\Users\\Henry\\AppData\\Roaming\\.minecraft\\Synchrocraft\\launch_wrapper.ps1'"

:: Check if updater succeeded
if %ERRORLEVEL% NEQ 0 (
    echo Update failed! Minecraft will not start.
    pause
    exit /b 1
)

:: Launch Minecraft and hide this CMD window
:: Using 'start' without /WAIT so the BAT can exit and close the window
start "" "%appdata%\.minecraft\Synchrocraft\runtime\bin\java.exe" %*

:: Exit immediately to close this CMD window
exit /b 0
