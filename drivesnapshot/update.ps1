import-module au

# cd .\drivesnapshot

function Get-RemoteChecksum( $Url, $Algorithm='sha256' ) {
    $fn = [System.IO.Path]::GetTempFileName()
    Invoke-WebRequest $Url -OutFile $fn -UseBasicParsing
    Get-FileHash $fn -Algorithm $Algorithm | % Hash
}

$releases = 'http://www.drivesnapshot.de/de/inews.htm'

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

    $url32   = 'http://www.drivesnapshot.de/download/Setup.exe'
    $dirty = (($download_page.ParsedHtml.getElementsByTagName("h4") | Select-Object -ExpandProperty innerText -First 1))
    $version = [regex]::match($dirty,'[0-9]+(\.[0-9]+)*').value

    $current_dirty = ((Get-Content tools\chocolateyInstall.ps1) -match 'checksum32')
    $current = ($current_dirty[0].Split()[3]) -Replace("'",'')

    $remote = Get-RemoteChecksum $url32
    if ($current -ne $remote) { $version = $version + (get-date).FormatString('yyyyMMdd') }
        

    return @{ URL32 = $url32; Version = $version }
}

update