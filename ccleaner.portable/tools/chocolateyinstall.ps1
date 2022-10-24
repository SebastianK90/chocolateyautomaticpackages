$ErrorActionPreference = 'Stop'

$packageName = 'ccleaner.portable'
$url32       = 'https://download.ccleaner.com/portable/ccsetup605.zip'
$checksum32  = '957a9955e6179f6bd70fd1021acb9aee7d8eb0b613a3c80f175f71290063dd49'
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
    $FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
    }
else
    {
    $FileFullPath = get-childitem $toolsPath -recurse -include *64*.exe | select -First 1
    }

Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CCleaner.lnk" $FileFullPath -WorkingDirectory "$toolsPath"

if(Test-Path $ccleaner_temp)
    {
    Move-Item (Get-ChildItem $ccleaner_temp) -Destination $toolsPath -Force
    }
