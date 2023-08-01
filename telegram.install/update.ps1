import-module au

$releases = 'https://github.com/telegramdesktop/tdesktop/releases/latest'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*packageName\s*=\s*)('.*')"  = "`$1'$($Latest.PackageName)'"
            "(?i)(^\s*FileFullPath64\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName64)`""
            "(?i)(^\s*FileFullPath\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
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
  $latest_tag = (($download_page.BaseResponse).ResponseUri -split '\/')[-1]
  $expanded_assets = Invoke-WebRequest "https://github.com/telegramdesktop/tdesktop/releases/expanded_assets/$($latest_tag)" -UseBasicParsing

  $re      = 'tsetup.*.exe'
  $url64     = 'https://github.com' + ($expanded_assets.links | ? {($_.href -match $re) -and ($_.outerHTML -match 'Windows 64')} | select -First 1 -expand href)
  $url32   = 'https://github.com' + ($expanded_assets.links | ? {($_.href -match $re) -and ($_.outerHTML -match 'Windows 32')} | select -First 1 -expand href)
  $version = [regex]::match((($url32 -split '\/')[-1]),'[0-9]+(\.[0-9]+)*').value
  
  

     @{
        URL64        = $url64
        URL32        = $url32
        Version      = $version
    }
}


Update-Package -ChecksumFor none -NoCheckChocoVersion