Import-Module AU
    
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
    Invoke-WebRequest -Uri $url32 -OutFile $output
    $version = ((Get-ChildItem $env:TEMP\unifiedremote.exe).VersionInfo).FileVersion
    $version = $version -replace '\s',''
    Remove-Item $output
    
    return @{URL32 = $url32; Version = $version }
}

update