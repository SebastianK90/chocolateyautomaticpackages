import-module au

$releases = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Nightly%20Builds%20%28from%20svn%20trunk%29/'

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
    $ver_name = ($download_page.links | Where-Object {$_ -like '*Click to enter*'} | Select-Object -ExpandProperty title -First 1).substring(15)
    $a = Invoke-WebRequest -Uri ($releases + $ver_name) -UseBasicParsing
    [string]$version =  [regex]::match(($a.Links | Where-Object {$_.outerHTML -like '*Click to Download MPC-BE*' -and $_.title -like '*x64-installer*'}).title,'[0-9]+(\.[0-9]+)*').value
    $version = $version + '-beta'

    $url64 = ($a.Links | Where-Object {$_.outerHTML -like '*Click to Download MPC-BE*' -and $_.title -like '*x64-installer*'}).href
    $url32 = ($a.Links | Where-Object {$_.outerHTML -like '*Click to Download MPC-BE*' -and $_.title -like '*x86-installer*'}).href
    
    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update -NoCheckUrl