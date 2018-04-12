import-module au

$releases = 'http://www.mirinsoft.com/index.php/downloads/cloneapp'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $content = $download_page.Content

    $pattern = '(?<=</div>\ <!--\ end\ of\ screenshot\ zone\ -->)[\S\s]*Version: (?<Version>[\d\.]+)'
    $url32 = 'http://www.mirinsoft.com/index.php/downloads/cloneapp/send/2-cloneapp/19-cloneapp'
    $version = [regex]::Match($content, $pattern).groups['Version'].value
    return @{ URL32 = $url32; Version = $version }
}

update
