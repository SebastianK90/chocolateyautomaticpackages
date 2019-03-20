import-module au



$releases = 'https://github.com/RandomEngy/VidCoder/releases/latest'

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
    $re      = 'VidCoder-.*.exe'
    $url     = ($download_page.links | Where-Object {($_.href -match $re) -and ($_.href -notlike '*Portable*')}).href
    $url32   = 'https://github.com' + $url
    $version = [regex]::match(($url -split '\/')[-1],'[0-9]+(\.[0-9]+)*').value
    return @{ URL32 = $url32; Version = $version }
}

update