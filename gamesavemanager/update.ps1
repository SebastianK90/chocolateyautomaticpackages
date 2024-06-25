Import-Module Chocolatey-AU

$releases = 'https://www.gamesave-manager.com/'

function global:au_BeforeUpdate {
  Get-RemoteFiles -FileNameBase $($Latest.FileFullPath)
}

function global:au_SearchReplace {
    @{
          ".\tools\chocolateyInstall.ps1" = @{
          "(?i)(^\s*FileFullPath\s*=\s*`"[$]toolsPath\\).*" = "`${1}$($Latest.FileName32)`""
        }

     }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    $a = $download_page.Links | Where-Object {$_.OuterHTML -like '*Download*'}
    $r = $a.href  -replace '&amp;','&'

    $pre_url32 = 'https://www.gamesave-manager.com' + $r
    $ver_dirty = ((Invoke-WebRequest -Uri 'https://www.gamesave-manager.com/whatsnew/client/').Links | Where-Object {$_.outerText -like '*Client Update v*'} | Select-Object -First 1).innerText
    [string]$version =  [regex]::match($ver_dirty,'[0-9]+(\.[0-9]+)*').value
    
    $raw_url32 = ((Invoke-WebRequest -uri $pre_url32).ParsedHtml.getElementsByTagName('a') | ? {$_.innerhtml -like '*click here*'}).outerHTML

    $regexPattern = 'href=''(https?://[^'']*?)'''
    $url32 = [regex]::Matches($raw_url32, $regexPattern).Groups[1].Value
    
    
    return @{
      Version = $version
      URL32 = $url32
      PackageName = 'gamesavemanager'
      FileFullPath = "GameSaveManager_$($version)"
      FileType = 'zip'
    }
}

update -ChecksumFor none -NoCheckChocoVersion