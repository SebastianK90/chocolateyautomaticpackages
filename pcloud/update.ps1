import-module au

$releases = 'https://www.pcloud.com/de/release-notes/windows.html'
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072

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
  $download_page = Invoke-WebRequest -Uri $releases -UserAgent 'chocolatey'
  $dirty_ver = (($download_page.ParsedHtml.getElementsByTagName("div") | ? {$_.innerText -like '*| Download'}).textcontent | Select-Object -First 1)
  $url32 = 'https://partner.pcloud.com/dl/win'
  $url64 = 'https://partner.pcloud.com/dl/win64'
  $version =  [regex]::match($dirty_ver,'[0-9]+(\.[0-9]+)*').value
  
  return @{URL64 = $url64; URL32 = $url32; Version = $version }
}

update