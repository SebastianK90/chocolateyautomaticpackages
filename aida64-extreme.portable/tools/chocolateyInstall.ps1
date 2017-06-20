$ErrorActionPreference = 'Stop'

$packageName = 'aida64-extreme.portable'
$url32       = 'http://download.aida64.com/aida64extreme592.zip'
$checksum32  = '2b0b59ac4b26d17981fc19dccac1d78e2d6cbd0efe51c2059d87bf58b7e2dc23'
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
