import-module au

$releases = 'https://github.com/volatilityfoundation/volatility/releases'

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
    $re      = '*.zip'
    $url     = $download_page.links | ? href -like $re | select -First 1 -expand href
    $version = [regex]::match($url,'[0-9]+(\.[0-9]+)*').value
    $url32   = 'http://downloads.volatilityfoundation.org/releases/' + $version + '/volatility_' + $version + '_win64_standalone.zip'
    return @{ URL32 = $url32; Version = $version }
}

update
