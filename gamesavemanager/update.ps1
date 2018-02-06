import-module au

$releases = 'http://www.gamesave-manager.com/'

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
    
    $url32   = 'http://www.gamesave-manager.com/?s=download&a=dl'
    $a = $download_page.Links.title[8]
    [string]$version =  [regex]::match($a,'[0-9]+(\.[0-9]+)*').value
    return @{ URL32 = $url32; Version = $version }
}

update
