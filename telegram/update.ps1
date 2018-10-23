import-module au

$releases = 'https://github.com/telegramdesktop/tdesktop/releases/latest'

function global:au_SearchReplace {
   @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"$($Latest.Version)`""
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re      = 'tsetup.*.exe'
    $url     = $download_page.links | ? href -match $re | select -First 1 -expand href
    $url32   = 'https://github.com' + $url
    $version = ($url -split '\/' | select -Index 5).Substring(1)

    return @{Version = $version }
}

update -ChecksumFor none
