import-module au

$releases = 'http://www.angusj.com/resourcehacker/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
    }
}

function global:au_GetLatest {
    $download_page = (Invoke-WebRequest -Uri $releases -UseBasicParsing).content
    #$download_page.AllElements | ? tagName -eq 'strong' | ? InnerText -match '^Version' | % InnerText | set version
    #$version = $version -split ' ' | select -Last 1
    $pattern = '(?<=<h2>Resource\ Hacker)[\S\s]*<strong>Version (?<Version>[\d\.]+)'
    $version = [regex]::Match($download_page, $pattern).groups['Version'].value
    $url =  $download_page.Links | ? href -match 'zip' | % href | Select -First 1
    $url32 = "$releases/$url"

    




    @{ URL32 = $url32; Version = $version }
}

update -ChecksumFor 32