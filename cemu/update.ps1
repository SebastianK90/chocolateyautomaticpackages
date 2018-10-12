import-module au

$releases = 'http://cemu.info/'

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

    $re      = '*cemu*.zip'
    $url64  = $download_page.links | ? href -like $re | select -First 1 -expand href
    $url32 = $url64
    $versionGroups = [regex]::Match($url32,'(?<Version>[0-9]+(?:\.[0-9]+)*)(?<Revision>[A-Za-z]*)').Groups
    $version = $versionGroups['Version'].Value

    $revision = 0
    foreach ($c in $versionGroups['Revision'].Value.ToLowerInvariant().ToCharArray()) {
        $revision *= 26
        $revision += [int]$c - [int][char]'a'
    }
    $revision *= 100
    $version += '.' + $revision

    return @{ URL32 = $url32; Version = $version }
}

update -ChecksumFor 32