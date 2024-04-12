Import-Module AU

$releases = 'https://partner.pcloud.com/dl/win64'
function global:au_SearchReplace {
    @{
        '.\tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {

  $output64 = "$env:TEMP\pcloud.exe"
  Invoke-WebRequest -Uri $releases -OutFile $output64
  [string]$version = ((Get-ChildItem $output64).VersionInfo).fileversion
  Remove-Item $output64
  $url32 = 'https://partner.pcloud.com/dl/win'
  $url64 = 'https://partner.pcloud.com/dl/win64'

     @{
        URL32        = $url32
        URL64        = $url64
        Version      = $version
     }
}

update