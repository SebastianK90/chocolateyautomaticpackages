Import-Module Chocolatey-AU

# Regex für Standard URL/Checksum Ersetzung in chocolateyInstall.ps1
function global:au_SearchReplace {
    @{
        ".\legal\VERIFICATION.txt" = @{
            "(?i)(\s+x32:).*"             = "`$1 $($Latest.URL32)"
            "(?i)(checksum32:).*"         = "`$1 $($Latest.Checksum32)"
            "(?i)(\s+x64:).*"             = "`$1 $($Latest.URL64)"
            "(?i)(checksum64:).*"         = "`$1 $($Latest.Checksum64)"
        }
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge }

function global:au_GetLatest {
    # Holt Release-Infos via API
    $release = Get-GitHubRelease 'telegramdesktop' 'tdesktop'
    $assets = $release.assets

    # 64-Bit: Sucht nach 'tsetup-x64*.exe'
    $url64 = $assets | Where-Object { $_.name -like 'tsetup-x64*.exe' } | Select-Object -First 1 -ExpandProperty browser_download_url

    # 32-Bit: Sucht nach 'tsetup*.exe', schließt aber 'x64' aus
    $url32 = $assets | Where-Object { $_.name -like 'tsetup*.exe' -and $_.name -notlike '*x64*' } | Select-Object -First 1 -ExpandProperty browser_download_url

    # Entfernt führendes 'v' falls vorhanden
    $version = $release.tag_name -replace '^v',''

    @{
        Version  = $version
        URL64    = $url64
        URL32    = $url32
        FileType = 'exe'
    }
}

Update-Package -ChecksumFor none