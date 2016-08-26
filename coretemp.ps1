import-module au

cd .\coretemp

$releases = 'http://www.majorgeeks.com/files/details/core_temp.html'

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

    #$re      = 'CoreTemp*.zip'
    #$url     = $download_page.links | ? href -match $re | select -First 2 -expand href
    $url64   = 'http://www.alcpu.com/CoreTemp/php/download.php?id=3'
    $url32   = 'http://www.alcpu.com/CoreTemp/php/download.php?id=2'
    $version =  ($download_page.links.innerHtml | Where-Object {$_ -like 'Core Temp *'}).substring(10)[0]
    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update