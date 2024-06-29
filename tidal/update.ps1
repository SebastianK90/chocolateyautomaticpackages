Import-Module Chocolatey-AU
    
function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

 function global:au_GetLatest {   

    $url32   = 'http://download.tidal.com/desktop/TIDALSetup.exe'
    $output = "$env:TEMP\TIDALSetup.exe"
    Invoke-WebRequest -Uri $url32 -OutFile $output
    $version = ((Get-ChildItem $output).VersionInfo).ProductVersion
    Remove-Item $output
    
    return @{URL32 = $url32; Version = $version }
}

Update-Package