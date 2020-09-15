$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$toolkitPath = Join-Path -Path $toolsPath -ChildPath 'toolkit'
$silentArgs     = '/fullsilent'

$packageArgs = @{
  packageName    = 'ImDisk-Toolkit'
  softwareName   = 'imdisk-toolkit*'
  fileType       = 'zip'
  file           = Get-Item -Path (Join-Path -Path $toolsPath -ChildPath '*_x32.zip')
  file64         = Get-Item -Path (Join-Path -Path $toolsPath -ChildPath '*_x64.zip')

  validExitCodes = @(0)
  destination    = $toolsPath
}

Get-ChocolateyUnzip @packageArgs

$cabFiles = Get-ChildItem -Path $toolsPath\*.cab -Recurse | Sort-Object -Descending | Select-Object -First 1
Get-ChocolateyUnzip -FileFullPath $cabFiles -Destination $toolkitPath
Remove-Item -Path $toolsPath\*.zip -ErrorAction SilentlyContinue

$installer = Get-ChildItem -Path (Join-Path -Path $toolkitPath -ChildPath 'config.exe')
Start-ChocolateyProcessAsAdmin -Statements $silentArgs -ExeToRun $installer

# Remove the folder that contains the .cab file
Get-ChildItem -Path (Join-Path -Path $toolsPath -ChildPath 'ImDiskTk*') | Where-Object PSIsContainer -eq $true | Remove-Item -Recurse -ErrorAction SilentlyContinue
