import-module au

# cd .\rawcopy

$releases = 'http://ltr-data.se/opencode.html/'

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


    $url64   = 'http://ltr-data.se/files/win64/rawcopy64.zip'
    $url32   = 'http://ltr-data.se/files/rawcopy.zip'
    $version = '1.3.3.10'

    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update