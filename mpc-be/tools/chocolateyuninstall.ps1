$PackageName = 'mpc-be'
$installerType= 'EXE'
$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /unregall'

Uninstall-ChocolateyPackage -PackageName $PackageName `
                                -FileType $installerType `
                                -SilentArgs "$silentArgs" `