import-module au

$releases = 'https://sourceforge.net/projects/dispcalgui/files/release/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $latest2 = ($download_page.links | Where-Object {$_ -like '*Click to enter*'} | Select-Object -ExpandProperty title -First 3).substring(15)
    if ($url32 = ((Invoke-WebRequest -Uri ($releases + $latest2[0]) | Where-Object {$_.href -like "*win32.zip/download*"}).href))
    {

        [string]$version =  [regex]::match($url32,'[0-9]+(\.[0-9]+)*').value

    }
elseif($url32 = ((Invoke-WebRequest -Uri ($releases + $latest2[1]) -UseBasicParsing).Links | Where-Object {$_.href -like "*win32.zip/download*"}).href)

    {
       [string]$version =  [regex]::match($url32,'[0-9]+(\.[0-9]+)*').value
    }
elseif($url32 = ((Invoke-WebRequest -Uri ($releases + $latest2[2]) -UseBasicParsing).Links | Where-Object {$_.href -like "*win32.zip/download*"}).href)

    {
       [string]$version =  [regex]::match($url32,'[0-9]+(\.[0-9]+)*').value
    }        
    return @{URL32 = $url32; Version = $version }
}

update