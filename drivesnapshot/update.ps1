import-module au

# cd .\drivesnapshot

$releases = 'http://www.drivesnapshot.de/de/inews.htm'

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

    $url32   = 'http://www.drivesnapshot.de/download/Setup.exe'
    $dirty = (($download_page.ParsedHtml.getElementsByTagName("h4") | Select-Object -ExpandProperty innerText -First 1))
    [string]$version = [regex]::match($dirty,'[0-9]+(\.[0-9]+)*').value

    return @{ URL32 = $url32; Version = $version }
}

update