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
  [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
  $down = New-Object System.Net.WebClient
  $down.DownloadFile($url64,$output)
  $version = ((Get-ChildItem $output).VersionInfo).ProductVersion
  Remove-Item $output
   
    
  return @{URL64 = $url64; URL32 = $url32; Version = $version }
}

update