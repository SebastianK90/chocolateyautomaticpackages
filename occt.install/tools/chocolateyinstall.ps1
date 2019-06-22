$ErrorActionPreference = 'Stop'

$packageName = 'occt.install'
$url32       = 'http://www.ocbase.com/download.php'
$checksum32  = '6dcc44600bf63f487a9973980c93fa61749a57850f25b8799eb4bdaf92624dd2'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/S'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}
Install-ChocolateyPackage @packageArgs
