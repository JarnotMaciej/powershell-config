# Define variables
$GitHubRepoUrl = "http://192.168.21.8:3000/gituser/pwsh-setup"
$ConfigDirectory = "$env:USERPROFILE\.config\powershell"
$ProfileFile = `$PROFILE.ps1`
$UserConfigFile = "user_profile.ps1"
$FunctionsFile = "functions.ps1"

# Function to download files from GitHub
function Invoke-GitHubDownload {
    param (
        [string]$RepoUrl,
        [string]$FilePath
    )

    $Url = "$RepoUrl/raw/main/$FilePath"
    $OutputFile = "$ConfigDirectory\$FilePath"
    
    Invoke-RestMethod $Url -OutFile $OutputFile -ErrorAction SilentlyContinue
}

# Create config directory if it doesn't exist
if (!(Test-Path -Path $ConfigDirectory -PathType Container)) {
    New-Item -Path $ConfigDirectory -ItemType Directory
}

# Set execution policy to bypass
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Downloading dependencies -> oh-my-posh, Terminal-Icons, PSReadLine
winget --silent install JanDeDobbeleer.OhMyPosh -y
winget --silent install Git.Git -y
Install-Module -Name Terminal-Icons -Force -SkipPublisherCheck -Scope CurrentUser
Install-Module -Name PSReadLine -Force -SkipPublisherCheck -Scope CurrentUser

# Put the contenst of $PROFILE in repo into the user's profile
if (!(Test-Path -Path $ProfileFile)) {
    New-Item -Path $ProfileFile -ItemType File
}
Invoke-RestMethod $GitHubRepoUrl/raw/main/$ProfileFile -OutFile $ProfileFile -ErrorAction SilentlyContinue

# Download user profile and functions files from GitHub
Invoke-GitHubDownload -RepoUrl $GitHubRepoUrl -FilePath $UserConfigFile
Invoke-GitHubDownload -RepoUrl $GitHubRepoUrl -FilePath $FunctionsFile

# Setting git aliases
git config --global alias.s "status -sb"
git config --global alias.nb "checkout -b"
git config --global alias.last "log -1 HEAD --stat"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

# Apply configurations to new profile
. "$ConfigDirectory\$UserConfigFile"

# Inform user that setup is complete
Write-Host "Setup complete. Please restart PowerShell to apply changes."
