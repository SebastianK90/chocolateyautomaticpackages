Import-Module AU

$releases = 'https://www.teamspeak.com/en/downloads/#ts3client'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
  $downloads = Invoke-WebRequest -Uri $releases
  
  $a = ($downloads.Links | Where-Object {
    ($_.outerText -like '*Download*') -and
    ($_.href -like '*Teamspeak3-Client-win64*')
  })
  $version = ($a.href -split '\/')[-2]
  $url64 = $a.href

  return @{ URL64 = $url64; Version = $version }
 
}

update