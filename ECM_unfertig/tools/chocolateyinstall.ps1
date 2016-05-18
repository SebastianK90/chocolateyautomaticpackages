$packageName= 'ecm'
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url        =  '{{DownloadUrl}}'
$url64      =  '{{DownloadUrlx64}}'
 
Install-ChocolateyZipPackage -PackageName "$packageName" -url "$url" "$toolsDir" -url64 "$url64"
 
 if (Get-ProcessorBits -eq '64')
     
        {
        $FileFullPath = get-childitem $toolsDir -recurse -include EcMenu_x64.exe | select -First 1
        }
    else 
        {
        $FileFullPath = get-childitem $toolsDir -recurse -include EcMenu.exe | select -First 1
        }
    
    
Install-ChocolateyShortcut -shortcutFilePath "$env:USERPROFILE\Desktop\Easy Context Menu.lnk" $FileFullPath