import-module au

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
    $url_down = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $download_page = $url_down.Content
    #$download_page.AllElements | ? tagName -eq 'strong' | ? InnerText -match '^Version' | % InnerText | set version
    #$version = $version -split ' ' | select -Last 1
    $pattern = '(?<=<h2>Resource\ Hacker)[\S\s]*<strong>Version (?<Version>[\d\.]+)'
    $version = [regex]::Match($download_page, $pattern).groups['Version'].value
    $url =  $url_down.links | ? href -match 'zip' | % href | Select -First 1
    $url32 = "$releases/$url"
    
    @{ URL32 = $url32; Version = $version }
}

update -ChecksumFor 32