$ErrorActionPreference = 'Stop'

$packageName = 'copyfilename'
$url32       = 'http://www.bullzip.com/download/cfn/CopyFileName_2_2_0_22.exe'
$checksum32  = 'd8dce9f5ac0de5c01624e177a9fd4ae451fe983dc357f2198af14ad52f315786'

$packageArgs = @{
  packageName            = $packageName
  fileType               = 'exe'
  url                    = $url32
  silentArgs             = '/VERYSILENT'
  checksum               = $checksum32
  checksumType           = 'sha256'
  validExitCodes         = @(0)
  registryUninstallerKey = $packageName
}

Install-ChocolateyPackage @packageArgs
