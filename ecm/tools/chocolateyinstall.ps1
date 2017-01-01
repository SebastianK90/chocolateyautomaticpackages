$ErrorActionPreference = 'Stop'
 
$packageName = 'ecm'
$url32       = 'http://www.sordum.org/files/downloads.php?easy-context-menu'
$checksum32  = '4300C60F3C3A60C6CA13E71822F374B74C0A3B7CB30B98D93281257A82A8FA7E'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition
$options =
@{
  Headers = @{
    'Accept' = 'text/html, application/xhtml+xml, image/jxr, */*';
    'Accept-Language' = 'de-DE,de;q=0.5';
    'Referer' = 'http://www.sordum.org/7615/';
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

$FileFullPath = get-childitem $toolsPath -Recurse -Filter "EcMenu*" -include *.exe | select -First 2

$bits = Get-ProcessorBits
if ($bits -eq 64)
{
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Easy Context Menu.lnk" $FileFullPath[1]
}
else
{
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Easy Context Menu.lnk" $FileFullPath[0]
}
