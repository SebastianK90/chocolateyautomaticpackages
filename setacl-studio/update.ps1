import-module au


$releases = 'https://helgeklein.com/download/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $content = $download_page.Content

    $pattern = "(?<='Download',\ 'SetACL\ Studio',)[\S\s]*SetACL Studio (?<Version>[\d\.]+)"

    $version = [regex]::Match($content, $pattern).groups['Version'].value
    $url32   = 'https://helgeklein.com/downloads/SetACL-Studio/current/SetACL%20Studio.msi'
    return @{ URL32 = $url32; Version = $version }
}

update