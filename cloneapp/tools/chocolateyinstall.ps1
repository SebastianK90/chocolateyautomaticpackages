$ErrorActionPreference = 'Stop'

$packageName = 'cloneapp'
$url32       = 'http://www.mirinsoft.com/index.php/download/send/2-cloneapp/19-cloneapp'
$checksum32  = '3ea2d6b15d993dd89cd8e9f0965e6bcfc943aaee36fa008cf0c1ab0f85576991'
$toolsPath   = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  checksum       = $checksum32
  checksumType   = 'sha256'
  unzipLocation  = $toolsPath
}
Install-ChocolateyZipPackage @packageArgs

$FileFullPath = get-childitem $toolsPath -Recurse -Filter "CloneApp*" -include *.exe | select -First 1
  
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CloneApp.lnk" $FileFullPath

Install-ChocolateyPath $toolsPath
  
if(Test-Path 'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers')
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
