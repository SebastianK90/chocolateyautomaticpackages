$ErrorActionPreference = 'Stop'

$packageName = 'franz-app'
$fileType    = 'EXE'
$url32       = 'https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-win32-ia32-4.0.4.zip'
$url64       = 'https://github.com/meetfranz/franz-app/releases/download/4.0.4/Franz-win32-x64-4.0.4.zip'
$checksum32  = '3a043453d9800cf283b625497d1b0a45787b382b5b0b4cd11a2bbfb40ddc56ad'
$checksum64  = '590488f42eb52eeed6602d67bc8efe917e0ba4f9f4b4edd23c5954726afae676'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$silentArgs  = '--silent'


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

