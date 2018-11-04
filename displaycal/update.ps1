import-module au

$releases = 'https://sourceforge.net/projects/dispcalgui/files/release/'

function global:au_SearchReplace {
  @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
 }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $latest2 = ($download_page.links | Where-Object {$_ -like '*Click to enter*'} | Select-Object -ExpandProperty title -First 2).substring(15)
    if ($url32 = ((Invoke-WebRequest -Uri ($releases + $latest2[0]) | Where-Object {$_.href -like "*Setup.exe/download*"}).href))
    {

        [string]$version =  [regex]::match($url32,'[0-9]+(\.[0-9]+)*').value

    }
elseif($url32 = ((Invoke-WebRequest -Uri ($releases + $latest2[1]) -UseBasicParsing).Links | Where-Object {$_.href -like "*Setup.exe/download*"}).href)

    {
       [string]$version =  [regex]::match($url32,'[0-9]+(\.[0-9]+)*').value
    }

    return @{Version = $version }
}

update -ChecksumFor none