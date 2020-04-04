﻿import-module au

# cd .\emdb

$releases = 'https://www.emdb.eu/index.html'

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
    $content = $download_page.content
    $pattern = '(?<=)[\S\s]*"version" content="(?<Version>[\d\.]+)'

    $version = [regex]::Match($content, $pattern).groups['Version'].value    
    #$version = ($download_page.AllElements | where {$_.innerHTML -like "EMDB V*"} | Select-Object -ExpandProperty innerHTML -First 1).replace('EMDB V','')
    $url32   = 'https://www.emdb.eu/bin/emdb.zip'
    return @{ URL32 = $url32; Version = $version }
}

update
