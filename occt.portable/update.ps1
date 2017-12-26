import-module au


$releases = 'http://www.ocbase.com/download/'

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
    $ver = ($download_page.Links | Where-Object {$_ -like '*.zip*'} | Sort-Object -Descending | Select-Object -Last 1).innertext
    $version = [regex]::match(($ver -split '\/')[-1],'[0-9]+(\.[0-9]+)*').value

    $url32   = 'http://www.ocbase.com/download/' + $ver
    return @{ URL32 = $url32; Version = $version }
}

update