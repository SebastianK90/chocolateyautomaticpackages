import-module au

$releases = 'https://www.gamesave-manager.com/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    
    $url32   = (($download_page.Links | Where-Object innerhtml -eq Download).href -replace '&amp;','&') + "&a=dl"
    $a = $download_page.Links.title | Where-Object {$_ -like '*Download GameSave*'}
    [string]$version =  [regex]::match($a,'[0-9]+(\.[0-9]+)*').value
    return @{ URL32 = $url32; Version = $version }
}

update