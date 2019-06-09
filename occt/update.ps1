import-module au


$releases = 'http://www.ocbase.com/download.php'

function global:au_SearchReplace {
  @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
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

update -ChecksumFor none