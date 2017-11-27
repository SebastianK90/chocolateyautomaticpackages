import-module au

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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $version = ($download_page.links | Where-Object {$_ -like '*Click to enter*'} | Select-Object -ExpandProperty title -First 1).substring(15)
    $url = $download_page.links | Where-Object {$_.outerHTML -like '*Click to enter*'} | Select-Object -ExpandProperty href -First 1
    $url32   = 'https://sourceforge.net'+$url +'wxmp3gain-v'+$version+'-win32-setup.exe/download'

    return @{ URL32 = $url32; Version = $version }
}

update -NoCheckUrl
