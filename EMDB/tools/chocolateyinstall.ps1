  $packageName= 'emdb'
  $toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $fileType = 'exe'
  $silentArgs = '/verysilent /norestart'
  $url        =  '{{DownloadUrl}}'

  Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir"
  
  $FileFullPath = get-childitem $toolsDir -recurse -include *.exe | select -First 1

  Install-ChocolateyPackage $packageName $fileType $silentArgs "$FileFullPath"
  Remove-Item $FileFullPath -Force
    
   