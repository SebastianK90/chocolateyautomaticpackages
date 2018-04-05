import-module au

$releases = 'http://www.mirinsoft.com/index.php/downloads/category/2-cloneapp'

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

    $pattern = '(?<=<a\ href="/index\.php/downloads/core/download/2-cloneapp/1-cloneapp">)[\S\s]*CloneApp</a> (?<Version>[\d\.]+)'
    $url32 = 'http://www.mirinsoft.com/index.php/downloads/core/send/2-cloneapp/1-cloneapp'
    $version = [regex]::Match($content, $pattern).groups['Version'].value
    return @{ URL32 = $url32; Version = $version }
}

update
