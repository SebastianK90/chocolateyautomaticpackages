  $packageName= 'cloneapp'
  $toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
  $url        =  '{{DownloadUrl}}'

  Install-ChocolateyZipPackage $packageName $url $toolsDir
  
  $FileFullPath = get-childitem $toolsDir -Recurse -Filter "CloneApp*" -include *.exe | select -First 1
  
  Install-ChocolateyShortcut -shortcutFilePath "$env:USERPROFILE\Desktop\CloneApp.lnk" $FileFullPath
 
  Install-ChocolateyPath $toolsDir
  
  if(Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers')
    {
	Sleep 1
      New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $FileFullPath.FullName -Value 'RUNASADMIN' -PropertyType 'String' -Force
    }
    else
    {
	Sleep 1
      New-Item 'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Force
      New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $FileFullPath.FullName -Value 'RUNASADMIN' -PropertyType 'String' -Force
	}

if ((Get-WmiObject win32_operatingsystem).caption -like '*Server*')
{
  if(Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers')
    {
	 New-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $FileFullPath.FullName -Value 'DisableNXShowUI' -PropertyType 'String' -Force
    }
    else
    {
	 New-Item 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Force
	 New-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $FileFullPath.FullName -Value 'DisableNXShowUI' -PropertyType 'String' -Force
	}
}