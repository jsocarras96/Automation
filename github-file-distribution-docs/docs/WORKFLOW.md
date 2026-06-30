# Workflow

## File Distribution Workflow

```text
Administrator
    |
    | Uploads updated file
    v
GitHub Repository
    |
    | Remote locations download file
    v
Remote Location Script
    |
    | Compares local and remote file
    v
Local File Updated
    |
    | Sends status report
    v
GitHub Daily Logs
```

## Daily Reporting Workflow

```text
Administrator runs Generate-DailyReport.ps1
    |
    | Reads expected locations
    v
Checks GitHub daily log folder
    |
    | Compares expected vs reported
    v
Displays missing locations
```

## Example Daily Process

1. Upload the new update file to the repository.
2. Wait for all remote locations to run the download script.
3. Run the daily report script.
4. Review missing locations.
5. If all locations reported, the update was successfully distributed.
6. If some locations are missing, check internet access or script execution at those locations.

## When Not All Locations Report

If one or more locations do not report:

- do not delete the current update file yet
- verify internet access at the missing locations
- confirm the scheduled task or script ran correctly
- check whether pending reports exist locally
- run the report again after the missing locations retry

