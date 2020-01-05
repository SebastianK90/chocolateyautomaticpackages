$packageArgs = @{
  packageName            = 'tidal'
  fileType               = 'exe'
  silentArgs             = "--uninstall -s"
  file                   = (Get-UninstallRegistryKey -softwareName "Tidal").InstallLocation + "\update.exe"
}
Uninstall-ChocolateyPackage @packageArgs