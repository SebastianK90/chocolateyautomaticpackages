$packageName = 'gpmdp'
$fileType = 'exe'
$silentArgs = "--uninstall -s"
$uninstall = Get-UninstallRegistryKey -softwareName "Google Play Music Desktop Player"

Uninstall-ChocolateyPackage -packageName $packageName -fileType $fileType -silentArgs $silentArgs -file ($uninstall.InstallLocation + "\update.exe")