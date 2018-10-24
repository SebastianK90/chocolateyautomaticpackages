$ErrorActionPreference = 'Stop'

$packageName = 'setuserfta'
$url32       = 'https://kolbi.cz/SetUserFTA.zip'
$checksum32  = 'D551295C779BDB3750DDBA8E781C21A3DD42A55578F818E9C789B2BA1B4DCF47'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs