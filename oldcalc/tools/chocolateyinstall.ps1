$ErrorActionPreference = 'Stop'

$packageName = 'oldcalc'
$fileType    = 'EXE'
$url32       = 'https://winaero.com/e107_files/downloads/oldcalcwin10.zip'
$checksum32  = '5AF17A5C9D65F95BF543D78C139740CF834A00644B255A6214A16576EB5CAB62'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$silentArgs  = '/S'
$options =
@{
  Headers = @{
    'GET' = 'https://winaero.com/e107_files/downloads/oldcalcwin10.zip HTTP/1.1'
    'Accept' = 'text/html, application/xhtml+xml, image/jxr, */*'
    'Referer' = 'https://winaero.com/download.php?view.1795';
    'Accept-Language' = 'de-DE,de;q=0.5'
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
