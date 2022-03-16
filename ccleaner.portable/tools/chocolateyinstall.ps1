$ErrorActionPreference = 'Stop'

$packageName = 'ccleaner.portable'
$url32       = 'https://download.ccleaner.com/portable/ccsetup591.zip'
$checksum32  = 'ed4855acc0239c7e1c5dd4554a6e360173f23458832420000445a20fa3fc6450'
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
