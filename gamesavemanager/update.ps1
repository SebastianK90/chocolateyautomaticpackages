import-module au

$releases = 'https://www.gamesave-manager.com/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
        }


        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
        }
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $a = $download_page.Links | Where-Object {$_.OuterHTML -like '*Download GameSave*'}
    $r = $a.href  -replace '&amp;','&'
    $url32 = ($a.href -replace '&amp;','&') + "&a=dl"
    [string]$version =  [regex]::match($a.title,'[0-9]+(\.[0-9]+)*').value

    $headers = @{
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9';
    'Accept-Encoding' = 'gzip, deflate, br';
    Referer = "$r";
    'User-Agent' = 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/83.0.4103.61 Safari/537.36';
    'Content-Type' = 'application/octet-stream';
}

  Invoke-WebRequest -Uri $url32 -Headers $headers -OutFile "tools\gs_mngr_$($Version)_x32.zip"
  
    return @{Version = $version }
}

update -ChecksumFor none