import-module au

cd .\gamesavemanager

$releases = 'http://www.majorgeeks.com/files/details/gamesave_manager.html'

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
    $version = ($download_page.links.innerHtml | Where-Object {$_ -like 'GameSave Manager *'}).substring(17)[0]
    return @{ URL32 = $url32; Version = $version }
}

update