$ErrorActionPreference = 'Stop'

$packageName = 'mpc-be'
$fileType    = 'EXE'
$url32       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Release%20builds/1.5.0/MPC-BE.1.5.0.x86-installer.zip/download'
$url64       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Release%20builds/1.5.0/MPC-BE.1.5.0.x64-installer.zip/download'
$checksum32  = '685ddccd0e83c1d302dca1b05db02d3e276ef5af16c67612da52b2a93e901336'
$checksum64  = '8092b43baab7123f8cbebbeccebf086992a939ef62b092b38398d3db09fa20eb'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$silentArgs  = '/VERYSILENT /COMPONENTS="main,mpciconlib,mpcresources"'

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

$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
 
Install-ChocolateyInstallPackage  $packageName $fileType $silentArgs $FileFullPath

$uninstall = Get-ChildItem -ErrorAction SilentlyContinue -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall |
    Get-ItemProperty |
        Where-Object {$_.DisplayName -match "mpc-be" } |
            Select-Object -Property DisplayName, UninstallString
 
$installpath = ($uninstall.UninstallString).Replace('unins000.exe','')
$bits = Get-ProcessorBits
if ($bits -eq 64)
{
Install-ChocolateyPath $installpath
}
else
{
Install-ChocolateyPath $installpath
}
