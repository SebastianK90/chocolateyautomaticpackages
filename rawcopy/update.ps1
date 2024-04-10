Import-Module Chocolatey-AU


function global:au_SearchReplace {
   @{
      ".\legal\VERIFICATION.txt" = @{
        "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
        "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
        "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
      }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge}

function global:au_GetLatest {

    $useragents = @('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246',`
    'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3112 Safari/537.36',`
    'Mozilla/5.0 (Windows NT x.y; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0')
    $random = Get-Random -Maximum 3
    
    $url64   = 'http://ltr-data.se/files/win64/rawcopy64.zip'
    $url32   = 'http://ltr-data.se/files/rawcopy.zip'
    $output = "$env:TEMP\rawcopy.zip"
    Invoke-WebRequest -Uri $url32 -OutFile $output -UserAgent [$useragents[$random]]
    Expand-Archive -Path $env:TEMP\rawcopy.zip -DestinationPath $env:TEMP\rawcopy -Force
    $ver = (Get-ChildItem $env:TEMP\rawcopy\rawcopy.exe).VersionInfo
    $version = $ver.ProductVersionRaw.Major.ToString() + "." + $ver.ProductVersionRaw.Minor.ToString() + "." + $ver.ProductVersionRaw.Build.ToString() + "." + $ver.ProductVersionRaw.Revision.ToString()
    Remove-Item $output,$env:TEMP\rawcopy -Recurse -ea 0
    
    @{
      Version = $version
      URL32 = $url32
      URL64 = $url64
    }
}


update -ChecksumFor none