$ErrorActionPreference = 'Stop'

$packageName = 'rambox'
$url32       = 'https://github.com/ramboxapp/community-edition/releases/download/0.6.4/Rambox-0.6.4-win-ia32.zip'
$url64       = 'https://github.com/ramboxapp/community-edition/releases/download/0.6.4/Rambox-0.6.4-win-x64.zip'
$checksum32  = '5465171aae0ae53f6f522c4caffd42b551d06544f74732baf9362a30507be472'
$checksum64  = '4ca8345a6c9890a2b8b68f788ede083cfb61a171d7ca7ac6cb523929f25161eb'
$toolsPath   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

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

$FileFullPath = get-childitem $toolsPath -recurse -include Rambox.exe | select -First 1
    
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Rambox.lnk" $FileFullPath -WorkingDirectory "$toolsPath"
