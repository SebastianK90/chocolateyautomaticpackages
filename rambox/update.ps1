import-module au

$releases = 'https://github.com/ramboxapp/community-edition/releases/latest'

function global:au_SearchReplace {
   @{
      ".\legal\VERIFICATION.txt" = @{
        "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
        "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
        "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
      }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge }

function global:au_GetLatest {

    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $latest_tag = (($download_page.BaseResponse).ResponseUri -split '\/')[-1]
    $expanded_assets = Invoke-WebRequest "https://github.com/ramboxapp/community-edition/releases/expanded_assets/$($latest_tag)" -UseBasicParsing

    $re64      = '*-win-x64.zip'
    $re32      = '*-win-ia32.zip'
    $dirty_url64     = $expanded_assets.links | ? href -like $re64 | select -First 1 <# 2 #> -expand href
    $dirty_url32     = $expanded_assets.links | ? href -like $re32 | select -First 1 <# 2 #> -expand href
    $url64 = 'https://github.com' + $dirty_url64
    $url32 = 'https://github.com' + $dirty_url32
    $version = [regex]::match($url64,'[0-9]+(\.[0-9]+)*').value

    @{
      Version = $version
      URL32 = $url32
      URL64 = $url64
    }
}


update -ChecksumFor none