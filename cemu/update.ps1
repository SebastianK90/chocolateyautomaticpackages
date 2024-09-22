Import-Module Chocolatey-AU

$releases = 'https://github.com/cemu-project/Cemu/releases/latest'

function global:au_SearchReplace {
   @{


        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge}


function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $latest_tag = (($download_page.BaseResponse).ResponseUri -split '\/')[-1]
    $expanded_assets = Invoke-WebRequest "https://github.com/cemu-project/Cemu/releases/expanded_assets/$($latest_tag)" -UseBasicParsing

    $re      = '*-windows-x64.zip'
    $url     = $expanded_assets.links | ? {$_.href -like $re} | select -First 1 -expand href
    $url32   = 'https://github.com' + $url
    $version = ($url -split '\/' | select -Index 5).Substring(1)

     @{
        URL32        = $url32
        Version      = $version
    }
}


Update-Package -ChecksumFor none