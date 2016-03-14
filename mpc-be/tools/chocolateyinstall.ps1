  $packageName= 'mpc-be'
  $toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $installerType = 'EXE'
  $url        =  '{{DownloadUrl}}'
  $url64      =  '{{DownloadUrlx64}}'

  Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir" "$url64"
  
  $FileFullPath = get-childitem $toolsDir -recurse -include *.exe | select -First 1

if ((Get-WmiObject win32_operatingsystem).version -like "6.3.*")
    {
    Install-ChocolateyInstallPackage "$packageName" "$installerType" '/VERYSILENT'  "$FileFullPath"
    cd $toolsdir
     
        if (Get-ProcessorBits -eq '64')
        {
        cmd /c "FOR /F "tokens=* delims=" %G IN (ftypes_x64.txt) DO FTYPE %G"
        cmd /c "FOR /F "tokens=* delims=" %G IN (assoc_x64.txt) DO ASSOC %G"
	    Install-ChocolateyPath "C:\Program Files\MPC-BE x64\"
        }
        else 
        {
        cmd /c "FOR /F "tokens=* delims=" %G IN (ftypes_x86.txt) DO FTYPE %G"
        cmd /c "FOR /F "tokens=* delims=" %G IN (assoc_x86.txt) DO ASSOC %G"
	    Install-ChocolateyPath "C:\Program Files (x86)\MPC-BE\"
        }
    }
    else
    {
    Install-ChocolateyInstallPackage  'mpc-be' 'exe' '/VERYSILENT /COMPONENTS="main,mpciconlib,mpcresources,mpcberegvid"' "$FileFullPath"
    }
    
    Remove-Item $FileFullPath -Force