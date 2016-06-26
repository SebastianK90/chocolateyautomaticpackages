$packageName= 'mpc-be'
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$installerType = 'EXE'
$silentArgs= '/VERYSILENT /COMPONENTS="main,mpciconlib,mpcresources"'
$url        =  '{{DownloadUrl}}'
$url64      =  '{{DownloadUrlx64}}'
Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir" "$url64"
  
$FileFullPath = get-childitem $toolsDir -recurse -include *.exe | select -First 1

Install-ChocolateyInstallPackage  $packageName $installerType $silentArgs "$FileFullPath"
 
$uninstall = Get-ChildItem -ErrorAction SilentlyContinue -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall |
    Get-ItemProperty |
        Where-Object {$_.DisplayName -match "mpc-be" } |
            Select-Object -Property DisplayName, UninstallString
 
$installpath = ($uninstall.UninstallString).Replace('unins000.exe','')
$bits = Get-ProcessorBits
if ($bits -eq 64)
{
Install-ChocolateyPath $installpath
}
else
{
Install-ChocolateyPath $installpath
}