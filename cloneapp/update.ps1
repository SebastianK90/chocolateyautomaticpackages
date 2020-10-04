import-module au


$releases = 'https://github.com/builtbybel/CloneApp/releases/latest'

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

function global:au_BeforeUpdate { Get-RemoteFiles -Purge -FileNameBase 'cloneapp'}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $re      = 'CloneApp*.zip'
    $url     = ($download_page.links | Where-Object {$_.href -match $re}).href
    $version = [regex]::match(($url -split '\/'),'[0-9]+(\.[0-9]+)*').value

     @{
        URL32        = 'https://github.com' + $url
        Version      = $version
        FileType     = 'zip'
        ReleaseNotes = "https://github.com/builtbybel/CloneApp/releases/tag/v${version}"
    }
}



Update-Package -ChecksumFor none