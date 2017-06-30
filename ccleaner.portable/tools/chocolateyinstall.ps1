$ErrorActionPreference = 'Stop'

$packageName = 'ccleaner.portable'
$url32       = 'https://www.piriform.com/ccleaner/download/portable/downloadfile'
$checksum32  = 'FD1771770EC4DEE89079FA5CE6AFF16500511B2CD18D42795808BA149B09157A'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
$bits = Get-ProcessorBits
$ccleaner_temp = "$env:USERPROFILE\ccleaner_temp"

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

$iniFile = Join-Path $toolsPath 'ccleaner.ini'
 
# Automatic language selection
$LCID = (Get-Culture).LCID
$iniContent = @"
[Options]
WipeFreeSpaceDrives=C:\
CookiesToSave=*.piriform.com
RunICS=0
Monitoring=0
CheckTrialOffer=0
WINDOW_LEFT=560
WINDOW_TOP=220
WINDOW_WIDTH=800
WINDOW_HEIGHT=600
WINDOW_MAX=0
Language=$LCID
"@
 
# Create the ini file for the installer
New-Item $iniFile -type file -force -value $iniContent


Install-ChocolateyZipPackage @packageArgs

if($bits -ne 64)
    {
    $FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
    }
else
    {
    $FileFullPath = get-childitem $toolsPath -recurse -include *64*.exe | select -First 1
    }

Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CCleaner.lnk" $FileFullPath

if(Test-Path $ccleaner_temp)
    {
    Move-Item (Get-ChildItem $ccleaner_temp) -Destination $toolsPath -Force
    }
