
import-module au

$releases = 'https://www.ccleaner.com/de-de/ccleaner/download/portable'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $url32 = ($download_page.links | Where-Object {$_ -like '*zip*'} | select href).href
    $output = "$env:TEMP\ccleaner.zip"
    $extract_to = "$env:TEMP\ccleaner"
    Invoke-WebRequest -Uri $url32 -OutFile $output -UseBasicParsing
    Expand-Archive "$env:TEMP\ccleaner.zip" -DestinationPath $extract_to -Force
    $version = ((Get-ChildItem $env:TEMP\ccleaner\x86\ccleaner.exe).VersionInfo).ProductVersion
    Remove-Item $output

  @{ URL32 = $url32 ; Version = $version }
}

update
