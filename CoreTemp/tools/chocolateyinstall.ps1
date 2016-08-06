$packageName= 'coretemp'
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        =  '{{DownloadUrl}}'
$url64      =  '{{DownloadUrlx64}}'

Install-ChocolateyZipPackage -PackageName "$packageName" -url "$url" "$toolsDir" -url64 "$url64"
  
$FileFullPath = get-childitem $toolsDir -recurse -include *.exe | select -First 1
    
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Core Temp.lnk" $FileFullPath