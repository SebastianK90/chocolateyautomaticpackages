Import-Module Chocolatey-AU

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
  $url64   = 'http://www.drivesnapshot.de/download/snapshot64.exe'
  $url32   = 'http://www.drivesnapshot.de/download/snapshot.exe'
  $output64 = "$env:TEMP\snapshot64.exe"
  Invoke-WebRequest -Uri $url64 -OutFile $output64
  [string]$version = (Get-ChildItem $output64).VersionInfo.fileversion
  Remove-Item $output64
        
  return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

Update-Package