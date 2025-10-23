# dev-refresh.ps1
# Simple local sync script for Windows PowerShell
# Mirrors fly-core, fly-assets, and fly-devops builds into fly-game

$ErrorActionPreference = "Stop"

# Get paths
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Root = Split-Path $Root           # go up from /scripts
$Workspace = Split-Path $Root      # parent with all repos

Write-Host "🧭 Workspace path: $Workspace"

# --- Helper: Copy folder safely ---
function Copy-Folder($src, $dest) {
    if (Test-Path $dest) { Remove-Item $dest -Recurse -Force }
    New-Item -ItemType Directory -Path $dest | Out-Null
    Copy-Item "$src\*" $dest -Recurse -Force -ErrorAction SilentlyContinue
}

# 1) Update private repos
foreach ($repo in @("fly-core","fly-assets","fly-devops")) {
    $path = Join-Path $Workspace $repo
    if (Test-Path $path) {
        Write-Host "==> Updating $repo"
        Push-Location $path
        git pull --rebase
        Pop-Location
    } else {
        Write-Warning "Repo $repo not found."
    }
}

# 2) Build fly-core
$CorePath = Join-Path $Workspace "fly-core"
if (Test-Path $CorePath) {
    Write-Host "==> Building fly-core"
    Push-Location $CorePath
    pnpm install
    pnpm build
    Pop-Location
    Copy-Folder "$CorePath\dist" "$Root\core"
}

# 3) Copy fly-assets → /fly-game/assets
$AssetsPath = Join-Path $Workspace "fly-assets"
if (Test-Path "$AssetsPath\public") {
    Write-Host "==> Syncing fly-assets"
    Copy-Folder "$AssetsPath\public" "$Root\assets"
}

# 4) Copy fly-devops → /fly-game/infra
$DevopsPath = Join-Path $Workspace "fly-devops"
if (Test-Path $DevopsPath) {
    Write-Host "==> Syncing fly-devops (infra)"
    foreach ($p in @("helm","k8s","docker")) {
        if (Test-Path "$DevopsPath\$p") {
            Copy-Folder "$DevopsPath\$p" "$Root\infra\$p"
        }
    }
}

Write-Host "✅ Done. Artifacts ready in fly-game."
