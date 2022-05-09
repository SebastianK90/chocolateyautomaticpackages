$ErrorActionPreference = 'Stop'
 
$packageName = 'drivesnapshot'
$url32       = 'http://www.drivesnapshot.de/download/snapshot.exe'
$url64       = 'http://www.drivesnapshot.de/download/snapshot64.exe'
$checksum32  = '1583d11ed9c0793a66604bb58221b03d959cdd38afd33f3446f757b98d3d369f'
$checksum64  = 'f6f32a17fa01e83b9f6d67ff52a45e7d3ab24e8c8a077d9ad18bcf86d718a0d0'
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
    
