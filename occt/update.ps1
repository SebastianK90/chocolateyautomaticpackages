Import-Module Chocolatey-AU

$releases = 'https://www.ocbase.com/download/edition:Personal'

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
  $url32   = $releases
  Invoke-WebRequest -Uri $url32 -OutFile $output
  $version =  (Get-Item $output).VersionInfo.FileVersion
  Remove-Item $output
  return @{ URL32 = $url32; Version = $version }
}

update