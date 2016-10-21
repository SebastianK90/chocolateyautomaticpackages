import-module au

# cd .\GPMDP

$releases = 'https://github.com/MarshallOfSound/Google-Play-Music-Desktop-Player-UNOFFICIAL-/releases/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases #could use: 'https://api.github.com/repos/dnGrep/dnGrep/releases/latest' | select -expand Content | ConvertFrom-Json | select name, assets_url

    $re      = 'Google.Play.Music.Desktop.Player.*.exe'
    $url     = $download_page.links | ? href -match $re | select -First 1 <# 2 #> -expand href
    #$url64   = 'https://github.com' + $url[0]
    $url32   = 'https://github.com' + $url
    $version = ($url -split '\/' | select -Index 5).Substring(1)

    return @{<# URL64 = $url64; #>URL32 = $url32; Version = $version }
}

update