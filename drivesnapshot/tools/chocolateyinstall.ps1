$packageName= 'drivesnapshot'
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        =  '{{DownloadUrl}}'
$url64      =  '{{DownloadUrlx64}}'

Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir" "$url64"
 
$FileFullPath = get-childitem $toolsDir -recurse -include *.exe | select -First 1
Install-ChocolateyPath $toolsDir
