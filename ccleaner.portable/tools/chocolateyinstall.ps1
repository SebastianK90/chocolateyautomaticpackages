$ErrorActionPreference = 'Stop'

$packageName = 'ccleaner.portable'
$url32       = 'https://download.ccleaner.com/portable/ccsetup625.zip'
$checksum32  = '0B880368F9865468090A5B8316F9A4AAA00BA9309CB0D2D6703DAE2CACC887B5'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
$bits = Get-ProcessorBits
$ccleaner_temp = "$env:USERPROFILE\ccleaner_temp"

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}


Install-ChocolateyZipPackage @packageArgs

if($bits -ne 64)
    {
    $FileFullPath = get-childitem $toolsPath -recurse -include 'CCleaner.exe' | select -First 1
    }
else
    {
    $FileFullPath = get-childitem $toolsPath -recurse -include 'CCleaner64.exe' | select -First 1
    }

Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CCleaner.lnk" $FileFullPath -WorkingDirectory "$toolsPath"

if(Test-Path $ccleaner_temp) {
    Move-Item (Get-ChildItem $ccleaner_temp) -Destination $toolsPath -Force
}
