$packageName = 'gpmdp'
$fileType = 'exe'
$silentArgs = '/install /quiet /norestart'
$url = '{{DownloadUrl}}'
$url64 = '{{DownloadUrlx64}}'
Install-ChocolateyPackage "$packageName" "$fileType" "$silentArgs" "$url" "$url64"