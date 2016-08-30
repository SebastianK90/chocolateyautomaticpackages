import-module au

cd .\IrScrutinizer

$releases = 'http://www.harctoolbox.org/downloads/index.html'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
   # $download_page = Invoke-WebRequest -Uri $releases
    
   # $re      = 'IrScrutinizer-.*.exe'
   # $url     = $download_page.links | ? href -match $re | select -First 1 -expand href
    $url32   = 'http://www.harctoolbox.org/downloads/IrScrutinizer.exe'
    $version = '1.2'

    return @{ URL32 = $url32; Version = $version }
}

update