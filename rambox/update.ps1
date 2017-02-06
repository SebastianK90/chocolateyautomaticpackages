import-module au

$releases = 'https://github.com/saenzramiro/rambox/releases'

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

    $re64      = '*win-x64.zip'
    $re32      = '*ia32-win.zip'
    $dirty_url64     = $download_page.links | ? href -like $re64 | select -First 1 <# 2 #> -expand href
    $dirty_url32     = $download_page.links | ? href -like $re32 | select -First 1 <# 2 #> -expand href
    $url64 = 'https://github.com' + $dirty_url64
    $url32 = 'https://github.com' + $dirty_url32
    $version = [regex]::match($url64,'[0-9]+(\.[0-9]+)*').value

    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update