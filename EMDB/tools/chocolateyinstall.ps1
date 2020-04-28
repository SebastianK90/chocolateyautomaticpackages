$ErrorActionPreference = 'Stop'

$packageName = 'emdb'
$fileType    = 'EXE'
$url32       = 'https://www.emdb.eu/bin/emdb.zip'
$checksum32  = 'F94392D4F4D2C3F8A722F1FACD0BE9929A83F7024CDE36B5459CD87F74742762'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$silentArgs  = '/VERYSILENT'
$options =
@{
  Headers = @{
    'GET' = 'https://www.emdb.eu/bin/emdb.zip HTTP/1.1'
    'Accept' = 'text/html, application/xhtml+xml, image/jxr, */*'
    'Referer'= 'https://www.emdb.eu/downloads.html'
    'Accept-Language'= 'de-DE,de;q=0.5'
    'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko'
    'Accept-Encoding' = 'gzip, deflate'
    'Pragma' = 'no-cache'
    'DNT' = '1'
  }
}

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs -options $options

$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
 
Install-ChocolateyInstallPackage  $packageName $fileType $silentArgs $FileFullPath
