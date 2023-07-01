import-module au

$releases = 'https://files.teamspeak-services.com/releases/client/'

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
  
  $ver = ($downloads.Links | Where-Object {$_.href} | Select-Object -Last 1).href
  $link = "https://files.teamspeak-services.com/releases/client/$($ver)/"
  $l = Invoke-WebRequest -Uri $link -UseBasicParsing
  
  $url32 = $link + ($l.links | Where-Object {$_.outerHTML -like '*client-win32*'}).href
  $url64 = $link + ($l.links | Where-Object {$_.outerHTML -like '*client-win64*'}).href
  $version = [regex]::match($url64,'[0-9]+(\.[0-9]+)*').value
  
  return @{ URL64 = $url64; URL32 = $url32; Version = $version }
 
}

update