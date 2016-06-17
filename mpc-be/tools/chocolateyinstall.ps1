$packageName= 'mpc-be'
$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$installerType = 'EXE'
$silentArgs= '/VERYSILENT /COMPONENTS="main,mpciconlib,mpcresources"'
$url        =  '{{DownloadUrl}}'
$url64      =  '{{DownloadUrlx64}}'
Install-ChocolateyZipPackage "$packageName" "$url" "$toolsDir" "$url64"
  
$FileFullPath = get-childitem $toolsDir -recurse -include *.exe | select -First 1

Install-ChocolateyInstallPackage  $packageName $installerType $silentArgs "$FileFullPath"
 

if (Get-ProcessorBits -eq '64')
{
Install-ChocolateyPath 'C:\Program Files\MPC-BE x64'
}
else
{
Install-ChocolateyPath 'C:\Program Files (x86)\MPC-BE'
}