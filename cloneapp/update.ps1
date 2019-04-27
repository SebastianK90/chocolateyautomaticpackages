import-module au

$au_Push = $false	
$au_Force = $true


$releases = 'http://www.mirinsoft.com/index.php/download/cloneapp/download/2-cloneapp/19-cloneapp'

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

    $pattern = '(?<=</div>\ <!--\ end\ of\ screenshot\ zone\ -->)[\S\s]*Version: (?<Version>[\d\.]+)'
    $url = 'http://www.mirinsoft.com/index.php/download/send/2-cloneapp/19-cloneapp'
    $version = [regex]::Match($content, $pattern).groups['Version'].value

     @{
        URL32        = $url
        FileType     = 'zip'
        Version      = $version
    }
}


Update-Package -ChecksumFor none