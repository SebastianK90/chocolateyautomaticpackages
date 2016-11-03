import-module au

$releases = 'http://cemu.info/index.html'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re      = '*cemu*.zip'
    $url64   = $download_page.links | ? href -like $re | select -First 1 -expand href
    $version = [regex]::match($url64,'[0-9]+(\.[0-9]+)*').value

    return @{ URL64 = $url64; Version = $version }
}

update