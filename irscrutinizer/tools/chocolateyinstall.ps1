$ErrorActionPreference = 'Stop'

$packageName = 'irscrutinizer'
$url32       = 'https://github.com/bengtmartensson/harctoolboxbundle/releases/download/Version-1.4/IrScrutinizer-1.4.exe'
$checksum32  = '4e11cbdb6a267bef662926730c1117f861fd948156fc939c1e267b5bb19a369b'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs
