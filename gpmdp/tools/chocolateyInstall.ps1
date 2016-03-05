$packageName = 'gpmdp'
$fileType = 'exe'
$silentArgs = '/silent'
$url = '{{DownloadUrl}}'
$url64 = '{{DownloadUrlx64}}'
Install-ChocolateyPackage "$packageName" "$fileType" "$silentArgs" "$url" "$url64"