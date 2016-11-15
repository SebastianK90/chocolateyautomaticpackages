import-module au

# cd .\whatsapp

#$releases = 'http://www.softpedia.com/get/Internet/Chat/Instant-Messaging/WhatsApp.shtml'
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
    #$download_page = Invoke-WebRequest -Uri $releases
    $useragents = @('Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko',`
    'Mozilla/5.0 (X11; Linux x86_64; rv:17.0) Gecko/20121202 Firefox/17.0 Iceweasel/17.0.1',`
    'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1',`
    'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36',`
    'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/54.0.2840.99 Safari/537.36',`
    'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/52.0.2750.0 Iron Safari/537.36'
)
    $random = Get-Random -Maximum 6
    
    $url64   = 'https://web.whatsapp.com/desktop/windows/release/x64/WhatsAppSetup.exe'
    $url32   = 'https://web.whatsapp.com/desktop/windows/release/ia32/WhatsAppSetup.exe'
    $output = "$env:TEMP\WhatsAppSetup.exe"
    Invoke-WebRequest -Uri $url32 -OutFile $output -UserAgent [$useragents[$random]]
    $version = ((Get-ChildItem $output).VersionInfo).fileversion
    Remove-Item $output
    #$version = [regex]::match(($download_page.Links.innerhtml | Where-Object {$_ -like '*<span>Whatsapp*'}),'[0-9]+(\.[0-9]+)*').value
    #$version = '0.2.2245'
    
    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update