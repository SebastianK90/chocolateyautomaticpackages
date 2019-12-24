$packageName = 'tidal'
$fileType = 'exe'
$silentArgs = "--uninstall -s"
$uninstall = Get-UninstallRegistryKey -softwareName "Tidal"

Uninstall-ChocolateyPackage -packageName $packageName -fileType $fileType -silentArgs $silentArgs -file ($uninstall.InstallLocation + "\update.exe")