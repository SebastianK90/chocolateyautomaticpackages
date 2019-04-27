$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = 'cloneapp'
  FileFullPath   = Get-Item $toolsPath\*_x32.zip
  Destination    = $toolsPath
}

Get-ChildItem $toolsPath\* | Where-Object { $_.PSISContainer } | Remove-Item -Recurse -Force #remove older package dirs
Get-ChocolateyUnzip @packageArgs
Remove-Item $toolsPath\*.zip -ea 0

$Shortcut = Get-ChildItem $toolsPath -Recurse -Include *.exe | Select-Object -First 1
      
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\CloneApp.lnk" $Shortcut -WorkingDirectory "$toolsPath"


if(Test-Path 'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers')
    {
	Sleep 1
      New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $Shortcut.FullName -Value 'RUNASADMIN' -PropertyType 'String' -Force | Out-Null
    }
    else
    {
	Sleep 1
      New-Item 'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Force | Out-Null
      New-ItemProperty 'HKCU:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $Shortcut.FullName -Value 'RUNASADMIN' -PropertyType 'String' -Force | Out-Null
	}

if ((Get-WmiObject win32_operatingsystem).caption -like '*Server*')
    {
  if(Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers')
    {
	 New-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $Shortcut.FullName -Value 'DisableNXShowUI' -PropertyType 'String' -Force | Out-Null
    }
    else
    {
	 New-Item 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Force | Out-Null
	 New-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers' -Name $Shortcut.FullName -Value 'DisableNXShowUI' -PropertyType 'String' -Force | Out-Null
	}
}
