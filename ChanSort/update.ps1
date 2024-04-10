Import-Module Chocolatey-AU


$releases = 'https://github.com/PredatH0r/ChanSort/releases/latest'

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
    $latest_tag = (($download_page.BaseResponse).ResponseUri -split '\/')[-1]
    $expanded_assets = Invoke-WebRequest "https://github.com/PredatH0r/ChanSort/releases/expanded_assets/$($latest_tag)" -UseBasicParsing

    $re      = '*ChanSort*.zip'
    $url     = $expanded_assets.links | ? href -like $re | select -First 1 -expand href
    [string]$version = (($url -split '\/' | Select-Object -Index 5).Substring(1)).replace('-',".").replace('_',".")

     @{
        URL32        = 'https://github.com' + $url
        Version      = $version
    }
}


Update-Package -ChecksumFor none