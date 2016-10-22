import-module au

# cd .\copyfilename

$releases = 'http://www.bullzip.com/download.php'

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

    $re      = 'copyfilename.*.exe'
    $url     = $download_page.links | ? href -match $re | select -First 1 -expand href
    $url32   = 'http://www.bullzip.com/' + $url
    $version = (($url.Substring(26)).replace('.exe','') -replace '_','.')

    return @{ URL32 = $url32; Version = $version }
}

update