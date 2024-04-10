Import-Module AU

$url32 = 'https://cdn.iobit.com/dl/unlocker-setup.exe'

function global:au_SearchReplace {
  @{
    'tools\chocolateyInstall.ps1' = @{
      "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
      "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
    
  $output32 = "$env:TEMP\unlocker-setup.exe"
  Start-BitsTransfer -Source $url32 -Destination $output32 -TransferType Download
  $ver_dirty = ((Get-ChildItem $output32).VersionInfo).fileversion
  $version = [regex]::match(($ver_dirty -split '\/'),'[0-9]+(\.[0-9]+)*').value
  Remove-Item $output32
  
  return @{ URL32 = $url32; Version = $version }
}

update
