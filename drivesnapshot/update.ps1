import-module au

# cd .\drivesnapshot

#$releases = 'http://www.drivesnapshot.de/de/inews.htm'

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
    #$download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $url64   = 'http://www.drivesnapshot.de/download/snapshot64.exe'
    $url32   = 'http://www.drivesnapshot.de/download/snapshot.exe'
    $output = "$env:TEMP\snapshot.exe"
    Invoke-WebRequest -Uri $url32 -OutFile $output
    $version = ((Get-ChildItem $output).VersionInfo).fileversion
    Remove-Item $output
        
    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update