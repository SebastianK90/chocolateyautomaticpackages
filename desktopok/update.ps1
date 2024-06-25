Import-Module Chocolatey-AU

$releases = 'https://www.softwareok.de/?seite=Freeware/DesktopOK'

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
    $content = $download_page.Content
    $url64   = 'https://www.softwareok.com/Download/DesktopOK_x64.zip'
    $url   = 'https://www.softwareok.com/Download/DesktopOK.zip'
    $pattern = '(?<=<html>)[\S\s]* <title>DesktopOK (?<Version>[\d\.]+)'
    [string]$version = [regex]::Match($content, $pattern).groups['Version'].value

    @{
      Version = $version
      URL32 = $url
      URL64 = $url64
    }
}


update -ChecksumFor none