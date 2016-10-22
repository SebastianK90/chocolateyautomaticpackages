import-module au

# cd .\wxmp3gain

$releases = 'https://sourceforge.net/projects/wxmp3gain/files'

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
    $version = $download_page.links | Where-Object {$_.outerHTML -like '*Click to enter*'} | Select-Object -ExpandProperty outerText -First 1
    $url = $download_page.links | Where-Object {$_.outerHTML -like '*Click to enter*'} | Select-Object -ExpandProperty href -First 1
    $url32   = 'https://sourceforge.net'+$url +'wxmp3gain-v'+$version+'-win32-setup.exe/download'

    return @{ URL32 = $url32; Version = $version }
}

update -NoCheckUrl