# Modules, Basic Aliases
. $env:USERPROFILE\.config\powershell\user_profile.ps1

# Functions
. $env:USERPROFILE\.config\powershell\functions.ps1

# Environment Variables
$env:OPENAI_API_KEY = "sk-..."

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\space.omp.json" | Invoke-Expression

# Clear-Host