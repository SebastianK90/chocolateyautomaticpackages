import-module au

# cd .\emdb

$releases = 'http://www.emdb.eu/downloads.html'

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
        
    $version = ($download_page.AllElements | where {$_.innerHTML -like "EMDB V*"} | Select-Object -ExpandProperty innerHTML -First 1).replace('EMDB V','')
    $url32   = 'http://www.emdb.eu/bin/emdb.zip'
    return @{ URL32 = $url32; Version = $version }
}

update