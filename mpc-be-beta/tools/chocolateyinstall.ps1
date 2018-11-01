$ErrorActionPreference = 'Stop'

$packageName = 'mpc-be'
$fileType    = 'EXE'
$url32       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Nightly%20Builds%20%28from%20svn%20trunk%29/1.5.2%20%28build%203973%29%20beta/MPC-BE.1.5.2.3973.x86-installer.zip/download'
$url64       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Nightly%20Builds%20%28from%20svn%20trunk%29/1.5.2%20%28build%203973%29%20beta/MPC-BE.1.5.2.3973.x64-installer.zip/download'
$checksum32  = '2d806af7dfbb922308232896ce1cb370e40d0c17a7b8734c2040482aaad50aa1'
$checksum64  = '4ce2b4c9c6f43210b473cea522bce38c9968682a7f8203c47a90c9d48ca39b27'
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
