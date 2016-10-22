$ErrorActionPreference = 'Stop'

$packageName = 'mpc-be'
$fileType    = 'EXE'
$url32       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Release%20builds/1.4.6/MPC-BE.1.4.6.x86-installer.zip/download'
$url64       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Release%20builds/1.4.6/MPC-BE.1.4.6.x64-installer.zip/download'
$checksum32  = '0742e0573466854ecfa608742014b15dfac20d24d5e5214e2fa0533b76e8b1c7'
$checksum64  = '3b285fccf8a2ff20dd10bf2183981e53b42a9f7241f085841a6a0861d596d7cd'
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
