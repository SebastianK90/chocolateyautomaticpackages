Import-Module AU



$releases = "https://github.com/paintdotnet/release/releases/latest"

function global:au_SearchReplace {
  @{
      ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
  }
}

function global:au_BeforeUpdate {Get-RemoteFiles -Purge}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
  $latest_tag = (($download_page.BaseResponse).ResponseUri -split '\/')[-1]

  $expanded_assets = Invoke-WebRequest "https://github.com/paintdotnet/release/releases/expanded_assets/$($latest_tag)" -UseBasicParsing


  $re = 'portable.x64.zip'

  $url     = $expanded_assets.links | ? href -match $re | select -First 1 <# 2 #> -expand href
  $version = ($url -split '\/' | select -Index 5).Substring(1)


    return @{
        Version = $version
        Url32     = "https://github.com" + $url
        ReleaseURL  = "https://github.com/paintdotnet/release/releases/tag/v${version}"
        PackageName = 'paint.net.portable'
    }
}

update -ChecksumFor none