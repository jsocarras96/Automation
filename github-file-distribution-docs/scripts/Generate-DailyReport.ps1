# ==========================================
# MASTER LOCATION LIST
# ==========================================
$MasterLocations = @(
    
    "Location-01",
    "Location-02",
    "Location-03",
    "Location-04",
    "Location-05"
)

# ==========================================
# GITHUB CONFIGURATION
# ==========================================
$RepoOwner = "your-github-username"
$RepoName  = "your-repository-name"

# Current date (daily folder)
$TodayDate = Get-Date -Format "yyyy-MM-dd"

# Path where logs are stored
$Uri = "https://api.github.com/repos/$RepoOwner/$RepoName/contents/Log/$TodayDate"

try {

    # Read files from GitHub
    $FilesInGithub = Invoke-RestMethod -Uri $Uri -Method Get

    # Extract names WITHOUT .txt
    $ConfirmedLocations = $FilesInGithub.name |
        Where-Object { $_ -like "*.txt" } |
        ForEach-Object { $_.Replace(".txt","") }

}
catch {

    Write-Host "Could not read today's folder from GitHub." -ForegroundColor Red
    Exit

}

# ==========================================
# COMPARE LOCATIONS
# ==========================================
$MissingLocations = Compare-Object `
    -ReferenceObject $MasterLocations `
    -DifferenceObject $ConfirmedLocations `
    -PassThru |
    Where-Object { $_.SideIndicator -eq "<=" }

# ==========================================
# FINAL RESULT
# ==========================================
if ($MissingLocations.Count -gt 0) {

    Write-Host ""
    Write-Host "ALERT: These locations did NOT report today:" -ForegroundColor Red
    Write-Host ""

    foreach ($Location in $MissingLocations) {
        Write-Host " - $Location" -ForegroundColor Yellow
    }

    Write-Host ""
    Write-Host "Do NOT delete the PLU_Update.txt file yet." -ForegroundColor Magenta

}
else {

    Write-Host ""
    Write-Host "TOTAL SUCCESS!" -ForegroundColor Green
    Write-Host "All locations reported successfully." -ForegroundColor Green
    Write-Host ""
    Write-Host "You can safely delete PLU_Update.txt." -ForegroundColor Cyan

}

pause
