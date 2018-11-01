$ErrorActionPreference = 'Stop'

$packageName = 'mpc-be'
$fileType    = 'EXE'
$url32       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Release%20builds/1.5.2/MPC-BE.1.5.2.x86-installer.zip/download'
$url64       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Release%20builds/1.5.2/MPC-BE.1.5.2.x64-installer.zip/download'
$checksum32  = 'd5ed4d24ba9fa27647abc011b2dda4ee6feb01946595602aefa32a68d83f6c2d'
$checksum64  = '6df7fbca20e21cb93c5835c0f59df3ad19400d824c887ab0453bd0b9186c9fe5'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$silentArgs  = '/VERYSILENT /NORESTART /SUPPRESSMSGBOXES /SP-'

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs

$FileFullPath = Get-ChildItem $toolsPath -Recurse -Include *.exe | Sort-Object -Descending | Select-Object -First 1
 
Install-ChocolateyInstallPackage  $packageName $fileType $silentArgs $FileFullPath

$regkey = Get-InstallRegistryKey "MPC-BE*"
Install-ChocolateyPath $regkey.InstallLocation
