[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls, [Net.SecurityProtocolType]::Tls11, [Net.SecurityProtocolType]::Tls12, [Net.SecurityProtocolType]::Ssl3
[Net.ServicePointManager]::SecurityProtocol = "Tls, Tls11, Tls12, Ssl3"

import-module au

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

    $url32 = 'https://partner.pcloud.com/dl/win'
    $url64 = 'https://partner.pcloud.com/dl/win64'
    $output = "$env:TEMP\pcloud.exe"
    Invoke-WebRequest -Uri $url32 -OutFile $output -UseBasicParsing
    $version = ((Get-ChildItem $output).VersionInfo).ProductVersion
    Remove-Item $output
   
    
    return @{URL64 = $url64; URL32 = $url32; Version = $version }
}

update