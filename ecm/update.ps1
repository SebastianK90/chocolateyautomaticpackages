Import-Module AU


$releases = 'http://www.sordum.org/7615/'

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
    $content = $download_page.Content

    $pattern = '(?<=)[\S\s]*<title>Easy Context menu v(?<Version>[\d\.]+)'

    $version = [regex]::Match($content, $pattern).groups['Version'].value
        
    $url     = 'https://www.sordum.org/files/easy-context-menu/ec_menu.zip'

     @{
        URL32        = $url
        FileType     = 'zip'
        Version      = $version
    }
}


Update-Package -ChecksumFor none