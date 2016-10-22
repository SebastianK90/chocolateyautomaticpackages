import-module au

# cd .\cloneapp

$releases = 'http://mirinsoft.com/index.php/component/jdownloads/viewcategory/39-cloneapp-portable?Itemid=235'

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
    $version = [regex]::match((($download_page.ParsedHtml.getElementsByTagName("td") | Where {$_.sourceindex -eq '424'})).innertext,'[0-9]+(\.[0-9]+)*').value
    $url32 = 'http://mirinsoft.com/index.php/component/jdownloads/finish/39-cloneapp-portable/180-cloneapp?Itemid=235'
    return @{ URL32 = $url32; Version = $version }
}

#update -NoCheckUrl