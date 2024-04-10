Import-Module Chocolatey-AU

$releases = 'http://www.alcpu.com/CoreTemp/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $content = $download_page.content
    $pattern = '(?<=font-size: 20pt"\>)[\S\s]*\<b\>Core Temp (?<Version>[\d\.]+)'


    $url64   = 'https://www.alcpu.com/CoreTemp/CoreTemp64.zip'
    $url32   = 'https://www.alcpu.com/CoreTemp/CoreTemp32.zip'
    #$version = [regex]::match((($download_page.ParsedHtml.getElementsByTagName("b") | Where {$_.sourceindex -eq '204'}).firstchild.textcontent),'[0-9]+(\.[0-9]+)*').value
    $version = [regex]::Match($content, $pattern).groups['Version'].value
    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update -NoCheckUrl