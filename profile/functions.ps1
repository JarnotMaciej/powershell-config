# password generator
Function Get-Password {
    param (
        [int]$Length = (Get-Random -Minimum 15 -Maximum 21)
    )

    $CharacterSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%^&*()_+"

    $Password = ""
    $Random = New-Object System.Random

    1..$Length | ForEach-Object {
        $RandomIndex = $Random.Next(0, $CharacterSet.Length)
        $Password += $CharacterSet[$RandomIndex]
    }

    return $Password
}

# bitlocker like passphrase generator
Function Get-BitLockerPassphrase {
    $CharacterSet = "0123456789"

    $Passphrase = ""
    $Random = New-Object System.Random

    # 8 groups of 6 digits
    1..8 | ForEach-Object {
        1..6 | ForEach-Object {
            $RandomIndex = $Random.Next(0, $CharacterSet.Length)
            $Passphrase += $CharacterSet[$RandomIndex]
        }

        if ($_ -ne 8) {
            $Passphrase += "-"
        }
    }

    return $Passphrase
}

Function Wait-Computer
{
  Add-Type -Assembly System.Windows.Forms
  $state = [System.Windows.Forms.PowerState]::Suspend
  [System.Windows.Forms.Application]::SetSuspendState($state, $false, $false) | Out-Null
}

function top
{
    Get-Process | Sort-Object -Descending CPU | Format-Table -AutoSize
}


# aliases
Set-Alias psw Get-Password
Set-Alias zzz Wait-Computer
Set-Alias htop top
Set-Alias blp Get-BitLockerPassphrase