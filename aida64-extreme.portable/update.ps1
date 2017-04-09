import-module au

# cd .\ChanSort




$releases = 'https://www.aida64.com/downloads/ZjljMTEzZDU='

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url32\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^[$]checksum32\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    
     $download_page = Invoke-WebRequest -Uri $releases
 

     $re      = '*aida64extreme*.zip'
     $url     = $download_page.links | ? href -like $re | select -First 1 -expand href
     $url32   = $url
     $pattern = '(?<=<meta\ name="description")[\S\s]*<title>Download AIDA64 Extreme (?<Version>[\d\.]+)'
     $version = [regex]::Match($download_page, $pattern).groups['Version'].value
     return @{ URL32 = $url32; Version = $version }
}

update