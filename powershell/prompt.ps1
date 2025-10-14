$Reset     = "`e[0m"
$Bold      = "`e[1m"
$BgWhite   = "`e[47m"
$BgBlue    = "`e[44m"
$FgBlack   = "`e[30m"
$FgGreen   = "`e[32m"
$FgYellow  = "`e[33m"
$FgMagenta = "`e[35m"

# --- Helper: Normalize path (replace $HOME with ~)
function Convert-PathForPrompt {
    param (
        [string]$Path
    )

    $userHome = [Environment]::GetFolderPath("UserProfile")
    if ($Path -like "$userHome*") {
        return $Path -replace [regex]::Escape($userHome), "~"
    }

    return $Path
}


# --- Helper: Get Git information
function Get-GitInfo {
    try {
        $gitRoot = git rev-parse --show-toplevel 2>$null
        if ($LASTEXITCODE -ne 0) { return $null }

        $repo = Split-Path $gitRoot -Leaf
        $branch = git rev-parse --abbrev-ref HEAD 2>$null
        $isClean = $false
        git diff --quiet HEAD -- 2>$null
        if ($LASTEXITCODE -eq 0) { $isClean = $true }

        return @{
            Root   = $gitRoot
            Repo   = $repo
            Branch = $branch
            Clean  = $isClean
        }
    } catch {
        return $null
    }
}

# --- Helper: Build path display (normal or Git-based)
function Get-PathDisplay($currentPath, $gitInfo) {
    if (-not $gitInfo) {
        $norm = Convert-PathForPrompt $currentPath
        return "$BgWhite$FgBlack $norm $Reset"
    }

    $gitRoot = $gitInfo.Root
    $repo = $gitInfo.Repo
    $relative = $currentPath.Substring($gitRoot.Length)

    if ($relative -eq "") {
        return "$BgBlue $repo $Reset"
    } else {
        $relNorm = Convert-PathForPrompt $relative
        return "$BgBlue $repo $Reset$BgWhite$FgBlack $relNorm $Reset"
    }
}

# --- Helper: Build branch display
function Get-BranchDisplay($gitInfo) {
    if (-not $gitInfo) { return "" }
    $color = if ($gitInfo.Clean) { $FgGreen } else { $FgYellow }
    return " $color$($gitInfo.Branch)$Reset"
}

# --- The actual prompt function
function prompt {
    $currentPath = (Get-Location).Path
    $gitInfo = Get-GitInfo
    $pathPart = Get-PathDisplay $currentPath $gitInfo
    $branchPart = Get-BranchDisplay $gitInfo
    $symbol = "$Bold$FgMagenta>$Reset"
    "$pathPart$branchPart $symbol "
}
