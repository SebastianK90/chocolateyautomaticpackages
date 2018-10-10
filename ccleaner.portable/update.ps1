import-module au

$releases = 'https://www.ccleaner.com/de-de/ccleaner/download/portable'

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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url = ($download_page.links | Where-Object {$_ -like '*zip*'} | select href).href
    $output = "$env:TEMP\ccleaner.zip"
    Invoke-WebRequest -Uri $url -OutFile $output -UserAgent [$useragents[$random]]
    Set-Location $env:TEMP
    Expand-Archive .\ccleaner.zip -Force
    $version = ((Get-ChildItem .\ccleaner\ccleaner.exe).VersionInfo).ProductVersion

  @{ URL32 = $url ; Version = $version }
}

update -ChecksumFor 32
