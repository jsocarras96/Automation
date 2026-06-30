# Configuration Guide

This document explains the main configuration values used by the PowerShell scripts.

## Repository Settings

Update these values to match your GitHub repository:

```powershell
$RepoOwner = "your-github-username"
$RepoName  = "your-repository-name"
$Branch    = "main"
```

## Update File

Define the file that will be downloaded by each location:

```powershell
$FileName = "PLU_Update.txt"
```

Example file types:

- `.txt`
- `.csv`
- `.json`
- `.xml`
- database export files
- configuration files

## Location ID

Each location must use a unique ID:

```powershell
$SiteID = "LOCATION01"
```

Examples:

```text
LOCATION01
STORE001
HOUSTON05
DALLAS12
```

The `SiteID` is used to create the daily report file in GitHub.

## Local Destination

The download script stores the update file locally.

Example:

```powershell
$Destination = "$env:USERPROFILE\Desktop\$FileName"
```

This can be changed to another local folder depending on the system where the file needs to be used.

## Pending Reports

If the script cannot send a report to GitHub, it stores the report locally and tries again later.

Example:

```powershell
$PendingQueue = "$env:ProgramData\IshidaPendingReports.json"
```

This helps avoid losing status reports when a location temporarily loses internet access.

## GitHub Token

The token should be read from an environment variable:

```powershell
$GitHubToken = $env:GITHUB_TOKEN
```

Do not write the token directly inside the script.

