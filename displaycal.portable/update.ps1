import-module au

$releases = 'https://sourceforge.net/projects/dispcalgui/files/release/'

function global:au_SearchReplace {
  @{
        "$($Latest.PackageName).nuspec" = @{
            "(\<dependency .+?`"dispcalgui.portable`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
    }
 }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing
    $version = ($download_page.links | Where-Object {$_ -like '*Click to enter*'} | Select-Object -ExpandProperty title -First 1).substring(15)
    return @{Version = $version }
}

update -ChecksumFor none