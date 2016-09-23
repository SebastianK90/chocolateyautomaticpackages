import-module au

cd .\franz-app

$releases = 'https://github.com/meetfranz/franz-app/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $re      = 'Franz-win32*.*.zip'
    $url     = $download_page.links | ? href -match $re | select -First 2 -expand href
    $url64   = 'https://github.com' + $url[1]
    $url32   = 'https://github.com' + $url[0]
    $version = ($url[0] -split '\/' | select -Index 5)

    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update