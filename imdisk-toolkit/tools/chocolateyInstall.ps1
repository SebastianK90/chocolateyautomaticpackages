$packageName = 'imdisk-toolkit'
$fileType = 'exe'
$silentArgs = '/fullsilent'
$url = '{{DownloadUrl}}'
Install-ChocolateyPackage "$packageName" "$fileType" "$silentArgs" "$url"