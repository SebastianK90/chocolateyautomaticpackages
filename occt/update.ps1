import-module au


$releases = 'http://www.ocbase.com/download.php'

function global:au_SearchReplace {
  @{
    'tools\chocolateyInstall.ps1' = @{
      "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
      "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $output = "$env:TEMP\occt.exe"
  Invoke-WebRequest -Uri $releases -OutFile $output -UserAgent [Microsoft.PowerShell.Commands.PSUserAgent]::Chrome
  $version =  (Get-Item $output).VersionInfo.ProductVersion
  $url32   = $releases
  Remove-Item $output
  return @{ URL32 = $url32; Version = $version }
}

update