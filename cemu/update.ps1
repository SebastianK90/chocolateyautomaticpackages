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
  $pattern = '(?<=Latest\ release)[\S\s]*font-big custom">Cemu (?<Version>[\d\.]+\D)'
  $version = [regex]::Match($download_page.content, $pattern).groups['Version'].value
  
  
  $versionGroups = [regex]::Match($version,'(?<Version>[0-9]+(?:\.[0-9]+)*)(?<Revision>[A-Za-z]*)').Groups
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
