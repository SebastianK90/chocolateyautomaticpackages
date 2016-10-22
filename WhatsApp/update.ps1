import-module au

# cd .\whatsapp

$releases = 'http://www.softpedia.com/get/Internet/Chat/Instant-Messaging/WhatsApp.shtml'
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

    $url64   = 'https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe'
    $url32   = 'https://web.whatsapp.com/desktop/windows/release/ia32/WhatsAppSetup.exe'
    $version = [regex]::match(($download_page.Links.innerhtml | Where-Object {$_ -like '*<span>Whatsapp*'}),'[0-9]+(\.[0-9]+)*').value

    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update