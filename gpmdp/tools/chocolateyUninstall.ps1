$uninstall = Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall, HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall |
    Get-ItemProperty |
        Where-Object {$_.DisplayName -like "*Google Play Music Desktop Player*" } |
            Select-Object -Property DisplayName, UninstallString
 
ForEach ($ver in $uninstall) {
 
    If ($ver.UninstallString) {
 
        $uninst = $ver.UninstallString
        & cmd /c $uninst --uninstall
    }
 
}