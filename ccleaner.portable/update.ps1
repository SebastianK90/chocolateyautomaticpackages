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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url32 = ($download_page.links | Where-Object {$_ -like '*zip*'} | select href).href
    $output = "$env:TEMP\ccleaner.zip"
    Invoke-WebRequest -Uri $url -OutFile $output -UseBasicParsing
    Set-Location $env:TEMP
    Expand-Archive .\ccleaner.zip -Force
    $version = ((Get-ChildItem .\ccleaner\ccleaner.exe).VersionInfo).ProductVersion

  @{ URL32 = $url32 ; Version = $version }
}

update -ChecksumFor 32
