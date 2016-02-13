  $packageName= 'cloneapp'
  $toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $url        =  '{{DownloadUrl}}'

  Install-ChocolateyZipPackage $packageName $url $toolsDir
  
  $FileFullPath = get-childitem $toolsDir -Recurse -Filter "CloneApp*" -include *.exe | select -First 1
  
  Install-ChocolateyShortcut -shortcutFilePath "$env:USERPROFILE\Desktop\CloneApp.lnk" $FileFullPath
 
  Install-ChocolateyPath $toolsDir