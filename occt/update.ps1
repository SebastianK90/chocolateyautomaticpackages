import-module au


$releases = 'http://www.ocbase.com/download/'

function global:au_SearchReplace {
  @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
 }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $a = $download_page.Links | Where-Object {$_ -like '*OCCTPT*'}
    $b =  ($a | Where-Object {$_ -like '*.exe*'} | Select-Object -Last 1).innertext
    $version = [regex]::match(($b -split '\/')[-1],'[0-9]+(\.[0-9]+)*').value
    $url32   = 'http://www.ocbase.com/download/' + $b
    return @{Version = $version }
}

update -ChecksumFor none
