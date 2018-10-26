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

    $url32     = 'https://kolbi.cz/SetDefaultBrowser.zip'
    $output = "$env:TEMP\SetDefaultBrowser.zip"
    Invoke-WebRequest -Uri $url32 -OutFile $output -UseBasicParsing
    Set-Location $env:TEMP
    Expand-Archive "$env:TEMP\SetDefaultBrowser.zip" -Force
    $version = ((Get-ChildItem $env:TEMP\SetDefaultBrowser\SetDefaultBrowser\SetDefaultBrowser.exe).VersionInfo).FileVersion
    Remove-Item $output
    
    return @{URL32 = $url32; Version = $version }
}


update
