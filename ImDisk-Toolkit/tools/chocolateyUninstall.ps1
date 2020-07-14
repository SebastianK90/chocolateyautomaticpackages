$ErrorActionPreference = 'Stop'

$uninstall = Get-UninstallRegistryKey -softwareName "ImDisk Toolkit"

$packageArgs = @{
    PackageName = $env:ChocolateyPackageName
    FileType    = 'EXE'
    SilentArgs  = ' /silentuninstall'
    File        = $uninstall.UninstallString.TrimEnd("/u").replace('"', '')
}

Uninstall-ChocolateyPackage @packageArgs