$ErrorActionPreference = 'Stop'

$packageName = 'aida64-extreme.portable'
$url32       = 'http://download.aida64.com/aida64extreme597.zip'
$checksum32  = '71643adc71ce072af29c3986166a5519cbc438472414a2b268fc2280c3aa1fb6'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
$aida64_temp = "$env:USERPROFILE\aida64_temp"

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -recurse -include aida64.exe | select -First 1
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\AIDA64.lnk" $FileFullPath

if(Test-Path $aida64_temp)
    {
    Move-Item (Get-ChildItem $aida64_temp) -Destination $toolsPath -Force
    }
