Import-Module Chocolatey-AU

$releases = 'https://www.volatilityfoundation.org/releases'

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
    $re      = '*_standalone.zip'
    $url     = $download_page.links | ? href -like $re | select -First 1 -expand href
    $version = [regex]::match($url,'[0-9]+(\.[0-9]+)*').value

     @{
        URL32        = $url
        Version      = $version
    }
}


Update-Package -ChecksumFor none