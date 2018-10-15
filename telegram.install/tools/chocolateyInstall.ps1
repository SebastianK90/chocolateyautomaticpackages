$packageName = 'telegram.install'
$installerType = 'exe'
$url = 'https://github.com/telegramdesktop/tdesktop/releases/download/v1.3.10/tsetup.1.3.10.exe'
$checksum = '0ee3249d6b251f848a3b9d7a28c960192c64b31beace9428852c984387832c14'
$checksumType = 'sha256'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$validExitCodes = @(0) 

Install-ChocolateyPackage -PackageName "$packageName" `
                          -FileType "$installerType" `
                          -SilentArgs "$silentArgs" `
                          -Url "$url" `
                          -ValidExitCodes $validExitCodes `
                          -Checksum "$checksum" `
                          -ChecksumType "$checksumType"