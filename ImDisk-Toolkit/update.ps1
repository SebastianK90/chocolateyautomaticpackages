import-module au


$releases = 'https://sourceforge.net/projects/imdisk-toolkit/files/'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
        }


        ".\legal\VERIFICATION.txt" = @{
          "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
          "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
          "(?i)(\s+x64:).*"            = "`${1} $($Latest.URL64)"
          "(?i)(checksum64:).*"        = "`${1} $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge}


function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    
    $version_dirty = ($download_page.links | Where-Object {$_ -like '*Click to enter*'} | Select-Object -ExpandProperty title -First 1).substring(17)
    $ver = for ($i = 0;$i -lt $version_dirty.length;$i += 2){$version_dirty.substring($i,2)}
    $version = $ver[0] + '.' + $ver[1] + '.' +$ver[2]
    $url64   = ('https://sourceforge.net/projects/imdisk-toolkit/files/20'+$version_dirty+'/ImDiskTk-x64.exe/download')
    $url32 = ('https://sourceforge.net/projects/imdisk-toolkit/files/20'+$version_dirty+'/ImDiskTk.exe/download')

     @{
        URL32        = $url32
        URL64        = $url64
        FileType     = 'exe'
        Version      = $version
    }
}


Update-Package -ChecksumFor none
