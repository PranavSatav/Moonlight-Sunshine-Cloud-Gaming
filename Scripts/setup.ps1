# ---------------------------------------------
# Auto-elevate to Administrator if not already
# ---------------------------------------------
if (-not ([Security.Principal.WindowsPrincipal] `
    [Security.Principal.WindowsIdentity]::GetCurrent()
).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {

    Write-Host "Restarting script as Administrator..."
    Start-Process powershell.exe `
        -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" `
        -Verb RunAs
    exit
}
Write-Host ""
Write-Host "==============================================="
Write-Host "  One-Click Sunshine + Moonlight Web Setup"
Write-Host "==============================================="
Write-Host ""

$root = Split-Path -Parent $MyInvocation.MyCommand.Path

# Paths
$sunshineInstaller = "$root\..\Sunshine\SunshineInstaller.exe"
$sunshineExe       = "C:\Program Files\Sunshine\sunshine.exe"
$startMoonlightBat = "$root\start_moonlight_web.bat"

# ------------------------------------------------
# 1. Install Sunshine
# ------------------------------------------------
Write-Host "[1/3] Installing Sunshine..."
Start-Process $sunshineInstaller -ArgumentList "/S" -Wait

# ------------------------------------------------
# 2. Launch Sunshine (first run)
# ------------------------------------------------
Write-Host "[2/3] Launching Sunshine..."
if (Test-Path $sunshineExe) {
    Start-Process $sunshineExe
} else {
    Write-Host "ERROR: sunshine.exe not found"
}

# ------------------------------------------------
# 3. Start Moonlight Web server
# ------------------------------------------------
Write-Host "[3/3] Starting Moonlight Web..."
Start-Process cmd.exe -ArgumentList "/c `"$startMoonlightBat`"" -WindowStyle Normal
Start-Sleep -Seconds 3

# ------------------------------------------------
# Open Web UIs
# ------------------------------------------------
Start-Process "https://localhost:47990"
Start-Process "http://localhost:8080"

Write-Host ""
Write-Host "------------------------------------------------"
Write-Host "MANUAL STEP (REQUIRED - ONE TIME ONLY)"
Write-Host "------------------------------------------------"
Write-Host ""
Write-Host "1) Sunshine setup (browser tab):"
Write-Host "   - Set username: admin"
Write-Host "   - Set password: Aeiou@123"
Write-Host ""
Write-Host "2) Moonlight Web (browser tab):"
Write-Host "   - Login with admin / Aeiou@123"
Write-Host "   - Click '+'"
Write-Host "   - Host: localhost"
Write-Host "   - Port: 47989"
Write-Host "   - Enter PIN shown in Sunshine"
Write-Host ""
Write-Host "After completing ALL steps above,"
Write-Host "come back here and press ENTER."
Write-Host "------------------------------------------------"
Write-Host ""

# Pause intentionally
Read-Host "Press ENTER to finish setup"

Write-Host ""
Write-Host "==============================================="
Write-Host " SETUP COMPLETE"
Write-Host "==============================================="
Write-Host ""
Write-Host "From now on:"
Write-Host "- Moonlight Web will remember the host"
Write-Host "- You will NOT need to add it again"
Write-Host "- Streaming will work instantly"
Write-Host ""
