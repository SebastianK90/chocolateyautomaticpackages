import-module au

$releases = 'https://www.gamesave-manager.com/'

function global:au_SearchReplace {
    @{

     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $a = $download_page.Links | Where-Object {$_.OuterHTML -like '*Download*'}
    $r = $a.href  -replace '&amp;','&'

    $url32 = 'https://www.gamesave-manager.com' + $r
     
    $ver_dirty = ((Invoke-WebRequest -Uri 'https://www.gamesave-manager.com/whatsnew/client/').Links | Where-Object {$_.outerText -like '*Client Update v*'} | Select-Object -First 1).innerText
    [string]$version =  [regex]::match($ver_dirty,'[0-9]+(\.[0-9]+)*').value
    
    return @{Version = $version }
}

update -ChecksumFor none