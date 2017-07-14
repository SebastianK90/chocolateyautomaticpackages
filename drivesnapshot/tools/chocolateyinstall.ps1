$ErrorActionPreference = 'Stop'
 
$packageName = 'drivesnapshot'
$url32       = 'http://www.drivesnapshot.de/download/snapshot.exe'
$url64       = 'http://www.drivesnapshot.de/download/snapshot64.exe'
$checksum32  = '77b7514b1873bbe7705ec520f4027cdbfb662f8a2518f390a8c65a86d5b84239'
$checksum64  = '074201988b8c3fb458109ef4e89e82e55177bfb7cc233aec970b489253d486ad'
$toolsPath   = (Split-Path $MyInvocation.MyCommand.Definition)
$bits = Get-ProcessorBits
$lic_path = "$env:USERPROFILE\drivesnapshot_lic"
$lic=(Get-ChildItem $lic_path -Filter '*.txt' -ErrorAction SilentlyContinue).FullName
 
$packageArgs = @{
  packageName    = $packageName
  url            = $url32
  url64Bit       = $url64
  checksum       = $checksum32
  checksum64     = $checksum64
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  FileFullPath  = "$toolsPath\snapshot.exe"
}

Get-ChocolateyWebFile @packageArgs -GetOriginalFileName
 
$FileFullPath = get-childitem $toolsPath -recurse -include *.exe | select -First 1
      
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Drive Snapshot.lnk" $FileFullPath


if(!(Test-Path $lic_path -ErrorAction SilentlyContinue))
    {
    New-Item $lic_path -ItemType Directory | %{$_.Attributes = "hidden"}
    }
    elseif($lic -ne $null)
    {
        if($bits -eq 64)
            {
            Start-ChocolateyProcessAsAdmin -Statements "--register:$lic" -ExeToRun "$toolsPath\snapshot64.exe"
            }
        else
            {
            Start-ChocolateyProcessAsAdmin -Statements "--register:$lic" -ExeToRun "$toolsPath\snapshot.exe"
            }
  }
    
