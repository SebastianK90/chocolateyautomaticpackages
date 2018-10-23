import-module au

    
function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

 function global:au_GetLatest {   

    $url32   = 'https://www.unifiedremote.com/download/windows'
    $output = "$env:TEMP\unifiedremote.exe"
    Start-BitsTransfer -Source $url32 -Destination $output -TransferType Download
    Set-Location $env:TEMP
    $version = ((Get-ChildItem .\unifiedremote.exe).VersionInfo).FileVersion
    Remove-Item $output
    
    return @{URL32 = $url32; Version = $version }
}

update -NoCheckUrl all