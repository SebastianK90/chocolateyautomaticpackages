$packageName = 'copyfilename'
$installerType = 'exe'
$url = '{{DownloadUrl}}'
$silentArgs = '/VERYSILENT'
 
Install-ChocolateyPackage "$packageName" "$installerType" "$silentArgs" "$url"