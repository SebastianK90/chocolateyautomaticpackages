import-module au

# cd .\io-unlocker

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

    $url32   = 'http://update.iobit.com/dl/unlocker-setup.exe'
    [string]$version = (($download_page.ParsedHtml.getElementsByTagName("dl") | Where {$_.className -eq 'downloadinfo'}).children()[1].firstchild.innerhtml).substring(2)
    return @{ URL32 = $url32; Version = $version }
}

update