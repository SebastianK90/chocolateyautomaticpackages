$packageName = 'telegram.portable'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.3.14/tportable.1.3.14.zip'
$checksum = 'f26ff2acf8293e6bb47b5bf3201b22e1e4f34c6361af4ba3f010cb3fdd27fe6e'
$checksumType = 'sha256'

Install-ChocolateyZipPackage -PackageName "$packageName" `
                             -Url "$url" `
                             -UnzipLocation "$toolsDir" `
                             -Checksum "$checksum" `
                             -ChecksumType "$checksumType"