import-module au

$releases = 'http://www.iobit.com/en/iobit-unlocker.php'

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

    $pattern = '(?<=class="button\ btn-jadegreen\ large")[\S\s]*<dd><span>V (?<Version>[\d\.]+)'
    $url32   = 'http://update.iobit.com/dl/unlocker-setup.exe'
    $version = [regex]::Match($content, $pattern).groups['Version'].value
    return @{ URL32 = $url32; Version = $version }
}

update
