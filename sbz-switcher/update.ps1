import-module au

$releases = 'https://sourceforge.net/projects/sbzswitcher/files/Release/'

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
    
    $re = '*SBZSwitcher_*.7z*'
    $url32 = $download_page.Links.href | Where-Object {$_ -Like $re} | Select-Object -First 1
    $version = [regex]::match($url32.Replace('7z',''),'[0-9]+(\.[0-9]+)*').value
    
    return @{ URL32 = $url32; Version = $version }
}

update
