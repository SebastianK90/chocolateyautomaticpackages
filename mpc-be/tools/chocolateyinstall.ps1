$ErrorActionPreference = 'Stop'

$packageName = 'mpc-be'
$fileType    = 'EXE'
$url32       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Release%20builds/1.5.1/MPC-BE.1.5.1.x86-installer.zip/download'
$url64       = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Release%20builds/1.5.1/MPC-BE.1.5.1.x64-installer.zip/download'
$checksum32  = 'b1c429d0e6f92f42edd54a15b588c141e8fcd43c80ebad81970c567b547d3460'
$checksum64  = 'fc989957446fb24900c9c22443e8e7a2d8aad5d569b0abaef20a7a26770dbbfb'
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
