  $packageName= 'ChanSort'
  $toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $url        =  '{{DownloadUrl}}'

  Install-ChocolateyZipPackage -PackageName "$packageName" -Url "$url" "$toolsDir"
  
  $FileFullPath = get-childitem $toolsDir -recurse -include *.exe | select -First 1
    
  Install-ChocolateyShortcut -shortcutFilePath "$env:USERPROFILE\Desktop\ChanSort.lnk" $FileFullPath
 
