import-module au

$releases = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Release%20builds/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
        }


        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
          "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
          "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge 'MPC-BE-installer'}


function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
          
    $version = ($download_page.links | Where-Object {$_ -like '*Click to enter*'} | Select-Object -ExpandProperty title -First 1).substring(15)
    $url = $download_page.links | Where-Object {$_.outerHTML -like '*Click to enter*'} | Select-Object -ExpandProperty href -First 1
    $url32   = 'https://sourceforge.net'+$url +'MPC-BE.'+$version+ '.x86-installer.zip/download'
    $url64   = 'https://sourceforge.net'+$url +'MPC-BE.'+$version+ '.x64-installer.zip/download'

     @{
        URL32        = $url32
        URL64        = $url64
        FileType     = 'zip'
        Version      = $version
    }
}


Update-Package -ChecksumFor none