import-module au

# cd .\desktopok

$releases = 'http://www.softwareok.de/?seite=Freeware/DesktopOK'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases

    $url64   = 'http://www.softwareok.com/Download/DesktopOK_x64.zip'
    $url32   = 'http://www.softwareok.com/Download/DesktopOK.zip'
    [string]$version =  [regex]::match(($download_page.ParsedHtml.getElementsByTagName("h3") | Where {$_.sourceindex -eq '121'}).innertext,'[0-9]+(\.[0-9]+)*').value
    
    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}


update