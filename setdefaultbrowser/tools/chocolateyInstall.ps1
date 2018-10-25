$ErrorActionPreference = 'Stop'

$packageName = 'setdefaultbrowser'
$url32       = 'https://kolbi.cz/SetDefaultBrowser.zip'
$checksum32  = '7aa596efef5635589da4ceba36dfa9555deab6df5093be109b1ca5eef6c63681'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs