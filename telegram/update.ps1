Import-Module AU

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
    $latest_tag = (($download_page.BaseResponse).ResponseUri -split '\/')[-1]
    $expanded_assets = Invoke-WebRequest "https://github.com/telegramdesktop/tdesktop/releases/expanded_assets/$($latest_tag)" -UseBasicParsing

    $re      = 'tsetup.*.exe'
    $url     = $expanded_assets.links | ? href -match $re | select -First 1 -expand href
    $url32   = 'https://github.com' + $url
    $version = ($url -split '\/' | select -Index 5).Substring(1)

    return @{Version = $version }
}

update -ChecksumFor none
