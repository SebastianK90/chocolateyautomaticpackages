import-module au

cd .\imdisk-toolkit

$releases = 'https://sourceforge.net/projects/imdisk-toolkit/files/'
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
    $download_page = Invoke-WebRequest -Uri $releases

    
    $version_dirty = ($download_page.links | Where-Object {$_.title -like '*Click to enter*'} | Select-Object -ExpandProperty innerText -First 1).substring(2)
    $ver = for ($i = 0;$i -lt $version_dirty.length;$i += 2){$version_dirty.substring($i,2)}
    $version = $ver[0] + '.' + $ver[1] + '.' +$ver[2]
    $url64   = ('https://sourceforge.net/projects/imdisk-toolkit/files/20'+$version_dirty+'/ImDiskTk-x64.exe/download')
    $url32 = ('https://sourceforge.net/projects/imdisk-toolkit/files/20'+$version_dirty+'/ImDiskTk.exe/download')

    return @{ URL64 = $url64; URL32 = $url32; Version = $version }
}

update -NoCheckUrl