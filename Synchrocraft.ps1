# ==============================================================================
# Synchrocraft Ultimate Updater
# ==============================================================================

# --- CONFIGURATION ---
$RepoOwner   = "FSynchro"
$RepoName    = "SynchroCraft"
$Branch      = "main"

# Unified Versioning
$MinecraftVersion = "1.12.2"
$ForgeVersionID   = "1.12.2-forge-14.23.5.2864" # The definitive name for folders/files/profiles
$ProfileName      = "Synchrocraft"

# JVM arguments
$JvmArgs = "-Xms6G -Xmx8G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions -XX:G1NewSizePercent=20 " +
           "-XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M"

# --- LOCAL PATHS ---
$MinecraftDir     = Join-Path $env:APPDATA ".minecraft"
$PackRoot         = Join-Path $MinecraftDir "Synchrocraft"
$AssetsDir        = Join-Path $MinecraftDir "assets"
$LibrariesDir     = Join-Path $MinecraftDir "libraries"
$LocalVersionFile = Join-Path $PackRoot ".synchrocraft-version"
$JavaDir          = Join-Path $PackRoot "runtime"
$LauncherProfiles = Join-Path $MinecraftDir "launcher_profiles.json"
$VersionsDir      = Join-Path $MinecraftDir "versions"
$LaunchWrapper    = Join-Path $PackRoot "launch_wrapper.ps1"

# --- USER FILES TO BACKUP ---
$BackupFiles = @(
    @{ Path = "options.txt"; IsFile = $true }
    @{ Path = "knownkeys.txt"; IsFile = $true }
    @{ Path = "journeymap\config\5.7"; IsFile = $false }  # Directory
)

# Ensure core directories exist
$null = New-Item -ItemType Directory -Force -Path $PackRoot, $AssetsDir, $LibrariesDir, $JavaDir, $VersionsDir

# ==============================================================================
# 1. VERSION CHECK
# ==============================================================================
Write-Host "[INFO] Checking for updates on GitHub..." -ForegroundColor Cyan

try {
    # Fetch the remote version file directly
    $VersionFileUrl = "https://raw.githubusercontent.com/$RepoOwner/$RepoName/$Branch/Synchrocraft/.synchrocraft-version"
    $RemoteVersion = (Invoke-WebRequest -Uri $VersionFileUrl -UseBasicParsing).Content.Trim()
    Write-Host "[INFO] Remote version: $RemoteVersion" -ForegroundColor Gray
} catch {
    Write-Host "[ERROR] Could not fetch version from GitHub: $_" -ForegroundColor Red
    Write-Host "[INFO] Continuing without update check..." -ForegroundColor Yellow
    $RemoteVersion = $null
}

$NeedsUpdate = $true
if (Test-Path $LocalVersionFile) {
    $LocalVersion = (Get-Content $LocalVersionFile -Raw).Trim()
    Write-Host "[INFO] Local version:  $LocalVersion" -ForegroundColor Gray
    
    if ($RemoteVersion -and $LocalVersion -eq $RemoteVersion) {
        Write-Host "[SUCCESS] Synchrocraft is already up to date!" -ForegroundColor Green
        $NeedsUpdate = $false
    } else {
        Write-Host "[INFO] Update available!" -ForegroundColor Yellow
    }
} else {
    Write-Host "[INFO] No local version found, will download modpack." -ForegroundColor Yellow
}

if (-not $RemoteVersion) {
    Write-Host "[WARNING] Skipping update due to version check failure." -ForegroundColor Yellow
    $NeedsUpdate = $false
}

# ==============================================================================
# 2. BACKUP USER FILES
# ==============================================================================
if ($NeedsUpdate) {
    Write-Host "[INFO] Backing up user settings..." -ForegroundColor Yellow
    $BackupDir = Join-Path $MinecraftDir "synchrocraft-backup-temp"
    if (Test-Path $BackupDir) { Remove-Item -Recurse -Force $BackupDir }
    $null = New-Item -ItemType Directory -Force -Path $BackupDir

    foreach ($item in $BackupFiles) {
        $SourcePath = Join-Path $PackRoot $item.Path
        if (Test-Path $SourcePath) {
            $DestPath = Join-Path $BackupDir $item.Path
            
            if ($item.IsFile) {
                # Backup single file
                $DestDir = Split-Path $DestPath -Parent
                if ($DestDir -and !(Test-Path $DestDir)) {
                    $null = New-Item -ItemType Directory -Force -Path $DestDir
                }
                Copy-Item $SourcePath $DestPath -Force
                Write-Host "  ✓ Backed up: $($item.Path)" -ForegroundColor Green
            } else {
                # Backup directory
                Copy-Item $SourcePath $DestPath -Recurse -Force
                Write-Host "  ✓ Backed up: $($item.Path)\" -ForegroundColor Green
            }
        }
    }
}

# ==============================================================================
# 3. DOWNLOAD & EXTRACT
# ==============================================================================
if ($NeedsUpdate) {
    Write-Host "[INFO] Downloading modpack from GitHub..." -ForegroundColor Yellow
    
    # Use direct GitHub archive URL (no authentication needed for public repos)
    $ZipUrl = "https://github.com/$RepoOwner/$RepoName/archive/refs/heads/$Branch.zip"
    $ZipPath = Join-Path $MinecraftDir "synchrocraft-update.zip"
    
    try {
        # Download with progress
        $WebClient = New-Object System.Net.WebClient
        $WebClient.Headers.Add("User-Agent", "Synchrocraft-Updater")
        $WebClient.DownloadFile($ZipUrl, $ZipPath)
        Write-Host "[SUCCESS] Download complete!" -ForegroundColor Green
    } catch {
        Write-Host "[ERROR] Download failed: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "[ERROR] URL attempted: $ZipUrl" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }

    Write-Host "[INFO] Extracting modpack..." -ForegroundColor Yellow
    $TempExtract = Join-Path $MinecraftDir "synchrocraft-temp"
    if (Test-Path $TempExtract) { Remove-Item -Recurse -Force $TempExtract }
    
    try {
        Add-Type -AssemblyName System.IO.Compression.FileSystem
        [System.IO.Compression.ZipFile]::ExtractToDirectory($ZipPath, $TempExtract)
    } catch {
        Write-Host "[ERROR] Extraction failed: $($_.Exception.Message)" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }

    $ExtractedFolder = Get-ChildItem $TempExtract | Where-Object { $_.PSIsContainer } | Select-Object -First 1
    
    if (-not $ExtractedFolder) {
        Write-Host "[ERROR] No folder found in downloaded zip!" -ForegroundColor Red
        Read-Host "Press Enter to exit"
        exit 1
    }
    
    Write-Host "[INFO] Installing modpack files..." -ForegroundColor Yellow
    Get-ChildItem $ExtractedFolder.FullName | ForEach-Object {
        $Dest = if ($_.Name -eq "Synchrocraft") { $PackRoot } else { Join-Path $MinecraftDir $_.Name }
        if (Test-Path $Dest) { Remove-Item -Recurse -Force $Dest }
        Move-Item $_.FullName $Dest -Force
    }
    Remove-Item $ZipPath, $TempExtract -Recurse -Force
    Write-Host "[SUCCESS] Modpack installed!" -ForegroundColor Green
    
    # ==============================================================================
    # 4. RESTORE USER FILES
    # ==============================================================================
    Write-Host "[INFO] Restoring user settings..." -ForegroundColor Yellow
    
    foreach ($item in $BackupFiles) {
        $BackupPath = Join-Path $BackupDir $item.Path
        if (Test-Path $BackupPath) {
            $RestorePath = Join-Path $PackRoot $item.Path
            
            if ($item.IsFile) {
                # Restore single file
                $RestoreDir = Split-Path $RestorePath -Parent
                if ($RestoreDir -and !(Test-Path $RestoreDir)) {
                    $null = New-Item -ItemType Directory -Force -Path $RestoreDir
                }
                Copy-Item $BackupPath $RestorePath -Force
                Write-Host "  ✓ Restored: $($item.Path)" -ForegroundColor Green
            } else {
                # Restore directory (overwrite files that exist)
                if (!(Test-Path $RestorePath)) {
                    $null = New-Item -ItemType Directory -Force -Path $RestorePath
                }
                Copy-Item (Join-Path $BackupPath "*") $RestorePath -Recurse -Force
                Write-Host "  ✓ Restored: $($item.Path)\" -ForegroundColor Green
            }
        }
    }
    
    # Clean up backup
    Remove-Item $BackupDir -Recurse -Force
    
    # Save the new version
    $RemoteVersion | Out-File $LocalVersionFile -Encoding ascii -Force
    Write-Host "[SUCCESS] Updated to version: $RemoteVersion" -ForegroundColor Green
}

# ==============================================================================
# 5. JAVA 8 AUTO-INSTALL
# ==============================================================================
$JavaExe = Join-Path $JavaDir "bin\java.exe"
if (-not (Test-Path $JavaExe)) {
    Write-Host "[INFO] Installing Java 8..." -ForegroundColor Cyan
    $TemurinApi = "https://api.adoptium.net/v3/binary/latest/8/ga/windows/x64/jre/hotspot/normal/eclipse"
    $TemurinZip = Join-Path $PackRoot "temurin.zip"
    (New-Object System.Net.WebClient).DownloadFile($TemurinApi, $TemurinZip)
    [System.IO.Compression.ZipFile]::ExtractToDirectory($TemurinZip, $JavaDir)
    $Inner = Get-ChildItem $JavaDir | Where-Object { $_.PSIsContainer } | Select-Object -First 1
    Move-Item -Path (Join-Path $Inner.FullName "*") -Destination $JavaDir -Force
    Remove-Item $TemurinZip, $Inner.FullName -Recurse -Force
}

# ==============================================================================
# 6. FORGE VERSION SETUP
# ==============================================================================
$ForgeDestFolder = Join-Path $VersionsDir $ForgeVersionID
$ForgeJarTarget  = Join-Path $ForgeDestFolder "$ForgeVersionID.jar"
$ForgeJsonTarget = Join-Path $ForgeDestFolder "$ForgeVersionID.json"

if (!(Test-Path $ForgeDestFolder)) { $null = New-Item -ItemType Directory -Force -Path $ForgeDestFolder }

# SEARCH: Find the JSON in Synchrocraft folder
Write-Host "[INFO] Locating Forge JSON in modpack..." -ForegroundColor Cyan
$ActualForgeJsonSource = Get-ChildItem $PackRoot -Filter "*14.23.5.2864*.json" -Recurse | Select-Object -First 1

if ($ActualForgeJsonSource) {
    Write-Host "[INFO] Found Forge JSON: $($ActualForgeJsonSource.Name)" -ForegroundColor Green
    Copy-Item $ActualForgeJsonSource.FullName $ForgeJsonTarget -Force
} else {
    Write-Host "[ERROR] Could not find Forge JSON in $PackRoot" -ForegroundColor Red
}

# JAR: Download directly to the correctly named file
if (!(Test-Path $ForgeJarTarget)) {
    Write-Host "[INFO] Downloading Forge JAR..." -ForegroundColor Yellow
    $ForgeJarUrl = "https://maven.minecraftforge.net/net/minecraftforge/forge/1.12.2-14.23.5.2864/forge-1.12.2-14.23.5.2864-universal.jar"
    (New-Object System.Net.WebClient).DownloadFile($ForgeJarUrl, $ForgeJarTarget)
}

# ==============================================================================
# 7. CREATE LAUNCH WRAPPER (only if it doesn't exist)
# ==============================================================================
if (-not (Test-Path $LaunchWrapper)) {
    Write-Host "[INFO] Creating PowerShell launch wrapper..." -ForegroundColor Cyan
    $WrapperContent = @'
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
'@

    $WrapperContent | Out-File $LaunchWrapper -Encoding UTF8 -Force
    Write-Host "[SUCCESS] PowerShell launch wrapper created at: $LaunchWrapper" -ForegroundColor Green
} else {
    Write-Host "[INFO] Launch wrapper already exists, skipping creation." -ForegroundColor Gray
}

# ==============================================================================
# 8. LAUNCHER PROFILE INJECTION
# ==============================================================================
if (Test-Path $LauncherProfiles) {
    $LauncherData = Get-Content $LauncherProfiles -Raw | ConvertFrom-Json
    $CurrentTime = (Get-Date).ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffZ")

    # Create a batch file launcher that Minecraft will call instead of java.exe
    $LauncherBat = Join-Path $PackRoot "launcher.bat"
    $LauncherBatContent = @"
@echo off
:: Show PowerShell updater in a separate visible window and WAIT for it to finish
start "Synchrocraft Updater" /WAIT powershell.exe -ExecutionPolicy Bypass -NoProfile -Command "& '$($LaunchWrapper.Replace('\','\\'))'"

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
"@
    $LauncherBatContent | Out-File $LauncherBat -Encoding ASCII -Force

    $NewProfile = [PSCustomObject]@{
        name          = "Synchrocraft"
        type          = "custom"
        gameDir       = $PackRoot
        javaDir       = $LauncherBat  # Point to the BAT file
        javaArgs      = $JvmArgs
        lastVersionId = $ForgeVersionID
        icon          = "Grass"
        created       = $CurrentTime
        lastUsed      = $CurrentTime
    }

    if ($null -eq $LauncherData.profiles.PSObject.Properties["Synchrocraft"]) {
        $LauncherData.profiles | Add-Member -MemberType NoteProperty -Name "Synchrocraft" -Value $NewProfile
    } else {
        $LauncherData.profiles.Synchrocraft = $NewProfile
    }

    $LauncherData | ConvertTo-Json -Depth 100 | Set-Content $LauncherProfiles
    Write-Host "[SUCCESS] Launcher profile updated." -ForegroundColor Green
}

Write-Host "`n========================================" -ForegroundColor Green
Write-Host "  Synchrocraft is ready to play!" -ForegroundColor Green
Write-Host "========================================`n" -ForegroundColor Green

# Exit cleanly (no pause when called from wrapper)
exit 0