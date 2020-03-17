import-module au

$releases = 'https://www.makemkv.com/download/'

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

    $re      = 'Setup_MakeMKV.*.exe'
    $url     = $download_page.links | ? href -match $re | select -First 1 -expand href
    $url32   = 'https://www.makemkv.com' + $url
    $version = [regex]::match(($url -split '\/'),'[0-9]+(\.[0-9]+)*').value

    return @{ URL32 = $url32; Version = $version }
}

update