# Security Policy

## Secrets and Tokens

Do not store GitHub tokens, passwords, API keys, or credentials directly inside PowerShell scripts.

Use environment variables instead:

```powershell
$GitHubToken = $env:GITHUB_TOKEN
```

To configure the token on Windows:

```powershell
setx GITHUB_TOKEN "your_github_token_here"
```

After running `setx`, close and reopen PowerShell so the new environment variable is available.

## If a Token Was Committed

If a GitHub token was accidentally committed to the repository:

1. Revoke the token immediately in GitHub.
2. Generate a new token.
3. Update the local environment variable.
4. Remove the token from the script.
5. Avoid reusing the exposed token.

## Recommended Token Permissions

Use the minimum permissions required for the project.

The token should only have access to the repository where the update file and logs are stored.

Avoid using personal tokens with broad account-level permissions.

## Sensitive Data

Do not publish:

- passwords
- tokens
- private store details
- customer information
- internal network paths
- confidential database content
- private business data

