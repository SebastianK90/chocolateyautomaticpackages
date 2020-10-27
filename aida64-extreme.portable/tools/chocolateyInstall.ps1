$ErrorActionPreference = 'Stop'

$packageName = 'aida64-extreme.portable'
$url32       = 'https://download.aida64.com/aida64extreme630.zip'
$checksum32  = 'd4ed0c868f74b2eb1143727ae1f0ac80a93ff84f62ff63e811bf91114a8a36f8'
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
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\AIDA64.lnk" $FileFullPath -WorkingDirectory $toolsPath

if(Test-Path $aida64_temp)
    {
    Move-Item (Get-ChildItem $aida64_temp) -Destination $toolsPath -Force
    }
