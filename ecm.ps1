import-module au

cd .\ecm

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
    $download_page = Invoke-WebRequest -Uri $releases
        
    $version = [regex]::match(((($download_page.ParsedHtml.getElementsByTagName("h1") | Select-Object -ExpandProperty innerText))[1]),'[0-9]+(\.[0-9]+)*').value
    $url32   = 'http://www.sordum.org/files/downloads.php?easy-context-menu'
    return @{ URL32 = $url32; Version = $version }
}

update -NoCheckUrl