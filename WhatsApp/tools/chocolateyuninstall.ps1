$packageName = 'whatsapp'
$fileType = 'exe'
$silentArgs = "--uninstall -s"
$uninstall = Get-UninstallRegistryKey -softwareName "Whatsapp"

Uninstall-ChocolateyPackage -packageName $packageName -fileType $fileType -silentArgs $silentArgs -file ($uninstall.InstallLocation + "\update.exe")