import-module au

$releases = 'https://www.gamesave-manager.com/'

function global:au_SearchReplace {
    @{

     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $a = $download_page.Links | Where-Object {$_.OuterHTML -like '*Download*'}
    $r = $a.href  -replace '&amp;','&'
    $url32 = (($a.href -replace '&amp;','&') + "&a=dl")[0]
    [string]$version =  [regex]::match($a.title,'[0-9]+(\.[0-9]+)*').value

    $url32 = $url32 -replace '=thanks','=start'
    Invoke-WebRequest -Uri $url32 -OutFile "tools\gs_mngr_$($Version)_x32.zip" -UserAgent 'chocolatey'

    return @{Version = $version }
}

update -ChecksumFor none