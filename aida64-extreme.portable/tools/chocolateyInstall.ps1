$ErrorActionPreference = 'Stop'

$packageName = 'aida64-extreme.portable'
$url32       = 'https://download.aida64.com/aida64extreme692.zip'
$checksum32  = 'cde98c9d6121e789057a422458fc0354bcfd45291cfb3289e585324886caecc8'
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
