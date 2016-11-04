$packageName = 'mpc-be'
$fileType = 'exe'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /unregall'
$uninstall = Get-UninstallRegistryKey -softwareName "MPC-BE*"

Uninstall-ChocolateyPackage -packageName $packageName -fileType $fileType -silentArgs $silentArgs -file $uninstall.UninstallString.Replace('"','')