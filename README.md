# PowerShell Configuration

## SHORT DESCRIPTION

This project contains a set of PowerShell configuration files and scripts that enhance the functionality and user experience of the PowerShell command-line interface. It includes custom functions, aliases, and profile settings to improve productivity and streamline common tasks.

## INSTALLATION

1. Clone the repository to your local machine:
   ```
   git clone https://github.com/JarnotMaciej/powershell-config.git
   ```

2. Navigate to the cloned repository:
   ```
   cd powershell-config
   ```

3. Run the setup script to install the necessary components:
   ```
   .\setup.ps1
   ```

4. Restart your PowerShell session for the changes to take effect.

## USAGE INSTRUCTION

- The `$PROFILE.ps1` file is the main PowerShell profile script that loads the custom functions, aliases, and other settings.
- The `functions.ps1` file contains various custom functions, such as:
  - `Get-Password`: Generates a random password of a specified length.
  - `Get-BitLockerPassphrase`: Generates a BitLocker-style passphrase.
  - `Wait-Computer`: Suspends the computer.
  - `top`: Displays the top running processes by CPU usage.
- The `user_profile.ps1` file includes additional configurations, such as:
  - Loading PowerShell modules (Terminal-Icons, PSReadLine).
  - Configuring PSReadLine options (prediction, view style).
  - Fixing Azure CLI autocompletion.
  - Setting various aliases (vim, git, neofetch, etc.).

To use the custom functions and aliases, simply run the desired command in your PowerShell session. For example:

- `psw` to generate a random password.
- `blp` to generate a BitLocker-style passphrase.
- `zzz` to suspend the computer.
- `htop` to display the top running processes.