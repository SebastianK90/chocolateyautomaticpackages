Import-Module AU


$releases = "https://github.com/paintdotnet/release/releases/latest"

function global:au_SearchReplace {
  @{
      ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x64:).*"            = "`${1} $($Latest.Url64)"
          "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
        ".\tools\chocolateyInstall.ps1" = @{
          "(?i)(^\s*FileFullPath\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
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
  $url64      = "https://github.com" + $url
  $version = ($url -split '\/' | select -Index 5).Substring(1)


    return @{
        Version = $version
        Url64     = $url64
        ReleaseURL  = "https://github.com/paintdotnet/release/releases/tag/v${version}"
        PackageName = 'paint.net.portable'
        FileFullPath  = ($url -split '\/')[-1]
    }
}

update -ChecksumFor none
