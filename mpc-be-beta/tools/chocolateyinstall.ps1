$ErrorActionPreference = 'Stop'

$packageName = 'mpc-be'
$fileType    = 'EXE'
$url32       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Nightly%20Builds%20%28from%20svn%20trunk%29/1.5.2%20%28build%203973%29%20beta/MPC-BE.1.5.2.3973.x86-installer.zip/download'
$url64       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Nightly%20Builds%20%28from%20svn%20trunk%29/1.5.2%20%28build%203973%29%20beta/MPC-BE.1.5.2.3973.x64-installer.zip/download'
$checksum32  = '2D806AF7DFBB922308232896CE1CB370E40D0C17A7B8734C2040482AAAD50AA1'
$checksum64  = '4CE2B4C9C6F43210B473CEA522BCE38C9968682A7F8203C47A90C9D48CA39B27'
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