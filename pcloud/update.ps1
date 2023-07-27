import-module au

$releases = 'https://www.pcloud.com/de/release-notes/windows.html'
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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $html = new-object -ComObject HTMLFile
    $html.IHTMLDocument2_write($download_page.rawcontent)
    $ver = (($html.getElementsByTagName('div') | Where-Object {$_.innerText -like '*| Download'}) | Select-Object -ExpandProperty textcontent -First 1)
    $version =  [regex]::match($ver,'[0-9]+(\.[0-9]+)*').value
    $url32 = 'https://partner.pcloud.com/dl/win'
    $url64 = 'https://partner.pcloud.com/dl/win64'

     @{
        URL32        = $url32
        URL64        = $url64
        Version      = $version
    }
}

update