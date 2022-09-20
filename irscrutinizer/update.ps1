import-module au

$releases = 'https://github.com/bengtmartensson/harctoolboxbundle/releases/latest'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
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
    $expanded_assets = Invoke-WebRequest "https://github.com/bengtmartensson/harctoolboxbundle/releases/expanded_assets/$($latest_tag)" -UseBasicParsing
    
    $re      = 'IrScrutinizer-.*.exe'
    $url     = $expanded_assets.links | ? href -match $re | select -First 1 -expand href
    $url32   = 'https://github.com' + $url
    $version = [regex]::match(($url -split '\/')[-1],'[0-9]+(\.[0-9]+)*').value
        
         @{
        URL32        = $url32
        Version      = $version
        ReleaseNotes = "https://github.com/bengtmartensson/harctoolboxbundle/releases/tag/Version-${version}"
    }
}


update -ChecksumFor none