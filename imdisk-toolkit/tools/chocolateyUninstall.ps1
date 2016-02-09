$uninstall= 'hklm:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\ImDiskApp'
$uninstall_exe = ((Get-ItemProperty -Path $uninstall).uninstallstring).trimend(' /u')
Start-Process $uninstall_exe -ArgumentList '/silentuninstall'
