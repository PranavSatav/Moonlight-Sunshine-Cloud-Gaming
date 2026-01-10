$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$dataFile = "$root\..\MoonlightWeb\server\data.json"

# Wait until data.json exists (user must login once)
for ($i = 0; $i -lt 15; $i++) {
    if (Test-Path $dataFile) { break }
    Start-Sleep -Seconds 2
}

if (!(Test-Path $dataFile)) {
    Write-Host "data.json not found, skipping host seeding"
    exit
}

$json = Get-Content $dataFile -Raw | ConvertFrom-Json

# Find admin user
$adminUser = $null
foreach ($userProp in $json.users.PSObject.Properties) {
    if ($userProp.Value.name -eq "admin") {
        $adminUser = $userProp
        break
    }
}

if (-not $adminUser) {
    Write-Host "Admin user not found, skipping"
    exit
}

# Ensure hosts object exists under admin
if (-not $adminUser.Value.hosts) {
    $adminUser.Value | Add-Member -MemberType NoteProperty -Name hosts -Value @{}
}

# Add Sunshine host if missing
if (-not $adminUser.Value.hosts.PSObject.Properties["sunshine-local"]) {
    $adminUser.Value.hosts | Add-Member -MemberType NoteProperty -Name "sunshine-local" -Value @{
        name    = "Sunshine-PC"
        address = "localhost"
        port    = 47989
    }

    $json | ConvertTo-Json -Depth 10 | Set-Content $dataFile -Encoding UTF8
    Write-Host "Sunshine host added for admin user"
} else {
    Write-Host "Sunshine host already exists for admin"
}
