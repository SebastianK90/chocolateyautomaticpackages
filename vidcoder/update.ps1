import-module au


$releases = 'https://github.com/RandomEngy/VidCoder/releases/latest'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
            "(?i)(^\s*softwareName\s*=\s*)('.*')" = "`$1'$($Latest.PackageName)*'"
            "(?i)(^\s*fileType\s*=\s*)('.*')"     = "`$1'$($Latest.FileType)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
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

  $expanded_assets = Invoke-WebRequest "https://github.com/RandomEngy/VidCoder/releases/expanded_assets/$($latest_tag)" -UseBasicParsing
  
  $re      = 'VidCoder-.*.exe'
  $url     = $expanded_assets.links | Where-Object {($_.href -match $re) -and ($_.href -notlike '*Portable*')} | select -First 1 <# 2 #> -expand href

  $version = ($url -split '\/' | select -Index 5).Substring(1)

     @{
        URL32        = 'https://github.com' + $url
        Version      = $version
        ReleaseNotes = "https://github.com/RandomEngy/VidCoder/releases/tag/v${version}"
    }
}


Update-Package -ChecksumFor none