$packageName = 'imdisk-toolkit'
$fileType = 'exe'
$silentArgs = " /silentuninstall"
$uninstall = Get-UninstallRegistryKey -softwareName "ImDisk Toolkit"

Uninstall-ChocolateyPackage -packageName $packageName -fileType $fileType -silentArgs $silentArgs -file $uninstall.UninstallString.TrimEnd("/u").replace('"','')