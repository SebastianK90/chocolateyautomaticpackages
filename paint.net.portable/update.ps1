Import-Module AU
Import-module PSGitHub


$domain   = 'https://github.com'
$releases = "$domain/repos/paintdotnet/release/releases/latest"
$owner = "paintdotnet"
$repository = "release"

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
    $tags = Get-GitHubRelease -Owner $owner -RepositoryName $repository -Latest


    $re = 'portable.x64.zip'

    $url = $tags.assets.browser_download_url | ? {$_ -match $re}
    $version = (Split-Path ( Split-Path $url ) -Leaf).Substring(1)

    return @{
        Version = $version
        Url     = "https://github.com" + $url
        ReleaseURL  = "$domain/paintdotnet/release/releases/tag/v${version}"
        PackageName = 'paint.net.portable'
    }
}

update -ChecksumFor none