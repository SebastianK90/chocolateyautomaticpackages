$ErrorActionPreference = 'Stop'
 
$packageName = 'drivesnapshot'
$url32       = 'http://www.drivesnapshot.de/download/snapshot.exe'
$url64       = 'http://www.drivesnapshot.de/download/snapshot64.exe'
$checksum32  = '99be34e9b2fbbfd4e55bebd4f5109e78a85e2dc58825f55e04dd3492c318d35e'
$checksum64  = '2ca10a6612aaf02d0bec0431e86f130870f50d21c7f1c32e28d2d01f186aedfa'
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
      
Install-ChocolateyShortcut -shortcutFilePath "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Drive Snapshot.lnk" $FileFullPath -WorkingDirectory "$toolsPath" -RunAsAdmin


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
    
