import-module au

# cd .\ChanSort

$releases = 'https://github.com/PredatH0r/ChanSort/releases'

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

    $re      = '*ChanSort*.zip'
    $url     = $download_page.links | ? href -like $re | select -First 1 -expand href
    $url32   = 'https://github.com' + $url
    [string]$version = (($url -split '\/' | select -Index 5).Substring(1)).replace('-',".")
    return @{ URL32 = $url32; Version = $version }
}

update