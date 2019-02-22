import-module au

$releases = 'https://www.teamspeak.com/en/downloads/'

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
  $downloads = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $url32 =  ($downloads.links | Where-Object {$_.outerHTML -like '*client-win32*'}).href
  $url64 =  ($downloads.links | Where-Object {$_.outerHTML -like '*client-win64*'}).href
  $version = [regex]::match($url64,'[0-9]+(\.[0-9]+)*').value
  
  return @{ URL64 = $url64; URL32 = $url32; Version = $version }
 
}

update