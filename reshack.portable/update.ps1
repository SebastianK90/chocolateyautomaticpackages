Import-Module AU

$releases = 'http://www.angusj.com/resourcehacker'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {

        
    $useragents = @('Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246',`
    'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3112 Safari/537.36',`
    'Mozilla/5.0 (Windows NT x.y; Win64; x64; rv:60.0) Gecko/20100101 Firefox/60.0')
    $random = Get-Random -Maximum 3
    

    $url32   = 'http://www.angusj.com/resourcehacker/resource_hacker.zip'
    $output = "$env:TEMP\resource_hacker.zip"
    Invoke-WebRequest -Uri $url32 -OutFile $output -UserAgent [$useragents[$random]]
    Expand-Archive -Path $env:TEMP\resource_hacker.zip -DestinationPath $env:TEMP\resource_hacker -Force
    $ver = (Get-ChildItem $env:TEMP\resource_hacker\ResourceHacker.exe).VersionInfo
    $version = $ver.FileVersion
    Remove-Item $output,$env:TEMP\resource_hacker -Recurse -ea 0

    
    @{ URL32 = $url32; Version = $version }
}

update -ChecksumFor 32