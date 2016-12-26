import-module au


$releases = 'http://www.sordum.org/7615/'

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

    $pattern = '(?<=<meta\ property="og:site_name"\ content="Sordum">)[\S\s]*<title>Easy Context menu v(?<Version>[\d\.]+)'

    $version = [regex]::Match($content, $pattern).groups['Version'].value
    $url32   = 'http://www.sordum.org/files/downloads.php?easy-context-menu'
    return @{ URL32 = $url32; Version = $version }
}

update -NoCheckUrl