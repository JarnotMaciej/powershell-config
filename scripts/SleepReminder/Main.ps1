# # Sleep Reminder Script

# $title = "Bedtime Reminder"
# $message = "Time to wind down. Your future self will thank you for getting good sleep tonight."

# Add-Type -AssemblyName System.Windows.Forms
# [System.Windows.Forms.MessageBox]::Show($message, $title)

Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.WindowState = [System.Windows.Forms.FormWindowState]::Maximized
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
$form.BackColor = [System.Drawing.Color]::Black

$labelBedtime = New-Object System.Windows.Forms.Label
$labelBedtime.Text = "Time for bed! Your future self will thank you."
$labelBedtime.ForeColor = [System.Drawing.Color]::White
$labelBedtime.Font = New-Object System.Drawing.Font("Arial", 36, [System.Drawing.FontStyle]::Bold)
$labelBedtime.AutoSize = $true
$labelBedtime.Anchor = [System.Windows.Forms.AnchorStyles]::None
$labelBedtime.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter

$labelWarning = New-Object System.Windows.Forms.Label
$labelWarning.Text = "WARNING: Save your work! PC will shut down in 10 minutes!"
$labelWarning.ForeColor = [System.Drawing.Color]::Yellow
$labelWarning.Font = New-Object System.Drawing.Font("Arial", 24, [System.Drawing.FontStyle]::Bold)
$labelWarning.AutoSize = $true
$labelWarning.Anchor = [System.Windows.Forms.AnchorStyles]::None
$labelWarning.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter

$form.Controls.AddRange(@($labelBedtime, $labelWarning))

$form.Add_Shown({
    $labelBedtime.Left = ($form.ClientSize.Width - $labelBedtime.Width) / 2
    $labelBedtime.Top = ($form.ClientSize.Height - $labelBedtime.Height) / 2 - 100

    $labelWarning.Left = ($form.ClientSize.Width - $labelWarning.Width) / 2
    $labelWarning.Top = $labelBedtime.Bottom + 50
    
    [System.Media.SystemSounds]::Exclamation.Play()
})

$form.Add_KeyPress({
    if ($_.KeyChar -eq [char]13 -or $_.KeyChar -eq [char]27) {
        $form.Close()
    }
})

$form.ShowDialog()