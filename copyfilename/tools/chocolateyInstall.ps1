$packageName = 'copyfilename'
$installerType = 'EXE'
$silentArgs = '/VERYSILENT'
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url = '{{DownloadUrl}}'
Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir"
 
$FileFullPath = get-childitem $toolsDir -recurse -include *.exe | select -First 1
    
Install-ChocolateyInstallPackage "$packageName" "$installerType" "$silentArgs" "$FileFullPath"
Remove-Item "$FileFullPath"
