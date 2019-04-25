import-module au


$releases = 'https://github.com/PredatH0r/ChanSort/releases'

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

function global:au_BeforeUpdate { Get-RemoteFiles -Purge }


function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re      = '*ChanSort*.zip'
    $url     = $download_page.links | ? href -like $re | select -First 1 -expand href
    [string]$version = (($url -split '\/' | select -Index 5).Substring(1)).replace('-',".")

     @{
        URL32        = 'https://github.com' + $url
        Version      = $version
    }
}


Update-Package -ChecksumFor none