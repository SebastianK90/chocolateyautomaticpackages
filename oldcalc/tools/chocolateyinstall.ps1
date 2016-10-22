$ErrorActionPreference = 'Stop'

$packageName = 'oldcalc'
$fileType    = 'EXE'
$url32       = 'http://winaero.com/request.php?1795'
$checksum32  = '00c13145cea7bb8bcae3e6e48837edf2237931841207f81116f910818fdde279'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$silentArgs  = '/S'
$options =
@{
  Headers = @{
    'Accept' = 'text/html, application/xhtml+xml, image/jxr, */*';
    'Accept-Language' = 'de-DE,de;q=0.5';
    'Referer' = 'http://winaero.com/download.php?view.1795';
    'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko';
    'Accept-Encoding' = 'gzip, deflate'
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
