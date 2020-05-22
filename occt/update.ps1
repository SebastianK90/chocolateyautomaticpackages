import-module au


$releases = 'https://www.ocbase.com/download'

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
  Start-BitsTransfer -Source $releases -Destination $output
  $version =  (Get-Item $output).VersionInfo.ProductVersion
  $url32   = $releases
  return @{ URL32 = $url32; Version = $version }
}

update