import-module au

# cd .\mpc-be

$releases = 'https://sourceforge.net/projects/mpcbe/files/MPC-BE/Release%20builds/'

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
        
    $version = $download_page.links | Where-Object {$_.outerHTML -like '*Click to enter*'} | Select-Object -ExpandProperty outerText -First 1
    $url = $download_page.links | Where-Object {$_.outerHTML -like '*Click to enter*'} | Select-Object -ExpandProperty href -First 1
    $url32   = 'https://sourceforge.net'+$url +'MPC-BE.'+$version+ '.x86-installer.zip/download'
    $url64   = 'https://sourceforge.net'+$url +'MPC-BE.'+$version+ '.x64-installer.zip/download'

    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update -NoCheckUrl