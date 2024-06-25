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

    $url32   = 'http://www.technosys.net/download.aspx?file=syspin.exe'
    $output = "$env:TEMP\syspin.exe"
    Invoke-WebRequest -Uri $url32 -OutFile $output
    $version = ((Get-Item $output).VersionInfo).FileVersion
    Remove-Item $output
    
    return @{URL32 = $url32; Version = $version }
}

update