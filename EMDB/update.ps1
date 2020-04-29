import-module au

$releases = 'https://www.emdb.eu/index.html'

function global:au_SearchReplace {
    @{

     }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $content = $download_page.content
    $pattern = '(?<=)[\S\s]*"version" content="(?<Version>[\d\.]+)'

    $version = [regex]::Match($content, $pattern).groups['Version'].value    

    $url32   = 'https://www.emdb.eu/bin/emdb.zip'
    return @{ URL32 = $url32; Version = $version }
}

Update-Package -ChecksumFor none