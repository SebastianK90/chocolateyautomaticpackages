import-module au

$au_Push = $false	
$au_Force = $true

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
        }


        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge}


function global:au_GetLatest {
    $useragents = @('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246',`
    'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3112 Safari/537.36',`
    'Mozilla/5.0 (Windows NT x.y; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0')
    $random = Get-Random -Maximum 3
    
    $url32     = 'https://kolbi.cz/SetDefaultBrowser.zip'
    $output = "$env:TEMP\SetDefaultBrowser.zip"
    Invoke-WebRequest -Uri $url32 -OutFile $output -UserAgent [$useragents[$random]]
    Expand-Archive -Path "$env:TEMP\SetDefaultBrowser.zip" -DestinationPath "$env:TEMP\SetDefaultBrowser" -Force
    $version = ((Get-ChildItem $env:TEMP\SetDefaultBrowser\SetDefaultBrowser\SetDefaultBrowser.exe).VersionInfo).ProductVersion
    Remove-Item $output,"$env:TEMP\SetDefaultBrowser" -Recurse -Force -ea 0


     @{
        URL32        = $url32
        Version      = $version
    }
}


Update-Package -ChecksumFor none