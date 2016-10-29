$uninstall= 'hklm:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ImDiskApp'
$uninstall_exe = ((Get-ItemProperty -Path $uninstall).uninstallstring).trimend(' /u')
Uninstall-ChocolateyPackage -PackageName 'imdisk-toolkit' -FileType 'EXE' -SilentArgs '/silentuninstall' -File $uninstall_exe