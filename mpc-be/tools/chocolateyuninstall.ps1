$uninstall = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall  |
    Get-ItemProperty |
        Where-Object {$_.DisplayName -match "mpc-be" } |
            Select-Object -Property DisplayName, UninstallString

ForEach ($ver in $uninstall) {

    If ($ver.UninstallString) {

        $uninst = $ver.UninstallString
	Uninstall-ChocolateyPackage -PackageName 'mpc-be' -FileType 'EXE' -SilentArgs '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /unregall' -File $uninst
    }

}