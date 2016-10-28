[void] [System.Reflection.Assembly]::LoadWithPartialName("'System.Windows.Forms")
$process = $null
$bits = Get-ProcessorBits
if ($bits -eq '64')
    {
    Start-Process "${env:ProgramFiles(x86)}\MP3Gain\uninst-mp3gain.exe"
    }
    else
    {
    Start-Process "$env:ProgramFiles\MP3Gain\uninst-mp3gain.exe"
    }
$processname = 'A~NSISu_'
while($process.MainWindowTitle -eq "MP3Gain Uninstall" -eq $false)
{
    $process = Get-Process $processname -ErrorAction SilentlyContinue
}
[System.Windows.Forms.SendKeys]::SendWait("{LEFT}")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
sleep 2
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
sleep 2
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")