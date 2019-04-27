import-module au

$releases = 'https://github.com/telegramdesktop/tdesktop/releases/latest'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
        }


        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge}


function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re      = 'tsetup.*.exe'
    $url     = $download_page.links | ? href -match $re | select -First 1 -expand href
    $url32   = 'https://github.com' + $url
    $version = ($url -split '\/' | select -Index 5).Substring(1)

     @{
        URL32        = $url32
        Version      = $version
    }
}


Update-Package -ChecksumFor none